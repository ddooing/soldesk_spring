package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.Service.AdminContentsService;
import kr.co.softsoldesk.Service.AdminService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private AdminContentsService AdminContentsService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/main")
	public String main(Model model, @RequestParam(value="type", required=false) String type,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="page", defaultValue = "1")int page) {
		
		if ("titlecontents".equals(type) && keyword != null) {
			 List<NoticeBean> titleList = AdminContentsService.getSearchNoticeAllTitleList(keyword, page);
			 model.addAttribute("noticeList", titleList);
			 
			 PageBean pageBean2 = AdminContentsService.AllSearchNoticeCnt(keyword, page);
			 model.addAttribute("pageBean2", pageBean2);
			 
			 int n3 = AdminContentsService.AllSearchNoticeCnt(keyword);
			 model.addAttribute("n3", n3);
			 
			// 서브 캐러셀
			List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			 
			 
			 model.addAttribute("type",type);
			 model.addAttribute("keyword",keyword);
			 
		}else if("title".equals(type) && keyword != null) {
			List<NoticeBean> allList = AdminContentsService.getSearchNoticeTitleList(keyword, page);
			model.addAttribute("noticeList", allList);
			
			PageBean pageBean1 = AdminContentsService.SearchNoticeCnt(keyword, page);
			model.addAttribute("pageBean1", pageBean1);
			
			int n2 = AdminContentsService.SearchNoticeCnt(keyword);
			model.addAttribute("n2", n2);
			
			// 서브 캐러셀
			List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			
				
		}else {
			List<NoticeBean> noticeList = AdminContentsService.getAllNoticeList(page);
			model.addAttribute("noticeList", noticeList);
			
			PageBean pageBean = AdminContentsService.AllNoticeCnt(page);
			model.addAttribute("pageBean", pageBean);
			
			int n1 = AdminContentsService.AllNoticeCnt1();
			model.addAttribute("n1", n1);
			
			// 서브 캐러셀
			List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			
		 }
		
		return "notice/main";
	}
	
	@GetMapping("read")
	public String read(@RequestParam("notice_id")int notice_id, Model model) {
		
		model.addAttribute("notice_id", notice_id);
		
		AdminContentsService.Noticeview(notice_id);
		NoticeBean RN = AdminContentsService.getNoticeInfo(notice_id);
		model.addAttribute("RN", RN);
		
		return "notice/read";
	}

}
