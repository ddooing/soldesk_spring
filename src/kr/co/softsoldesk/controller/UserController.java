package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminService;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.PointDetailService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.UserService;
import kr.co.softsoldesk.validator.UserValidator;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private ExhibitionService ExhibitionService;
	
	@Autowired
	private AdminService adminService;
	
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
		
		// 서브 캐러셀
		List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
		model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
		
		return "user/login";
	}
	
	@PostMapping("/login_pro")
    public String login_pro(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			
			// 서브 캐러셀
			List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			return "user/login";
			
		}
		
        UserService.getLoginUserInfo(tempLoginUserBean);
        
        if(loginUserBean.isUserLogin() == true) {
        	

    		// index 필요한 것들
    		// 메인 캐러셀
    		List<MainBannerBean> AllMainBannerInfo = adminService.IndexMainBannerBeanList();
    		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
    				
    		// 서브 캐러셀
    		List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
    		model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
    						
    		// 인기 전시 캐러셀
    		List<ExhibitionBean> popularExhibitionInfo = ExhibitionService.getIndexPagePopularExhibitionInfo();
    		model.addAttribute("popularExhibitionInfo", popularExhibitionInfo);
    						
    		// 곧전시 캐러셀
    		List<ExhibitionBean> SoonExhibitionInfo = ExhibitionService.getIndexPageSoonExhibitionInfo();
    		model.addAttribute("SoonExhibitionInfo", SoonExhibitionInfo);
        	
        	return "view/index";
        } else {
        	return "user/login_fail";
        }
        
    }
	
	@GetMapping("/logout")
	public String logout(Model model) {
		loginUserBean.setUser_id(0);
		loginUserBean.setId(null);
		loginUserBean.setPassword(null);
		loginUserBean.setState(0);
		
		loginUserBean.setUserLogin(false);
		
		// index 필요한 것들
		// 메인 캐러셀
		List<MainBannerBean> AllMainBannerInfo = adminService.IndexMainBannerBeanList();
		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
				
		// 서브 캐러셀
		List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
		model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
						
		// 인기 전시 캐러셀
		List<ExhibitionBean> popularExhibitionInfo = ExhibitionService.getIndexPagePopularExhibitionInfo();
		model.addAttribute("popularExhibitionInfo", popularExhibitionInfo);
						
		// 곧전시 캐러셀
		List<ExhibitionBean> SoonExhibitionInfo = ExhibitionService.getIndexPageSoonExhibitionInfo();
		model.addAttribute("SoonExhibitionInfo", SoonExhibitionInfo);
		
		return "/view/index";
	}
	
	
	@GetMapping("/paymentpage_error")
	public String paymentpage_error() {
		
		return "user/paymentpage_error";
	}
	
	
	//-----------------------------------------------------------
	
	@GetMapping("/Signup")
	public String Signup(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		
		
	    return "user/Signup";
	}
	
	
	@PostMapping("/Signup_pro")
	public String Signup_pro(@Valid @ModelAttribute("joinUserBean")UserBean joinUserBean, BindingResult result,Model model) {
		
		if(result.hasErrors()) {
			return "user/Signup";
		}
		UserService.addUserInfo(joinUserBean);
		
		// index 필요한 것들
		// 메인 캐러셀
		List<MainBannerBean> AllMainBannerInfo = adminService.IndexMainBannerBeanList();
		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
				
		// 서브 캐러셀
		List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
		model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
						
		// 인기 전시 캐러셀
		List<ExhibitionBean> popularExhibitionInfo = ExhibitionService.getIndexPagePopularExhibitionInfo();
		model.addAttribute("popularExhibitionInfo", popularExhibitionInfo);
						
		// 곧전시 캐러셀
		List<ExhibitionBean> SoonExhibitionInfo = ExhibitionService.getIndexPageSoonExhibitionInfo();
		model.addAttribute("SoonExhibitionInfo", SoonExhibitionInfo);
    	
    	
    	return "view/index";
	}
	//-----------------------------------------------------
	
	@GetMapping("/InfoChange")
	   public String InfoChange(@ModelAttribute("modifyUserBean")UserBean modifyUserBean,
	                     @RequestParam("user_id")int user_id, Model model) {
	      
	      
	      UserBean IC = UserService.getLoginUserAllInfo(user_id);
	      
	      model.addAttribute("IC", IC);

	      
	      return "user/InfoChange";
	      
	   }
	   
	   @PostMapping("/InfoChange_pro")
	   public String InfoChange_pro(@Valid @ModelAttribute("modifyUserBean")UserBean modifyUserBean,
	         BindingResult result, Model model) {
	      if(result.hasErrors()) {
	      
	    	  
	         return "user/InfoChange";
	      }
	      
	      UserService.ModifyUserInfo(modifyUserBean);
	      model.addAttribute("user_id", modifyUserBean.getUser_id());
	      return "user/InfoChange_success";
	   }
	
	
	@PostMapping("/delete_pro")
	public String delete_pro(@Valid @ModelAttribute("deleteUserBean")UserBean deleteUserBean, BindingResult result,
							@RequestParam("user_id")int user_id, Model model) {
		
		UserBean DU = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("DU", DU);
		
		if(deleteUserBean.getPassword().equals(DU.getPassword())) {
			
			if(deleteUserBean.getPassword().equals(deleteUserBean.getPassword2())) {
				
				UserService.DeleteUserInfo(deleteUserBean);
				
				loginUserBean.setUser_id(0);
				loginUserBean.setId(null);
				loginUserBean.setPassword(null);
				loginUserBean.setState(0);
		        
				loginUserBean.setUserLogin(false);
				
				// index 페이지 가져가야 될 것들
				
				// index 필요한 것들
	    		// 메인 캐러셀
	    		List<MainBannerBean> AllMainBannerInfo = adminService.IndexMainBannerBeanList();
	    		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
	    				
	    		// 서브 캐러셀
	    		List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
	    		model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
	    						
	    		// 인기 전시 캐러셀
	    		List<ExhibitionBean> popularExhibitionInfo = ExhibitionService.getIndexPagePopularExhibitionInfo();
	    		model.addAttribute("popularExhibitionInfo", popularExhibitionInfo);
	    						
	    		// 곧전시 캐러셀
	    		List<ExhibitionBean> SoonExhibitionInfo = ExhibitionService.getIndexPageSoonExhibitionInfo();
	    		model.addAttribute("SoonExhibitionInfo", SoonExhibitionInfo);
				
				return "view/index";
				
			} else {
				return "user/delete_fail_1";		//비밀번호1, 2 불일치
			}
		} else {
			return "user/delete_fail_2";			//비밀번호 부정확
		}
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		
		return "user/not_login";
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		UserValidator validator1 = new UserValidator(loginUserBean);
		
		binder.addValidators(validator1);
		
	}
	
	
	
}
