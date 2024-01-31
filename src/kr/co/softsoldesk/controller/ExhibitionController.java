package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Service.ExhibitionService;

@Controller
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	//@Autowired
    //private ExhibitionService exhibitionService;
	
	@GetMapping("/exhibition")
	public String exhibition(Model model) {
		
		//List<ExhibitionBean> exhibition = exhibitionService.getExhibitionInfo();
		
        //model.addAttribute("getExhibitionInfo", exhibition);
		
		return "exhibition/exhibition";
	}
	
	@GetMapping("/exhibition_click")
	public String exhibition_click() {
		return "exhibition/exhibition_click";
	}
	
	@GetMapping("/payment")
	public String payment() {
		return "exhibition/payment";
	}
	
	@PostMapping("/payment_pro")
	public String payment_pro() {
		return "exhibition/payment_pro";
	}
}