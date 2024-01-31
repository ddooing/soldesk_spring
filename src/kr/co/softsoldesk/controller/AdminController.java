package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/manager_dashboard") 
	public String manager_dashboard() {
		return "admin/manager_dashboard";
	}
	
	@GetMapping("/manager_accountmanager") 
	public String manager_accountmanager() {
		return "admin/manager_accountmanager";
	}
	
	@GetMapping("/manager_accountdetail") 
	public String manager_accountdetail() {
		return "admin/manager_accountdetail";
	}
	
	@GetMapping("/manager_boardlist")
	public String manager_boardlist() {
		return "admin/manager_boardlist";
	}
	
	@GetMapping("/manager_boardlook") 
	public String manager_boardlook() {
		return "admin/manager_boardlook";
	}
	
	@GetMapping("/manager_boardwrite") 
	public String manager_boardwrite() {
		return "admin/manager_boardwrite";
	}
	
	@GetMapping("/manager_exhibitionadd") 
	public String manager_exhibitionadd() {
		return "admin/manager_exhibitionadd";
	}
	
	@GetMapping("/manager_exhibitionapplylist") 
	public String manager_exhibitionapplylist() {
		return "admin/manager_exhibitionapplylist";
	}
	
	@GetMapping("/manager_bannerlist") 
	public String manager_exhibitionlist() {
		return "admin/manager_exhibitionlist";
	}
	
	@GetMapping("/manager_exhibitionmodify") 
	public String manager_exhibitionmodify() {
		return "admin/manager_exhibitionmodify";
	}
	
	@GetMapping("/manager_noticemanage") 
	public String manager_noticemanage() {
		return "admin/manager_noticemanage";
	}
	
	@GetMapping("/manager_noticemodify") 
	public String manager_noticemodify() {
		return "admin/manager_noticemodify";
	}
	
	@GetMapping("/manager_noticewrite") 
	public String manager_noticewrite() {
		return "admin/manager_noticewrite";
	}
	
	@GetMapping("/manager_QnAlist") 
	public String manager_QnAlist() {
		return "admin/manager_QnAlist";
	}
	
	@GetMapping("/manager_QnAwrite") 
	public String manager_QnAwrite() {
		return "admin/manager_QnAwrite";
	}
}
