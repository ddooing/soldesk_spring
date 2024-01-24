package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/mypage")
	public String login() {
		return "user/mypage";
	}
	
	@GetMapping("/review_editor")
	public String review_editor() {
		return "user/review_editor";
	}
}
