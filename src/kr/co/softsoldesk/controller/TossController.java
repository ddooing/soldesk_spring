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
	
	@PostMapping("/checkout_pro")
	public String checkout_pro(@ModelAttribute("ReserveBean")ReserveBean ckeckreserverBean,
			@RequestParam("exhibition_id") int exhibition_id,
			RedirectAttributes redirectAttributes) {
		
		/* /exhibition/reserve 에서 
		 * <form:hidden path="total_price"
					value="${exhibitionBean.price * ReserveBean.ticket_count}" />
					를 받는 totalPrice
		 */
		//결제할 금액 
		int payment = ckeckreserverBean.getPayment();

		// 0일 때 확인용
		//int totalPrice=0;
		
		System.out.println("가격 : "+ payment); // 포인트 사용 금액+ 티켓 총 가격 
		
		
		// /exhibition/reserve 의 ReserveBean와 exhibition_id 
	    redirectAttributes.addFlashAttribute("ReserveBean", ckeckreserverBean);
	    redirectAttributes.addFlashAttribute("exhibition_id", exhibition_id);
		//결제 금액이 0 이면 바로 예매 완료 페이지로 이동
		if(payment == 0)
		{
			return "redirect:/exhibition/payment_complete";
		}
		// 결제 금액이 0이 아니면 ckeckout page로 이동
		else {
			return "redirect:/toss/checkout";
		}
		
	}
	
	
	@GetMapping("/checkout")
	//@PostMapping("/checkout")
	public String checkout(@ModelAttribute("ReserveBean") ReserveBean checkReserveBean,
            @ModelAttribute("exhibition_id") int exhibitionId,
            HttpServletRequest request, Model model) throws Exception  {
		
		//orderid 생성하기 위함 
		ReserveBean reserveInfo = new ReserveBean(); // orderid 생성위함.........
		
		//예매하려는 유저 아이디 찾기
		UserBean loginUserDetailBean = UserService.getLoginUserAllInfo(checkReserveBean.getUser_id());
		
		//예매하려는 전시회 제목=> orderName 찾기
		String title = exhibitionService.getExhibitionTitle(exhibitionId);
	
		System.out.println(" check3 - reserve : "+reserveInfo.getOrder_id());// orderid 확인
	    System.out.println("ReserveBean.payment: " + checkReserveBean.getPayment());
	    System.out.println("Exhibition ID: " + exhibitionId);

	    
		model.addAttribute("orderid", reserveInfo.getOrder_id()); 
	    model.addAttribute("ReserveBean", checkReserveBean);
	    model.addAttribute("exhibition_id", exhibitionId);
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
		
		
		System.out.println("orderId :"+orderId);
		System.out.println("paymentKey :"+paymentKey);
		System.out.println("amount :"+amount);
		
		//
        return "toss/success"; 
    }

	@GetMapping("/fail")
	public String fail( @RequestParam String message, @RequestParam String code,HttpServletRequest request, Model model) throws Exception {
		System.out.println("message :"+message);
		System.out.println("code :"+code);
	
		return "toss/fail";
		
	}
}
