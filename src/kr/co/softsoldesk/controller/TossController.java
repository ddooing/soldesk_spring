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
import kr.co.softsoldesk.Beans.ReserveInfoBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.ExhibitionService;

@Controller
@RequestMapping("/toss")
public class TossController {
	
	private ReserveInfoBean reserve;

	@Resource(name="loginUserBean") // 로그인한 유저 알기위함
	private UserBean loginUserBean;

	
	

	@Autowired
    private ExhibitionService exhibitionService;
	
	
	
	@PostMapping("/checkout_pro")
	public String checkout_pro(@ModelAttribute("ReserveBean")ReserveBean ckeckreserverBean,
			@RequestParam("exhibition_id") int exhibition_id,
			RedirectAttributes redirectAttributes) {
		//int totalPrice = ckeckreserverBean.getTotal_price(); // 이 메서드로 total_price 값을 가져옵니다.

		// 0일 때 확인용
		int totalPrice=0;
		
		System.out.println("가격 : "+ totalPrice); // 포인트 사용 금액+ 티켓 총 가격 
		
		
		  // 데이터를 RedirectAttributes에 추가합니다.
	    redirectAttributes.addFlashAttribute("ReserveBean", ckeckreserverBean);
	    redirectAttributes.addFlashAttribute("exhibition_id", exhibition_id);
		//결제 금액이 0 이면 바로 예매 완료 페이지로 이동
		if(totalPrice == 0)
		{
			return "redirect:/exhibition/payment_complete";
		}
		// 결제 금액이 0이 아니면 ckeckout page로 이동
		else {
			return "toss/checkout";
		}
		
	}
	
	
	@GetMapping("/checkout")
	//@PostMapping("/checkout")
	public String checkout(@ModelAttribute("ReserveBean")ReserveBean  reserverBean, HttpServletRequest request, Model model) throws Exception  {
		//System.out.println(" check3 - reserve : "+reserve.getOrderid());
		ReserveInfoBean reserveInfo = new ReserveInfoBean();
		
		 model.addAttribute("orderid", reserveInfo.getOrderid());
		System.out.println(" check3 - reserve : "+reserveInfo.getOrderid());
		return "toss/checkout";
		
	}
	//@RequestParam String paymentType, 
	@GetMapping("/success")
    public String successPage(
            @RequestParam String orderId, 
            @RequestParam String paymentKey, 
            @RequestParam int amount,HttpServletRequest request, Model model) throws Exception  {
		//System.out.println(" success - reserve : "+reserve.getOrderid());
		//System.out.println("paymentType :"+paymentType);
		System.out.println("orderId :"+orderId);
		System.out.println("paymentKey :"+paymentKey);
		System.out.println("amount :"+amount);
        return "toss/success"; 
    }

	@GetMapping("/fail")
	public String fail( @RequestParam String message, @RequestParam String code,HttpServletRequest request, Model model) throws Exception {
		System.out.println("message :"+message);
		System.out.println("code :"+code);
	
		return "toss/fail";
		
	}
}
