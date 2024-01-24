package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


//Mapper->DAO->service->controller

@Controller
@RequestMapping("/view")
public class MainController {
	

	
	@GetMapping("/index")
	public String index() {
		
		
		
		return "view/index";
	}
}
