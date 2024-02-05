package kr.co.softsoldesk.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService AdminService;
	
	@GetMapping("/manager_QnAlist")
	public String manager_QnAlist(Model model) {
		
		// QnA 모든 정보 가져가기
		List<QnABean> qnaAllBean = AdminService.getAllQnAInfo();
		model.addAttribute("qnaAllBean", qnaAllBean);
		
		// QnA 총 개수, 답변전, 답변완료 개수 가져가기
		QnABean qnaCountBean = AdminService.getQnACount();
		model.addAttribute("qnaCountBean",qnaCountBean);
		
		return "admin/manager_QnAlist";
	}
	
	@GetMapping("/manager_QnAwrite")
	public String manager_QnAwrite(@ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id, Model model) {
		
		QnABean oneQnaInfo = AdminService.getOneQnAInfo(qna_id);
		model.addAttribute("oneQnaInfo", oneQnaInfo);
		
		return "admin/manager_QnAwrite";
	}
	
	@PostMapping("/qna_reply_enroll")
	public String qna_reply_enroll(@ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id) {
		
		qnaBean.setQna_id(qna_id);
		System.out.println("리플리플리플 : " + qnaBean.getReply());
		
		if(qnaBean.getReply() == "") {
			qnaBean.setState(0);
			AdminService.updateQnAReply(qnaBean);
		} else {
			qnaBean.setState(1);
			AdminService.updateQnAReply(qnaBean);
		}

		return "admin/QnA_reply_enroll_complete";
	}
	
	@GetMapping("/manager_QnAdelete")
	public String manager_QnAdelete(@RequestParam("qna_id") int qna_id) {
		
		// QnA 삭제 처리
		AdminService.deleteQnA(qna_id);
		
		return "admin/QnA_delete_complete";
	}
	
	@GetMapping("/QnA_recovery")
	public String QnA_recovery(@RequestParam("reply") String reply, @RequestParam("qna_id") int qna_id) {
		
		// QnA 복구 
		if(reply != "") {	// 답글이 달려있을때는 state 값 1로 아닐때는 0으로 복구
			int state = 1;
			AdminService.recoveryQnA(state, qna_id);
		} else {
			int state = 0;
			AdminService.recoveryQnA(state, qna_id);
		}

		return "admin/QnA_recovery_complete";
	}
	
	@PostMapping("/QnA_search")
	public String QnA_search(@RequestParam("usercombo") String usercombo, @RequestParam("usersearch") String usersearch, Model model) {
		
		if(usercombo.equals("nickname")) {
			// 닉네임 검색
			List<QnABean> nicknameSearchBean = AdminService.getnicknameSearchQnAInfo(usersearch);
			model.addAttribute("qnaAllBean", nicknameSearchBean);
			
			// 닉네임 검색 개수 반환 메소드
			QnABean QnAnicknamesearchCount = AdminService.getnicknameSearchQnACount(usersearch);
			model.addAttribute("qnaCountBean",QnAnicknamesearchCount);
			
		} else if (usercombo.equals("title")) {
			// 제목 검색
			List<QnABean> titleSearchBean = AdminService.gettitleSearchQnAInfo(usersearch);
			model.addAttribute("qnaAllBean", titleSearchBean);
			
			// 제목 검색 개수 반환 메소드
			QnABean QnAtitlesearchCount = AdminService.gettitleSearchQnACount(usersearch);
			model.addAttribute("qnaCountBean",QnAtitlesearchCount);
			
		} else if (usercombo.equals("0")) {
			return "admin/search_error";
		}
		
		return "admin/manager_QnAlist";
	}
	
	// 선택 삭제 메소드
	@PostMapping("/deleteSelectedQnA")
	public ResponseEntity<?> deleteSelectedQnA(@RequestParam("qnaIds") List<Integer> qnaIds) {
		
		AdminService.deleteSelectedQnA(qnaIds);
		
	    return ResponseEntity.ok().build();
	}
	
	
	
}
