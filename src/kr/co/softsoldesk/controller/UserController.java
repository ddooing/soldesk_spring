package kr.co.softsoldesk.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.UserBean;


@Controller
@RequestMapping("/user")
public class UserController {
	

	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	

	@GetMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	}
	
	@GetMapping("/review_editor")
	public String review_editor() {
		return "user/review_editor";
	}
	
	@GetMapping("/InfoChange")
	public String InfoChange() {
	
		return "user/InfoChange";
	}
	
	@GetMapping("/basket")
	public String basket() {
		
		return "user/basket";
	}
	//----------------------------------------------
	
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean temploginUserBean,
						@RequestParam(value = "fail", defaultValue = "false")boolean fail,
						Model model) {
		model.addAttribute("fail", fail);
		
		return "user/login";
	}
	
	@PostMapping("/login_pro")
    public String login_pro(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean, BindingResult result) {
		
		return "user/login";
		
	
        
    }
	
	@GetMapping("/logout")
	public String logout() {
		
		return "user/logout";
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		
		return "user/not_login";
	}
	
	
	//-----------------------------------------------------------
	
	@GetMapping("/Signup")
	public String Signup() {
	    return "user/Signup";
	}

	@GetMapping("/QnA_info")
	public String QnA_info() {
	    return "user/QnA_info";
	}
	
	@GetMapping("/delete")
	public String delete() {

	    return "user/delete";
	}
	
	@PostMapping("/delete_pro")
	public String delete_pro() {
		
		return "user/delete_pro";
	}
	
}