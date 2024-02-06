package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.softsoldesk.Beans.ReserveBean;

@Controller
public class PaymentController {


	@GetMapping("/exhibition/payment_complete")
	public String showPaymentComplete(@ModelAttribute("ReserveBean") ReserveBean checkReserveBean,
	                                  @ModelAttribute("exhibition_id") int exhibitionId,
	                                  Model model) {
	    // 데이터 출력
	    System.out.println("ReserveBean: " + checkReserveBean);
	    System.out.println("Exhibition ID: " + exhibitionId);

	    // 뷰에 데이터 추가
	    model.addAttribute("ReserveBean", checkReserveBean);
	    model.addAttribute("exhibition_id", exhibitionId);

	    return "exhibition/payment_complete";
	}

	
}
