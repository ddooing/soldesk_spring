package kr.co.softsoldesk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

		if(isOrderIdValid) {
			// 1-1. 결제 요청 전의 결제 금액인 payment 와 결제 요청 결과의 결제 금액인 amount 같은지 체크
			
			int reqBeforePayment = reserveService.getPayment(orderId);//orderId로 payment 가져오기
			
			if(reqBeforePayment!=amount)
			{
				return "toss/fail";
			}
		}
		else {
			return "toss/fail";
		}
		

        return "toss/success"; 
    }

	@GetMapping("/fail")
	public String fail( @RequestParam String message, @RequestParam String code,HttpServletRequest request, Model model) throws Exception {
		System.out.println("message :"+message);
		System.out.println("code :"+code);
	
		return "toss/fail";
		
	}
}
