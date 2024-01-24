package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	
	
	@GetMapping("/exhibition_click")
	public String exhibition_click() {
		return "exhibition/exhibition_click";
	}
}
