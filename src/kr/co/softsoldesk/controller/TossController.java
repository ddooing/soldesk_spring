package kr.co.softsoldesk.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.UserService;
@Controller
@RequestMapping("/toss")
public class TossController {
	

	@Resource(name="loginUserBean") // 로그인한 유저 알기위함
	private UserBean loginUserBean;

	@Autowired
	private UserService UserService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	String confirmUrl ="https://api.tosspayments.com/v1/payments/confirm";
	@PostMapping("/checkout_pro")
	public String checkout_pro(@ModelAttribute("tempReserveBean")ReserveBean tempReserveBean,
			@RequestParam("exhibition_id") int exhibition_id,Model model,
			RedirectAttributes redirectAttributes) {

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
		UserBean loginUserDetailBean = UserService.getLoginUserAllInfo(tempReserveBean.getUser_id());
		
		//예매하려는 전시회 제목=> orderName 찾기
		String title = exhibitionService.getExhibitionTitle(tempReserveBean.getExhibition_id());
		
		
		//결제 요청 전에 예매정보 데이터 저장
		//checkout 지점 db 저장                                  *후에 임시 저장하는 방식으로 바꾸기 
			//reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction,payment, ticket_count, order_id 저장함
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
	
	//@RequestParam String paymentType, 
	@GetMapping("/success") // 결제 요청이 성공적이였을때
    public String successPage(@RequestParam String orderId, 
            					@RequestParam String paymentKey, 
            					@RequestParam int amount,HttpServletRequest request, Model model) throws Exception  {
		
		// 결제 요청 전에 예매정보 데이터(/checkout 에서 저장한 정보)와 인증 결과(orderId,paymentKey,amount) 검증
			//1. 인증 결과인 orderId가  결제 요청전의 order_id인지 체크 
		boolean isOrderIdValid = reserveService.checkOrderId(orderId);
		
		//확인
		System.out.println("isOrderIdValid :"+isOrderIdValid);
		System.out.println("orderId :"+orderId);
		System.out.println("paymentKey :"+paymentKey);
		System.out.println("amount :"+amount);

		if(!isOrderIdValid) {
			return "toss/fail";
		}
		
		
		// 1-1. 결제 요청 전의 결제 금액인 payment 와 결제 요청 결과의 결제 금액인 amount 같은지 체크
		
		int reqBeforePayment = reserveService.getPayment(orderId);//orderId로 payment 가져오기

		if(reqBeforePayment!=amount)
		{
			System.out.println("reqBeforePayment!=amount");
			return "toss/fail";
		}
		
		
		System.out.println("reqBeforePayment==amount, 결제 승인 전");
		 //1. 결제 승인 
        ResponseEntity<String> paymentConfirmationResponse = completePayment(paymentKey, orderId, amount);
        System.out.println("결제 승인 후");
        System.out.println("결제 승인 후, paymentConfirmationResponse 코드 확인 :" + paymentConfirmationResponse.getStatusCode());
        System.out.println("결제 승인 후, paymentConfirmationResponse 헤더 확인 :" + paymentConfirmationResponse.getHeaders());
        System.out.println("결제 승인 후, paymentConfirmationResponse 응답 본문 확인 :" + paymentConfirmationResponse.getBody());
        
        
        
        if (!paymentConfirmationResponse.getStatusCode().is2xxSuccessful()) {
        	System.out.println("결제가 실패 .");
            
        }
		
        // 성공했을 때의 로직
        System.out.println("결제가 성공적으로 처리되었습니다.");
        String successWidgetInfo = prepareSuccessWidgetInfo(paymentKey, orderId, amount);
        // 여기에 성공했을 때 실행할 코드 작성
        // 예: 데이터베이스에 결제 정보 저장, 사용자에게 성공 메시지 보내기 등
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
