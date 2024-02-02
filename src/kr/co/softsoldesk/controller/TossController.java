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
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/toss")
public class TossController {
	

	@Resource(name="loginUserBean") // 로그인한 유저 알기위함
	private UserBean loginUserBean;

	@Autowired
	private UserService UserService;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	//1.결제 금액 = 티켓 가격 - 포인트 사용 금액 확인 - payment jsp에서 script문에서 처리함
	//2. 결제할 금액이 0인지 여부 확인
	@PostMapping("/checkout_pro")
	public String checkout_pro(@ModelAttribute("tempReserveBean")ReserveBean tempReserveBean,
			@RequestParam("exhibition_id") int exhibition_id,Model model,
			RedirectAttributes redirectAttributes) {

		//2.결제할 금액 확인
		int payment = tempReserveBean.getPayment();
		
		/* 
		 //확인용 
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ payment); // 포인트 사용 금액+ 티켓 총 가격 
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ tempReserveBean.getReserve_date());
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ tempReserveBean.getTicket_count());
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ tempReserveBean.getPoint_deduction());
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ tempReserveBean.getOrder_id()); // 주문 번호 확인

		 */
		System.out.println("/checkout_pro 컨트롤러 -  orderid : "+ tempReserveBean.getOrder_id());
		System.out.println("/checkout_pro 컨트롤러 -  가격 : "+ tempReserveBean.getExhibition_id());
		
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
		//String title = exhibitionService.getExhibitionTitle(exhibitionId);
		String title = exhibitionService.getExhibitionTitle(tempReserveBean.getExhibition_id());
		
		//확인
		System.out.println(" /checkout - tempReserveBean oderid : "+tempReserveBean.getOrder_id());
	    System.out.println(" /checkout ReserveBean.payment: " + tempReserveBean.getPayment());
	    //System.out.println("/checkout Exhibition ID: " + exhibitionId);

	    
		model.addAttribute("orderid", tempReserveBean.getOrder_id()); 
		
	    model.addAttribute("tempReserveBean", tempReserveBean);
	    model.addAttribute("exhibition_id", tempReserveBean.getExhibition_id());
	    model.addAttribute("loginUserDetailBean",loginUserDetailBean);
	    model.addAttribute("title",title);
	    
	    
		return "toss/checkout";
		
	}
	
	//@RequestParam String paymentType, 
	@GetMapping("/success")
    public String successPage(
            @RequestParam String orderId, 
            @RequestParam String paymentKey, 
            @RequestParam int amount,HttpServletRequest request, Model model) throws Exception  {
		
		//1.결제 승인 전 
		
		
		System.out.println("orderId :"+orderId);
		System.out.println("paymentKey :"+paymentKey);
		System.out.println("amount :"+amount);
		
		//2.결제 승인 처리 
		
		
		//3.결제 승인 후
        return "toss/success"; 
    }

	@GetMapping("/fail")
	public String fail( @RequestParam String message, @RequestParam String code,HttpServletRequest request, Model model) throws Exception {
		System.out.println("message :"+message);
		System.out.println("code :"+code);
	
		return "toss/fail";
		
	}
}
