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
		    @RequestParam(value = "endDate", required = false) String endDate) {
		
		System.out.println("endDate : "+endDate);
		System.out.println("startDate : "+startDate);
		List<ReserveBean> reserveBean = reserveService.getReserveList();
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
