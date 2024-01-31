package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Service.ExhibitionService;


public class RestApiController {

	@Autowired
	private ExhibitionService exhibitionService;
	
	@GetMapping("/exhibition/exhibition_detail/{exhibition_idx}")
	public String exhibition_detain(@PathVariable String exhibition_idx) {
		
		return "";
		
	}
	
}
