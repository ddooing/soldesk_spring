package kr.co.softsoldesk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.softsoldesk.Beans.ReserveInfoBean;

@Controller
@RequestMapping("/toss")
public class TossController {
	
	private ReserveInfoBean reserve;


	
	@GetMapping("/checkout")
	public String checkout(HttpServletRequest request, Model model) throws Exception  {
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
        return "toss/success"; // �� ���ø� ��� ��ȯ
    }

	@GetMapping("/fail")
	public String fail( @RequestParam String message, @RequestParam String code,HttpServletRequest request, Model model) throws Exception {
		System.out.println("message :"+message);
		System.out.println("code :"+code);
	
		return "toss/fail";
		
	}
}
