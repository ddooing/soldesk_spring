package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.Service.UserService;

@RestController
public class RestApiController {
	
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/user/checkIdExist/{id}")
	public String checkIdExist(@PathVariable String id) {
		
		boolean chi = userService.checkIdExist(id);
		return chi + "";
	}
	
	@GetMapping("/user/checkNickExist/{nick}")
	public String checkNickExist(@PathVariable String nick) {
		
		
		boolean chn = userService.checkNickExist(nick);
		return chn + "";
		
	}
	
	
}