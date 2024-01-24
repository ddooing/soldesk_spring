package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board") // /board 생략하기 위함
public class BoardController {
	
	@GetMapping("/main") // /board/main
	public String main() {
		return "board/main";
	}
	
	@GetMapping("/read") 
	public String read() {
		return "board/read";
	}
	
	@GetMapping("/write") // /board/main
	public String write() {
		return "board/write";
	}
	
	@GetMapping("/modify") // /board/main
	public String modify() {
		return "board/modify";
	}
}
