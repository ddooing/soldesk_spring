package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/main")
	public String main(Model model) {
		List<NoticeBean> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		return "notice/main";
	}

	@GetMapping("/post")
	public String post(@RequestParam("notice_id") int noticeId, Model model) {
		NoticeBean notice = noticeService.getNoticeInfo(noticeId);
		model.addAttribute("notice", notice);
		return "notice/post";
	}

}
