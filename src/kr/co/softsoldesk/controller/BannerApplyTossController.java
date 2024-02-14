package kr.co.softsoldesk.controller;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminService;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.PointDetailService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.ReviewService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/bannertoss")
public class BannerApplyTossController {
	@Resource(name="loginUserBean") // 로그인한 유저 알기위함
	private UserBean loginUserBean;

	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;
	
	
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private ExhibitionService exhibitionService;
	@Autowired
	PointDetailService pointDetailService;
	
	@Autowired
	private ReviewService reviewService;
	String confirmUrl ="https://api.tosspayments.com/v1/payments/confirm";
	
	String failmsg="";
	
	private int plusPoint=0; // 적립되는 포인트 
	private int exhibitionId=0;// fail 시 다시 전시회 정보 페이지 가기 위함
	//에러 코드 재현할때 사용함
	String testCode = "PROVIDER_ERROR"; // 에러 테스트용 코드
	
	
	@PostMapping("/checkout")
	public String checkout(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean,
            				HttpServletRequest request, Model model) throws Exception  {
		
		//신청하려는 유저 아이디 찾기
		UserBean loginUserDetailBean = userService.getLoginUserAllInfo(applybannerBean.getApply_person_id());
		
		String title="";
		//신청하려는 상품
		if(applybannerBean.getBanner_type()==1)
		{
			title="메인배너";
		}else if(applybannerBean.getBanner_type()==2)
		{
			title="서브배너";
		}
		
		//결제 요청 전에 예매정보 데이터 저장
		
		adminService.insertbanner_apply(applybannerBean);
		
		
		//확인
		System.out.println(" /checkout - tempReserveBean oderid : "+ applybannerBean.getOrder_id());
	    System.out.println(" /checkout ReserveBean.payment: " + applybannerBean.getPayment());
	    System.out.println("/checkout Exhibition ID: " + applybannerBean.getExhibition_id());
		
	    
		model.addAttribute("orderid", applybannerBean.getOrder_id()); 
	    model.addAttribute("applybannerBean", applybannerBean);
	    model.addAttribute("loginUserDetailBean",loginUserDetailBean);
	    model.addAttribute("title",title);
	    
	    
		return "bannertoss/checkout";
	}
	
	//[결제 요청 성공이였을 때]
	//@RequestParam String paymentType, 
	@GetMapping("/success") 
    public String successPage(@RequestParam String orderId, 
            					@RequestParam String paymentKey, 
            					@RequestParam int amount,HttpServletRequest request, Model model,
            					RedirectAttributes redirectAttributes) throws Exception  {
		
		System.out.println("orderId :"+orderId);
		System.out.println("paymentKey :"+paymentKey);
		System.out.println("amount :"+amount);

		// [1].결제 요청 전에 예매정보 데이터(/checkout 에서 저장한 정보)와 인증 결과(orderId,paymentKey,amount) 검증
		ReserveBean validReserveBean = reserveService.validcheckOrderId(orderId);
		String  isOrderIdValid=validReserveBean.getOrder_id();
		
		//확인
		System.out.println("isOrderIdValid :"+isOrderIdValid);

		
			// (1 결과 : false): 다를 경우, 실패 페이지로 이동 
		if(isOrderIdValid==null) {// pay_approval_state : 승인 거부 0 인 상태
			failmsg="주문번호 오류가 발생했습니다.";
            redirectAttributes.addFlashAttribute("failmsg", failmsg);    
            return "redirect:/exhibition/exhibition_click?exhibition_id="+validReserveBean.getExhibition_id(); 
		}

			//(1 결과  : true)

		//[2].결제 요청 전의 결제 금액인 payment 와 결제 요청 결과의 결제 금액인 amount 같은지 체크		
		int reqBeforePayment = validReserveBean.getPayment();

			//(2 결과 : false): 실패 페이지로 이동
		if(reqBeforePayment!=amount)//pay_approval_state : 승인 거부 0 인 상태
		{
			failmsg="결제금액 오류가 발생했습니다.";
            redirectAttributes.addFlashAttribute("failmsg", failmsg);    
            return "redirect:/exhibition/exhibition_click?exhibition_id="+validReserveBean.getExhibition_id();  
		}
		
			//(2 결과: true) :결제 승인 요청 전에 db 저장 
		System.out.println("reqBeforePayment==amount, 결제 승인 전");
		
		//[3]. 결제 승인 
        ResponseEntity<String> paymentConfirmationResponse = completePayment(paymentKey, orderId, amount);
        System.out.println("결제 승인 후");
        System.out.println("결제 승인 후, paymentConfirmationResponse 코드 확인 :" + paymentConfirmationResponse.getStatusCode());
        System.out.println("결제 승인 후, paymentConfirmationResponse 헤더 확인 :" + paymentConfirmationResponse.getHeaders());
        System.out.println("결제 승인 후, paymentConfirmationResponse 응답 본문 확인 :" + paymentConfirmationResponse.getBody());
 
        //(3 결과 : 승인 실패 )
        if (!paymentConfirmationResponse.getStatusCode().is2xxSuccessful()) {
        	System.out.println("승인 실패!");
        	// Response 바디에서 JSON 파싱
            String responseBody = paymentConfirmationResponse.getBody();
            JSONObject jsonObject = new JSONObject(responseBody);
            String code = jsonObject.optString("code", "Unknown"); // 기본값 설정
            String message = jsonObject.optString("message", "No message provided");

            if ("ALREADY_PROCESSED_PAYMENT".equals(code)) {
                failmsg="이미 처리된 결제입니다.";
                redirectAttributes.addFlashAttribute("failmsg", failmsg);
                return "redirect:/mypage/reservelist?user_id="+validReserveBean.getUser_id();
            }
            
            failmsg=message;
            System.out.println("failmsg : "+failmsg);
            redirectAttributes.addFlashAttribute("failmsg", failmsg);
            
            return "redirect:/exhibition/exhibition_click?exhibition_id="+validReserveBean.getExhibition_id();   
        }
        
        
        //(3 결과 : 승인 성공 )=> 핸드폰에서 '@@ 원 결제'  알림 뜨는거
        
        	//#DB 저장 - orderId인 pay_approval_state : 승인 상태 true로 update &  paymentKey 저장 
      	reserveService.approvalBefore(orderId,paymentKey); // !paymentKey 못잡는 이슈 발생 

        //응답 본문 가져오기
        String responseBody = paymentConfirmationResponse.getBody();
        JSONObject jsonObject = new JSONObject(responseBody);
        
        	//응답(payment 객체)에서 requestedAt(주문 날짜+시간), approvedAt(결제 승인 날짜+시간) 추출하기 
        String approvedAt = jsonObject.getString("approvedAt");
        String requestedAt = jsonObject.getString("requestedAt");
       // String method  = jsonObject.getString("method");
        
        String method = jsonObject.getString("method");
        byte[] bytes = method.getBytes(StandardCharsets.ISO_8859_1);
        method = new String(bytes, StandardCharsets.UTF_8);
        
        System.out.println("orderName: " + method);
        System.out.println("approvedAt: " + approvedAt);
        System.out.println("requestedAt: " + requestedAt);
        
    
    	// #DB 저장 ................................... 함수 ) 0원일때랑 합치기 
	        // 1.orderId인 예매가 정말로 되었음 
        		// 결제 방법 저장 
    			//pay_state 결제 상태 :true 로 update &  state(0:예매,1: 예매 취소) 예매가 되었음을 0으로 저장,예매한 날짜
	     		//requestAt 주문 날짜 + 시간 저장 
        		// approvedAt 결제 승인 날짜+시간 저장
        reserveService.realReserveState(orderId,requestedAt,approvedAt,method  ); 

        	// 2.나머지 db 처리
        addService(validReserveBean);
        
        //결제된 예매 정보 가져오기 
        ReserveBean reserveInfoBean =reserveService.validcheckOrderId(orderId);
		
        System.out.println("결제가 성공적으로 처리되었습니다.");
        
        ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(reserveInfoBean.getExhibition_id());
       
        System.out.println("validReserveBean.getRequested_at() : "+reserveInfoBean.getRequested_at());
        System.out.println("validReserveBean.getReserve_date() : "+reserveInfoBean.getReserve_date());
        System.out.println("결제가 성공적으로 처리되었습니다.");
        System.out.println("pluspoint : "+plusPoint);
        
        model.addAttribute("exhibitionBean", exhibitionBean);
        model.addAttribute("tempReserveBean",reserveInfoBean);
        model.addAttribute("plusPoint", plusPoint);
        
        return "toss/success";
   
    }

	private void addService(ReserveBean reserveBean) {
		
		 //user_id 값
        int userid = reserveBean.getUser_id();
        int totalPrice =reserveBean.getTotal_price();
		 // 2.사용자 포인트 내역 저장 
        
        
	    		// 2-1.무조건 포인트 적립
			    // 포인트 적립 : 유저 등급의 적립율에 따른 포인트 지급 
        //!! payment의 포인트 부분 겹침 -- 후에 처리하기 
        String level = userService.getLevel(userid);
        int reservePulsPoint=0;// 예매 시 적립되는 포인트
        
        
        if(level.equals("level1")) // 레벨 1 일때 5%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.05);
        }
        else if(level.equals("level2")) // 레벨 2 일때 10%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.1);
        }
        else if(level.equals("level3")) // 레벨 3 일때 15%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.15);
        }
        
        plusPoint= reservePulsPoint; 
        
        PointDetailBean pointDetailBean =new PointDetailBean(); 
        pointDetailBean.setPoint(reservePulsPoint);
        pointDetailBean.setUser_id(userid);
        pointDetailBean.setPoint_state_code(1);	// 포인트 1:+
        pointDetailBean.setPoint_type_code(1);	// 예매에서 적립
        
        
		// 포인트 이용 내역 추가
		pointDetailService.PointList(pointDetailBean);
        
        		// 2-2. point_deduction(=포인트 사용금액) >0 이면 사용 내역 추가 
        		//  point_state_code NUMBER(1)- 사용 OR 적립 EX)0:-, 1:+ 
		if(reserveBean.getPoint_deduction() > 0)
		{
			 PointDetailBean pointUseDetailBean =new PointDetailBean();
		     
			 pointUseDetailBean.setPoint(reserveBean.getPoint_deduction());
			 pointUseDetailBean.setUser_id(userid);
			 pointUseDetailBean.setPoint_state_code(0);	// 포인트 1:+
			 pointUseDetailBean.setPoint_type_code(1);	// 예매에서 적립
			 
			// 포인트 이용 내역 추가
			pointDetailService.PointList(pointUseDetailBean);
		}

	        // 3. 사용자 포인트와 경험치 exp 적립 update 
			// 경험치 ) 예매 시 + 50
        	// 포인트 )최종적으로 사용자의 현재 포인트에 추가 혹은 감소 할 포인트 금액 = 예매 시 받는 포인트 - 포인트 사용 금액
		int point = reservePulsPoint - reserveBean.getPoint_deduction();
        
        userService.point_expIncrease(userid,point);
        
        	// 4. 전시회에 대한 소감문 생성 
        //
        reviewService.reserve_review_create(reserveBean.getReserve_id());
    		// 5.전시회 티켓수를 사용자가 구매한 티켓수만큼 증가		
        											// 예매한 전시회 id			       			//예매한 티켓 수 int 값
        exhibitionService.increase_exhibitionTotalTicket(reserveBean.getExhibition_id(),reserveBean.getTicket_count());
 
        System.out.println("add service 처리 완료 ");
	}
	
	private ResponseEntity<String> completePayment(String paymentKey, String orderId, int amount) {
        try {
            HttpHeaders headers = new HttpHeaders();

            String apiKey = "test_sk_mBZ1gQ4YVX9wG14ZXOLarl2KPoqN";
            // 기본 인증을 위한 API 키를 Base64로 인코딩
            String encodedApiKey = Base64.getEncoder().encodeToString((apiKey + ":").getBytes("UTF-8"));
            headers.set("Authorization", "Basic " + encodedApiKey);
            headers.set("Content-Type", "application/json");  
            
            //에러 재현하기 
            //headers.set("TossPayments-Test-Code",testCode);

            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("paymentKey", paymentKey);
            requestBody.put("orderId", orderId);
            requestBody.put("amount", amount);
            
            System.out.println("Map");
            
            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            System.out.println("HTTP POST 요청 전");
            // HTTP POST 요청하기
            RestTemplate restTemplate = new RestTemplate();
            return restTemplate.exchange(confirmUrl, HttpMethod.POST, requestEntity, String.class);
        } catch (Exception e) {
        	 return ResponseEntity
        	            .status(((HttpStatusCodeException) e).getStatusCode())
        	            .body(((RestClientResponseException) e).getResponseBodyAsString());
            //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error completing payment");
        }
	}
	
	
	
}
