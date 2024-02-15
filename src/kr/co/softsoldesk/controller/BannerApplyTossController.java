package kr.co.softsoldesk.controller;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
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
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BannerService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/banner")
public class BannerApplyTossController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BannerService bannerSerivce;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	String confirmUrl ="https://api.tosspayments.com/v1/payments/confirm";
	
	String failmsg="";
	

	//에러 코드 재현할때 사용함
	String testCode = "PROVIDER_ERROR"; // 에러 테스트용 코드
	
	// 인덱스 -> 배너 등록 페이지 매핑
	@GetMapping("/bannerapply")
	public String bannerapply() {
		return "/banner/bannerapply";
	}
	
	
	// 배너 견적 신청
	@GetMapping("/mainbannerapplyform")
	public String mainbannerapplyform(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = userService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = bannerSerivce.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/banner/mainbannerapplyform";
	}
	
	// 서브 배너 매핑
	@GetMapping("/subbannerapplyform")
	public String estimate2(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = userService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = bannerSerivce.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/banner/subbannerapplyform";
	}
	
	@PostMapping("/checkout")
	public String checkout(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean,
            				HttpServletRequest request, Model model) throws Exception  {
		
		//신청하려는 유저 아이디 찾기
		UserBean loginUserDetailBean = userService.getLoginUserAllInfo(applybannerBean.getApply_person_id());
		
		String title="";
		// 파일저장 및 banner_file_id set
		//신청하려는 상품
		if(applybannerBean.getBanner_file().getSize()>0) {
			
			if(applybannerBean.getBanner_type()==1)
			{
				title="메인배너";
				bannerSerivce.addfiletableBannerBannerApplyFormBean(applybannerBean);
			}else if(applybannerBean.getBanner_type()==2)
			{
				title="서브배너";
				bannerSerivce.addfiletableBannerSubBannerApplyFormBean(applybannerBean);
			}
			
		} 
				

		//결제 요청 전에 예매정보 데이터 저장
		
		bannerSerivce.insertbanner_apply(applybannerBean);
		
		
		//확인
		System.out.println(" /checkout - tempReserveBean oderid : "+ applybannerBean.getOrder_id());
	    System.out.println(" /checkout ReserveBean.payment: " + applybannerBean.getPayment());
	    System.out.println("/checkout Exhibition ID: " + applybannerBean.getExhibition_id());
		
	    
		model.addAttribute("orderid", applybannerBean.getOrder_id()); 
	    model.addAttribute("applybannerBean", applybannerBean);
	    model.addAttribute("loginUserDetailBean",loginUserDetailBean);
	    model.addAttribute("title",title);
	    
	    
		return "banner/checkout";
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
		BannerApplyFormBean validBannerBean = bannerSerivce.validcheckOrderId(orderId);
		String  isOrderIdValid=validBannerBean.getOrder_id();
		
		//확인
		System.out.println("isOrderIdValid :"+isOrderIdValid);
		
		//돌아갈 폼 페이지 
		String formUrl="";
		if(validBannerBean.getBanner_type()==1)//메인배너를 신청했을 경우
		{
			formUrl="mainbannerapplyform";
		}
		else if(validBannerBean.getBanner_type()==2)//서브배너를 신청했을 경우
		{
			formUrl="subbannerapplyform";
		}

		
			// (1 결과 : false): 다를 경우, 배너 신청폼 페이지로 이동 
		if(isOrderIdValid!=null) {// pay_approval_state : 승인 거부 0 인 상태 isOrderIdValid==null
			failmsg="주문번호 오류가 발생했습니다.";
            redirectAttributes.addFlashAttribute("failmsg", failmsg);    
            return "redirect:/banner/"+formUrl;
		}

		
			//(1 결과  : true)

		//[2].결제 요청 전의 결제 금액인 payment 와 결제 요청 결과의 결제 금액인 amount 같은지 체크		
		int reqBeforePayment = validBannerBean.getPayment();

			//(2 결과 : false): 실패 페이지로 이동
		if(reqBeforePayment==amount)//pay_approval_state : 승인 거부 0 인 상태
		{
			failmsg="결제금액 오류가 발생했습니다.";
            redirectAttributes.addFlashAttribute("failmsg", failmsg);    
            return "redirect:/banner/"+formUrl;
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
                return "redirect:/view/index";
            }
            
            failmsg=message;
            System.out.println("failmsg : "+failmsg);
            redirectAttributes.addFlashAttribute("failmsg", failmsg);
            
            return "redirect:/banner/"+formUrl;
        }
        
        
        //(3 결과 : 승인 성공 )=> 핸드폰에서 '@@ 원 결제'  알림 뜨는거
        

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
        bannerSerivce.realPaymentState(orderId,requestedAt,approvedAt,method,paymentKey); 

       
        
        //결제된 예매 정보 가져오기 
        BannerApplyFormBean bannerPaymentInfoBean =bannerSerivce.getBannerPaymentInfo(orderId);
		
        System.out.println("결제가 성공적으로 처리되었습니다.");

        System.out.println("validReserveBean.getRequested_at() : "+bannerPaymentInfoBean.getRequested_at());
        System.out.println("validReserveBean.getBanner_type() : "+bannerPaymentInfoBean.getBanner_type());
        System.out.println("결제가 성공적으로 처리되었습니다.");
        

        model.addAttribute("bannerPaymentInfoBean",bannerPaymentInfoBean);
        
        return "banner/success";
   
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
