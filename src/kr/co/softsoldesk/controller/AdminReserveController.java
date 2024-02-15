package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Service.ReserveService;

@Controller
@RequestMapping("/adminPayment")
public class AdminReserveController {
	
	
	@Autowired
	private ReserveService reserveService;
	
	
	@GetMapping("/manager_reservelist")
	public String exhibition(Model model,
			@RequestParam(value = "startDate", required = false) String startDate,
		    @RequestParam(value = "endDate", required = false) String endDate,
		    @RequestParam(value = "payment_method", required = false) String payment_method,
		    @RequestParam(value = "exhibition_title", required = false) String exhibition_title,
		    @RequestParam(value = "user", required = false) String user_name) {
		
		System.out.println("endDate : "+endDate);
		System.out.println("startDate : "+startDate);
		System.out.println("payment_method : "+payment_method);
		System.out.println("exhibition_title : "+exhibition_title);
		System.out.println("user_name : "+user_name);
		
		//첫 결제 내역 날짜 받기
		String firstPayDate = reserveService.getFirstPayDate();
		model.addAttribute("firstPayDate", firstPayDate);
		
		
		if(endDate !=null)
		{
			endDate = endDate +" 23:59:59";
		}
		List<ReserveBean> reserveBean = reserveService.getReserveList(startDate,endDate,payment_method,exhibition_title,user_name);
		model.addAttribute("reserveBean", reserveBean);
		return "adminPayment/manager_reservelist";
	}
	
	@GetMapping("/reserve_cancle")
	public String reserve_cancle(Model model,@RequestParam("reserve_id") int reserve_id,RedirectAttributes redirectAttributes ) {

		//취소 처리하기
		
		redirectAttributes.addFlashAttribute("canceled", true);
		return "redirect:/adminPayment/manager_reservelist";
	}
}
