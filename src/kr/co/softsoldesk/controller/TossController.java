package kr.co.softsoldesk.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.PointDetailService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.ReviewService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/toss")
public class TossController {
	

	@Resource(name="loginUserBean") // 로그인한 유저 알기위함
	private UserBean loginUserBean;

	@Autowired
	private UserService userService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	@Autowired
	PointDetailService pointDetailService;
	
	@Autowired
	private ReviewService reviewService;
	
	String confirmUrl ="https://api.tosspayments.com/v1/payments/confirm";
	
	
	@PostMapping("/checkout_pro")
	public String checkout_pro(@ModelAttribute("tempReserveBean")ReserveBean tempReserveBean,
				Model model,RedirectAttributes redirectAttributes) {

		//결제할 금액 확인
		int payment = tempReserveBean.getPayment();
		
		/* 
		 //확인용 
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ payment); // 포인트 사용 금액+ 티켓 총 가격 
		System.out.println("/checkout_pro 컨트롤러 -  예매날짜 : "+ tempReserveBean.getReserve_date());
		System.out.println("/checkout_pro 컨트롤러 -  티켓 수 : "+ tempReserveBean.getTicket_count());
		System.out.println("/checkout_pro 컨트롤러 -  포인트 사용금액 : "+ tempReserveBean.getPoint_deduction());
		System.out.println("/checkout_pro 컨트롤러 -  주문번호 : "+ tempReserveBean.getOrder_id()); // 주문 번호 확인
		System.out.println("/checkout_pro 컨트롤러 -  orderid : "+ tempReserveBean.getOrder_id());
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ tempReserveBean.getExhibition_id());
		
		 */
		
		//결제 금액이 0 이면 바로 예매 완료 페이지로 이동
		if(payment == 0)
		{
			//1. 예매 정보 저장 
			//reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction,payment, ticket_count, order_id 저장함
			//pay_state(결제 상태),pay_approval_state(결제 승인 상태) 기본으로 0(false)로 .. 결제 요청하지 않기때문
			// state 값을 1(예매 되었음)로
		reserveService.paymentZeroReserveInfo(tempReserveBean); 
		
		//저장된 예매 정보 부르기 .. reserve_id를 가져오기 위함 
		System.out.println("/toss_pro - orderid :"+tempReserveBean.getOrder_id());
		ReserveBean reserveInfoBean =reserveService.validcheckOrderId(tempReserveBean.getOrder_id());
		
		// 2. 나머지 저장 
		addService(reserveInfoBean);
	
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(reserveInfoBean.getExhibition_id());
	    

        model.addAttribute("exhibitionBean", exhibitionBean);
        model.addAttribute("tempReserveBean",reserveInfoBean);
		
		return "/exhibition/payment_complete";
		}
		// 결제 금액이 0이 아니면 ckeckout page로 이동
		else {
			//tempReserveBean,exhibition_id 정보 넘기기
			redirectAttributes.addFlashAttribute("tempReserveBean", tempReserveBean);
	        return "redirect:/toss/checkout";
		}
		
	}
	
	
	@GetMapping("/checkout")
	//@PostMapping("/checkout")
	public String checkout(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean,
            				HttpServletRequest request, Model model) throws Exception  {
		
		//예매하려는 유저 아이디 찾기
		UserBean loginUserDetailBean = userService.getLoginUserAllInfo(tempReserveBean.getUser_id());
		
		//예매하려는 전시회 제목=> orderName 찾기
		String title = exhibitionService.getExhibitionTitle(tempReserveBean.getExhibition_id());
		
		
		//결제 요청 전에 예매정보 데이터 저장
		//checkout 지점 db 저장                                  *후에 임시 저장하는 방식으로 바꾸기 
			//reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction,payment, ticket_count, order_id 저장함
			//pay_state(결제 상태),pay_approval_state(결제 승인 상태) 기본으로 0(false)로 저장함 
		reserveService.checkoutReserveInfo(tempReserveBean);
		
		/*
		//확인
		System.out.println(" /checkout - tempReserveBean oderid : "+tempReserveBean.getOrder_id());
	    System.out.println(" /checkout ReserveBean.payment: " + tempReserveBean.getPayment());
	    System.out.println("/checkout Exhibition ID: " + tempReserveBean.getExhibition_id());
		*/
	    
		model.addAttribute("orderid", tempReserveBean.getOrder_id()); 
	    model.addAttribute("tempReserveBean", tempReserveBean);
	    model.addAttribute("exhibition_id", tempReserveBean.getExhibition_id());
	    model.addAttribute("loginUserDetailBean",loginUserDetailBean);
	    model.addAttribute("title",title);
	    
	    
		return "toss/checkout";
		
	}
	//[결제 요청 성공이였을 때]
	//@RequestParam String paymentType, 
	@GetMapping("/success") 
    public String successPage(@RequestParam String orderId, 
            					@RequestParam String paymentKey, 
            					@RequestParam int amount,HttpServletRequest request, Model model) throws Exception  {
		
		System.out.println("orderId :"+orderId);
		System.out.println("paymentKey :"+paymentKey);
		System.out.println("amount :"+amount);
		
		// [1].결제 요청 전에 예매정보 데이터(/checkout 에서 저장한 정보)와 인증 결과(orderId,paymentKey,amount) 검증
		String  isOrderIdValid = reserveService.checkOrderId(orderId);

		//확인
		System.out.println("isOrderIdValid :"+isOrderIdValid);

		
			// (1 결과 : false): 다를 경우, 실패 페이지로 이동 
		if(isOrderIdValid==null) {// pay_approval_state : 승인 거부 0 인 상태
			return "toss/fail";
		}

			//(1 결과  : true): orderId를 통해 reserve 정보 가져오기  
		ReserveBean validReserveBean = reserveService.validcheckOrderId(orderId);
		
			//validReserveBean 확인 
		System.out.println("validReserveBean.payment :"+validReserveBean.getPayment());
		System.out.println("validReserveBean.user_id :"+validReserveBean.getUser_id());
		System.out.println("validReserveBean.exhibition_id :"+validReserveBean.getExhibition_id());
		//reserve_id 확인
		System.out.println("validReserveBean.reserve_id :"+validReserveBean.getReserve_id());

		//[2].결제 요청 전의 결제 금액인 payment 와 결제 요청 결과의 결제 금액인 amount 같은지 체크		
		int reqBeforePayment = validReserveBean.getPayment();

			//(2 결과 : false): 실패 페이지로 이동
		if(reqBeforePayment!=amount)//pay_approval_state : 승인 거부 0 인 상태
		{
			System.out.println("reqBeforePayment!=amount");
			return "toss/fail";
		}
		
			//(2 결과: true) :결제 승인 요청 전에 db 저장 
		System.out.println("reqBeforePayment==amount, 결제 승인 전");
		//#DB 저장 - orderId인 pay_approval_state : 승인 상태 true로 update &  paymentKey 저장 
		reserveService.approvalBefore(orderId,paymentKey); // !paymentKey 못잡는 이슈 발생 

		
		//[3]. 결제 승인 
        ResponseEntity<String> paymentConfirmationResponse = completePayment(paymentKey, orderId, amount);
        System.out.println("결제 승인 후");
        System.out.println("결제 승인 후, paymentConfirmationResponse 코드 확인 :" + paymentConfirmationResponse.getStatusCode());
        System.out.println("결제 승인 후, paymentConfirmationResponse 헤더 확인 :" + paymentConfirmationResponse.getHeaders());
        System.out.println("결제 승인 후, paymentConfirmationResponse 응답 본문 확인 :" + paymentConfirmationResponse.getBody());

        //(3 결과 : 승인 실패 )
        if (!paymentConfirmationResponse.getStatusCode().is2xxSuccessful()) {
        	System.out.println("승인 실패 .");// pay_state 결제 상태 :false 
        	return "toss/fail";
            
        }
        
        
        //(3 결과 : 승인 성공 )=> 핸드폰에서 '@@ 원 결제'  알림 뜨는거
        
        //응답 본문 가져오기
        String responseBody = paymentConfirmationResponse.getBody();
        JSONObject jsonObject = new JSONObject(responseBody);
        
        /*
        	//응답(payment 객체)에서 orderName 추출하기 .. = 예매한 전시회 title과 같음
        String orderName = jsonObject.getString("orderName");
        byte[] bytes = orderName.getBytes(StandardCharsets.ISO_8859_1);
        orderName = new String(bytes, StandardCharsets.UTF_8);
        System.out.println("orderName: " + orderName);
        */
        	//응답(payment 객체)에서 approvedAt(결제 승인 날짜) 추출하기 
        String approvedAt = jsonObject.getString("approvedAt");
        System.out.println("approvedAt: " + approvedAt);
        // Date 날짜 정보만 파싱
        LocalDate parsedDate = LocalDate.parse(approvedAt, DateTimeFormatter.ISO_OFFSET_DATE_TIME);
        // java.sql.Date로 변환
        Date sqlDate = Date.valueOf(parsedDate);
        System.out.println("sqlDate: " + sqlDate);
        
        // DateTime 날짜 + 시간  파싱
        LocalDateTime parsedApprovedAt = LocalDateTime.parse(approvedAt, DateTimeFormatter.ISO_OFFSET_DATE_TIME);
	     // LocalDateTime을 java.sql.Timestamp로 변환
	     Timestamp timestampApprovedAt = Timestamp.valueOf(parsedApprovedAt);
	     System.out.println("timestampApprovedAt: " + timestampApprovedAt);
	     
       
    	// #DB 저장 ................................... 함수 ) 0원일때랑 합치기 
	        // 1.orderId인 예매가 정말로 되었음 
    			//pay_state 결제 상태 :true 로 update &  state(0:예매,1: 예매 취소) 예매가 되었음을 0으로 저장,예매한 날짜
        reserveService.realReserveState(orderId); 
	      
        
        /*
        
	        // 2.사용자 포인트 내역 저장 
        int totalPrice = validReserveBean.getTotal_price();
        
	    		// 2-1.무조건 포인트 적립
			    // 포인트 적립 : 유저 등급의 적립율에 따른 포인트 지급 
        String level = userService.getLevel(userid);
        int reservePulsPoint=0;// 예매 시 적립되는 포인트
        
        
        if(level.equals("level1")) // 레벨 1 일때 10%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.1);
        }
        else if(level.equals("level2")) // 레벨 2 일때 15%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.15);
        }
        else if(level.equals("level3")) // 레벨 3 일때 20%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.2);
        }
        
        PointDetailBean pointDetailBean =new PointDetailBean();
			     
        pointDetailBean.setPoint(reservePulsPoint);
        pointDetailBean.setUser_id(userid);
        pointDetailBean.setPoint_state_code(1);	// 포인트 1:+
        pointDetailBean.setPoint_type_code(1);	// 예매에서 적립
        pointDetailBean.setRegdate(approvedAt);
        
        
		// 포인트 이용 내역 추가
		pointDetailService.PointList(pointDetailBean);
        
        		// 2-2. point_deduction(=포인트 사용금액) >0 이면 사용 내역 추가 
        		//  point_state_code NUMBER(1)- 사용 OR 적립 EX)0:-, 1:+ 
		if(validReserveBean.getPoint_deduction() > 0)
		{
			 PointDetailBean pointUseDetailBean =new PointDetailBean();
		     
			 pointUseDetailBean.setPoint(validReserveBean.getPoint_deduction());
			 pointUseDetailBean.setUser_id(userid);
			 pointUseDetailBean.setPoint_state_code(0);	// 포인트 1:+
			 pointUseDetailBean.setPoint_type_code(1);	// 예매에서 적립
			 
			// 포인트 이용 내역 추가
			pointDetailService.PointList(pointUseDetailBean);
		}

	        // 3. 사용자 포인트와 경험치 exp 적립 update 
			// 경험치 ) 예매 시 + 50
        	// 포인트 )최종적으로 사용자의 현재 포인트에 추가 혹은 감소 할 포인트 금액 = 예매 시 받는 포인트 - 포인트 사용 금액
		int point = reservePulsPoint - validReserveBean.getPoint_deduction();
        
        userService.point_expIncrease(userid,point);
        
        	// 4. 전시회에 대한 소감문 생성 
        //
        reviewService.reserve_review_create(validReserveBean.getReserve_id());
    		// 5.전시회 티켓수를 사용자가 구매한 티켓수만큼 증가		
        											// 예매한 전시회 id			       			//예매한 티켓 수 int 값
        exhibitionService.increase_exhibitionTotalTicket(validReserveBean.getExhibition_id(),validReserveBean.getTicket_count());
        
        	*/
        // 나머지 db 처리
        addService(validReserveBean);
        
        System.out.println("결제가 성공적으로 처리되었습니다.");
        
        ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(validReserveBean.getExhibition_id());
	    
        String successWidgetInfo = prepareSuccessWidgetInfo(paymentKey, orderId, amount);
        
        model.addAttribute("exhibitionBean", exhibitionBean);
        model.addAttribute("validReserveBean",validReserveBean);
        model.addAttribute("successWidgetInfo", successWidgetInfo);
        
        return "toss/success";
   
    }

	@GetMapping("/fail")
	public String fail( @RequestParam String message, @RequestParam String code,HttpServletRequest request, Model model) throws Exception {
		System.out.println("message :"+message);
		System.out.println("code :"+code);
	
		return "toss/fail";
		
	}
	

	
	private String prepareSuccessWidgetInfo(String paymentKey, String orderId, int amount) {
	    // "/success"가 위젯이 포함된 결제 성공 페이지가 렌더링되는 URL이라고 가정합니다.
	    String successUrl 
	    ="http://localhost:8080/Spring_Project_Dream/toss/success?orderId=" + orderId + "&amount=" + amount + "&paymentKey=" + paymentKey;
	    return successUrl;
	}
	
	
	private void addService(ReserveBean reserveBean) {
		
		 //user_id 값
        int userid = reserveBean.getUser_id();
        
       
       
		 // 2.사용자 포인트 내역 저장 
        int totalPrice = reserveBean.getTotal_price();
        
	    		// 2-1.무조건 포인트 적립
			    // 포인트 적립 : 유저 등급의 적립율에 따른 포인트 지급 
        String level = userService.getLevel(userid);
        int reservePulsPoint=0;// 예매 시 적립되는 포인트
        
        
        if(level.equals("level1")) // 레벨 1 일때 10%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.1);
        }
        else if(level.equals("level2")) // 레벨 2 일때 15%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.15);
        }
        else if(level.equals("level3")) // 레벨 3 일때 20%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.2);
        }
        
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
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error completing payment");
        }
	}
}
