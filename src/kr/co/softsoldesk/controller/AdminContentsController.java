package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Service.AdminContentsService;
import kr.co.softsoldesk.Service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminContentsController {
	
	@Autowired
	private AdminContentsService AdminContentsService;
	
	@GetMapping("manager_noticemanage")
	public String manager_noticemanage(Model model, @RequestParam(value="type", required=false) String type,
										@RequestParam(value="keyword", required=false) String keyword,
										@RequestParam(value="page", defaultValue = "1")int page) {
		
		 if ("titlecontents".equals(type) && keyword != null) {
			 List<NoticeBean> titleList = AdminContentsService.getSearchNoticeAllTitleList(keyword, page);
			 model.addAttribute("noticeList", titleList);
			 
			 PageBean pageBean2 = AdminContentsService.AllSearchNoticeCnt(keyword, page);
			 model.addAttribute("pageBean2", pageBean2);
			 
			 int n3 = AdminContentsService.AllSearchNoticeCnt(keyword);
			 model.addAttribute("n3", n3);
			 
			 
			 model.addAttribute("type",type);
			 model.addAttribute("keyword",keyword);
			 
		}else if("title".equals(type) && keyword != null) {
			List<NoticeBean> allList = AdminContentsService.getSearchNoticeTitleList(keyword, page);
			model.addAttribute("noticeList", allList);
			
			PageBean pageBean1 = AdminContentsService.SearchNoticeCnt(keyword, page);
			model.addAttribute("pageBean1", pageBean1);
			
			int n2 = AdminContentsService.SearchNoticeCnt(keyword);
			model.addAttribute("n2", n2);
			
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			
				
		}else {
			List<NoticeBean> noticeList = AdminContentsService.getAllNoticeList(page);
			model.addAttribute("noticeList", noticeList);
			
			PageBean pageBean = AdminContentsService.AllNoticeCnt(page);
			model.addAttribute("pageBean", pageBean);
			
			int n1 = AdminContentsService.AllNoticeCnt1();
			model.addAttribute("n1", n1);
			
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			
		 }
		
		return "admin/manager_noticemanage";
	}
	
	
	@GetMapping("manager_noticewrite")
	public String manager_noticewrite() {
		
		return "admin/manager_noticewrite";
	}
	
	@PostMapping("nwrite_pro")
	public String nwrite_pro(@ModelAttribute("njoinBean")NoticeBean njoinBean, Model model) {
		
		AdminContentsService.addNotice(njoinBean);
		
		return "redirect:/admin/manager_noticemanage";
	}
	
	@GetMapping("manager_noticelook")
	public String manager_noticelook(@RequestParam("notice_id")int notice_id, Model model) {
		
		model.addAttribute("notice_id", notice_id);
		
		NoticeBean RN = AdminContentsService.getNoticeInfo(notice_id);
		model.addAttribute("RN", RN);
		
		return "admin/manager_noticelook";
	}
	
	@GetMapping("manager_noticemodify")
	public String manager_noticemodify(@ModelAttribute("nmodifyBean")NoticeBean nmodifyBean, Model model,
										@RequestParam("notice_id")int notice_id) {
		
		NoticeBean RN = AdminContentsService.getNoticeInfo(notice_id);
		
		model.addAttribute("RN", RN);
		
		nmodifyBean.setContents(RN.getContents());
		
		
		return "admin/manager_noticemodify";
	}
	
	@PostMapping("nmodify_pro")
	public String nmodify_pro(@ModelAttribute("nmodifyBean")NoticeBean nmodifyBean, Model model) {
		
		AdminContentsService.ModifyNoticeInfo(nmodifyBean);
		
		return "redirect:/admin/manager_noticemanage";
	}
	
	@PostMapping("/DeleteNotice")
	public ResponseEntity<?> DeleteNotice(@RequestParam("noIds") List<Integer> noIds) {
		
		AdminContentsService.DeleteNotice(noIds);
		
	    return ResponseEntity.ok().build();
	} 
	
	@GetMapping("/onedelete")
	public String onedelete(@RequestParam("notice_id")int notice_id) {
		
		AdminContentsService.DeleteNotice(notice_id);
		
		return "redirect:/admin/manager_noticemanage";
	}
	

}
