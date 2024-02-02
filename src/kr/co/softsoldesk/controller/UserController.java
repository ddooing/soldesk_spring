package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.PointDetailService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private PointDetailService pointDetailService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/review_editor")
	public String review_editor() {
		return "user/review_editor";
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
		
		if(result.hasErrors()) {
			
			return "user/login";
			
		}
		
        UserService.getLoginUserInfo(tempLoginUserBean);
        
        if(loginUserBean.isUserLogin() == true) {
        	return "user/login_success";
        } else {
        	return "user/login_fail";
        }
        
    }
	
	@GetMapping("/logout")
	public String logout() {
		loginUserBean.setUser_id(0);
		loginUserBean.setId(null);
		loginUserBean.setPassword(null);
		loginUserBean.setState(0);
		
		loginUserBean.setUserLogin(false);
		
		return "user/logout";
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		
		return "user/not_login";
	}
	
	@GetMapping("/paymentpage_error")
	public String paymentpage_error() {
		
		return "user/paymentpage_error";
	}
	
	
	//-----------------------------------------------------------
	
	@GetMapping("/Signup")
	public String Signup() {
	    return "user/Signup";
	}
	
}
