package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminUserService;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
	
	@Autowired
	private AdminUserService adminUserService;
	
	// =========================================== 사용자 계정 관리 =================================
	
	   
	   @GetMapping("/manager_accountmanager")
	   public String manager_accountmanager(Model model,
	           @RequestParam(value="type", required=false) String type,
	           @RequestParam(value="keyword", required=false) String keyword,
	           @ModelAttribute("searchUserBean") UserBean searchUserBean,
	           @RequestParam(value = "page", defaultValue = "1") int page) {
	      
	      if ("nickname".equals(type) && keyword != null) {
	         
	          List<UserBean> searchList = adminUserService.getNickSearchList(searchUserBean, page);
	          model.addAttribute("userList", searchList);
	         
	         // 페이징 처리
	         PageBean pageBean1 = adminUserService.getNickSearchCnt(keyword,page);
	         model.addAttribute("pageBean1", pageBean1);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	         
	      } else if ("id".equals(type) && keyword != null) {
	         
	          List<UserBean> searchList = adminUserService.getIdSearchList(searchUserBean, page);
	          model.addAttribute("userList", searchList);
	          
	          PageBean pageBean2 = adminUserService.getIdSearchCnt(keyword, page);
	         model.addAttribute("pageBean2", pageBean2);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	         
	      } else if ("email".equals(type) && keyword != null) {
	         
	          List<UserBean> searchList = adminUserService.getEmailSearchList(searchUserBean, page);
	          model.addAttribute("userList", searchList);
	          
	          PageBean pageBean3 = adminUserService.getEamilSearchCnt(keyword, page);
	         model.addAttribute("pageBean3", pageBean3);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	         
	      } else {
	          List<UserBean> userList = adminUserService.getUserList(page);
	          model.addAttribute("userList", userList);
	          
	          PageBean pageBean = adminUserService.getAccountCnt(page);
	         model.addAttribute("pageBean", pageBean);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	      }
	      
	       return "admin/manager_accountmanager";
	   }
	
	@PostMapping("delete_pro")
	public String delete_pro(@RequestParam("deleteUser") List<Integer> ids) {
		
		for(Integer id : ids) adminUserService.deleteAdminUserInfo(id);
		
		return "admin/manager_accountmanager";
	}

	
	@GetMapping("/manager_accountdetail")
	public String manager_accountdetail(@RequestParam("user_id")int user_id, Model model, @ModelAttribute("acModifyBean")UserBean acModifyBean) {
		
		UserBean temp1 = adminUserService.getAdminModifyBean(user_id);
		
		acModifyBean.setNickname(temp1.getNickname());
		acModifyBean.setId(temp1.getId());
		acModifyBean.setEmail(temp1.getEmail());
		acModifyBean.setGrade(temp1.getGrade());
		acModifyBean.setCreate_date(temp1.getCreate_date());
		acModifyBean.setState(temp1.getState());
		
		model.addAttribute("temp1", temp1);
		
		
		return "admin/manager_accountdetail";
	}
	
	@PostMapping("/acmanager")
	public String acmanager(@RequestParam("user_id")int user_id, @ModelAttribute("acModifyBean")UserBean acModifyBean, Model model) {
		
		adminUserService.AdminModifyBean(acModifyBean);
		
		UserBean u1 = adminUserService.getAdminModifyBean(user_id);
		
		model.addAttribute("u1", u1);
		
		return "admin/detail_mod_success";
	}

}
