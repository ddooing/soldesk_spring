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
import kr.co.softsoldesk.Service.MyPageService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private AdminContentsService AdminContentsService;
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/main")
	public String main(Model model, @RequestParam(value="type", required=false) String type,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="page", defaultValue = "1")int page) {
		
		if ("titlecontents".equals(type) && keyword != null) {
			 List<NoticeBean> titleList = myPageService.getImportantNoticeSearchAllList(keyword, page);
			 model.addAttribute("noticeList", titleList);
			 
			 PageBean pageBean2 = myPageService.getImportantNoticeSearchAllListCnt(keyword, page);
			 model.addAttribute("pageBean2", pageBean2);
			 
			// 서브 캐러셀
			List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			 
			 
			 model.addAttribute("type",type);
			 model.addAttribute("keyword",keyword);
			 
		}else if("title".equals(type) && keyword != null) {
			List<NoticeBean> allList = myPageService.getImportantNoticeSearchList(keyword, page);
			model.addAttribute("noticeList", allList);
			
			PageBean pageBean1 = myPageService.getImportantNoticeSearchListCnt(keyword, page);
			model.addAttribute("pageBean1", pageBean1);
			
			
			// 서브 캐러셀
			List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			
				
		}else {
			List<NoticeBean> noticeList = myPageService.getImportantNoticeList(page);
			model.addAttribute("noticeList", noticeList);
			
			PageBean pageBean = myPageService.getImportantNoticeListCnt(page);
			model.addAttribute("pageBean", pageBean);
			
			
			// 서브 캐러셀
			List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);

			
		 }
		
		return "notice/main";
	}
	
	@GetMapping("read")
	public String read(@RequestParam("notice_id")int notice_id, Model model) {
		
		model.addAttribute("notice_id", notice_id);
		
		AdminContentsService.Noticeview(notice_id);
		NoticeBean RN = AdminContentsService.getNoticeInfo(notice_id);
		model.addAttribute("RN", RN);
		
		// 서브 캐러셀
		List<SubBannerBean> AllSubBannerInfo = adminService.IndexSubBannerBeanList();
		model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
		
		return "notice/read";
	}

}
