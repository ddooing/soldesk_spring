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

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService AdminService;
	
	@Autowired
	private UserService UserService;
	
	
	// 재호 부분
	// =========================================== 사용자 계정 관리 =================================
	@GetMapping("/manager_accountmanager")
	public String manager_accountmanager(Model model,
	        @RequestParam(value="type", required=false) String type,
	        @RequestParam(value="keyword", required=false) String keyword,
	        @ModelAttribute("searchUserBean") UserBean searchUserBean,
	        @RequestParam(value = "page", defaultValue = "1") int page) {
		
		if ("nickname".equals(type) && keyword != null) {
			
		    List<UserBean> searchList = UserService.getNickSearchList(searchUserBean);
		    model.addAttribute("userList", searchList);
		    
		    PageBean pageBean = UserService.getAccountCnt(page);
			model.addAttribute("pageBean", pageBean);
			
		} else if ("id".equals(type) && keyword != null) {
			
		    List<UserBean> searchList = UserService.getIdSearchList(searchUserBean);
		    model.addAttribute("userList", searchList);
		    
		    PageBean pageBean = UserService.getAccountCnt(page);
			model.addAttribute("pageBean", pageBean);
			
		} else if ("email".equals(type) && keyword != null) {
			
		    List<UserBean> searchList = UserService.getEmailSearchList(searchUserBean);
		    model.addAttribute("userList", searchList);
		    
		    PageBean pageBean = UserService.getAccountCnt(page);
			model.addAttribute("pageBean", pageBean);
			
		} else {
		    List<UserBean> userList = UserService.getUserList(page);
		    model.addAttribute("userList", userList);
		    
		    PageBean pageBean = UserService.getAccountCnt(page);
			model.addAttribute("pageBean", pageBean);
		}
		
		
		
	    return "admin/manager_accountmanager";
	}
	
	@PostMapping("delete_pro")
	public String delete_pro(@RequestParam("deleteUser") List<Integer> ids) {
		
		for(Integer id : ids) UserService.deleteAdminUserInfo(id);
		
		return "admin/manager_accountmanager";
	}

	
	@GetMapping("/manager_accountdetail")
	public String manager_accountdetail(@RequestParam("user_id")int user_id, Model model, @ModelAttribute("acModifyBean")UserBean acModifyBean) {
		
		UserBean temp1 = UserService.getAdminModifyBean(user_id);
		
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
		
		UserService.AdminModifyBean(acModifyBean);
		
		UserBean u1 = UserService.getAdminModifyBean(user_id);
		
		model.addAttribute("u1", u1);
		
		return "admin/detail_mod_success";
	}
	
	
	
	
	// ======================================= QnA관리 ================================
	// ======================================================승찬 부분
	@GetMapping("/manager_QnAlist")
	public String manager_QnAlist(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// QnA 모든 정보 가져가기
		List<QnABean> qnaAllBean = AdminService.getAllQnAInfo(page);
		model.addAttribute("qnaAllBean", qnaAllBean);
		
		// QnA 총 개수, 답변전, 답변완료 개수 가져가기
		QnABean qnaCountBean = AdminService.getQnACount();
		model.addAttribute("qnaCountBean",qnaCountBean);
		
		// QnA 관리자 페이지 페이징 처리
		PageBean pageBean = AdminService.getTotalQnACnt(page);
		model.addAttribute("pageBean", pageBean);
		
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
	public String QnA_search(@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		
		if (usercombo == null || usercombo.isEmpty() || usersearch == null || usersearch.isEmpty()) {
				// QnA 모든 정보 가져가기
				List<QnABean> qnaAllBean = AdminService.getAllQnAInfo(page);
				model.addAttribute("qnaAllBean", qnaAllBean);
						
				// QnA 총 개수, 답변전, 답변완료 개수 가져가기
				QnABean qnaCountBean = AdminService.getQnACount();
				model.addAttribute("qnaCountBean",qnaCountBean);
						
				// QnA 관리자 페이지 페이징 처리
				PageBean pageBean = AdminService.getTotalQnACnt(page);
				model.addAttribute("pageBean", pageBean);
						
				return "admin/manager_QnAlist";
	    }
		
		
		if("nickname".equals(usercombo)) {
			// 닉네임 검색
			List<QnABean> nicknameSearchBean = AdminService.getnicknameSearchQnAInfo(usersearch, page);
			model.addAttribute("qnaAllBean", nicknameSearchBean);
			
			// 닉네임 검색 개수 반환 메소드
			QnABean QnAnicknamesearchCount = AdminService.getnicknameSearchQnACount(usersearch);
			model.addAttribute("qnaCountBean",QnAnicknamesearchCount);
			
			// 페이징 처리
			PageBean pageBean1 = AdminService.getnicknameSearchQnACnt(usersearch, page);
			model.addAttribute("pageBean1", pageBean1);
	
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("usercombo",usercombo);
			model.addAttribute("usersearch",usersearch);
			
		} else if ("title".equals(usercombo)) {
			// 제목 검색
			List<QnABean> titleSearchBean = AdminService.gettitleSearchQnAInfo(usersearch, page);
			model.addAttribute("qnaAllBean", titleSearchBean);
			
			// 제목 검색 개수 반환 메소드
			QnABean QnAtitlesearchCount = AdminService.gettitleSearchQnACount(usersearch);
			model.addAttribute("qnaCountBean",QnAtitlesearchCount);
			
			// 페이징 처리
			PageBean pageBean2 = AdminService.gettitleSearchQnACnt(usersearch, page);
			model.addAttribute("pageBean2", pageBean2);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("usercombo",usercombo);
			model.addAttribute("usersearch",usersearch);
		} 
		
		return "admin/manager_QnAlist";
	}
	
	// 선택 삭제 메소드
	@PostMapping("/deleteSelectedQnA")
	public ResponseEntity<?> deleteSelectedQnA(@RequestParam("qnaIds") List<Integer> qnaIds) {
		
		AdminService.deleteSelectedQnA(qnaIds);
		
	    return ResponseEntity.ok().build();
	}
	
	
	// ==============================전시회 관리 ====================================
	
	// 전시회 관리 매핑
	@GetMapping("/manager_exhibitionlist")
	public String manager_exhibitionlist(@RequestParam(value="exhibitioncombo", required=false) String exhibitioncombo, @RequestParam(value="exhibitionsearch", required=false) String exhibitionsearch, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		if (exhibitioncombo == null || exhibitioncombo.isEmpty() || exhibitionsearch == null || exhibitionsearch.isEmpty()) {
			// 전시회 목록 가져가기
		 	List<ExhibitionBean> AdminExhibitionInfoBean = AdminService.getAdminexhibitionmange(page);
			model.addAttribute("AdminExhibitionInfoBean", AdminExhibitionInfoBean);
			
			// 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
			ExhibitionBean ExhibitionCountBean = AdminService.getExhibitionCount();
			model.addAttribute("ExhibitionCountBean",ExhibitionCountBean);
		 	
			// 전시회 페이징 처리
			PageBean pageBean = AdminService.getExhibitionCnt(page);
			model.addAttribute("pageBean", pageBean);
			
			return "/admin/manager_exhibitionlist";
		}
		
		if("author".equals(exhibitioncombo)) {	// 작가 검색
			// 작가 검색
			List<ExhibitionBean> authorSearchBean = AdminService.getauthorSearchExhibitionInfo(exhibitionsearch);
			model.addAttribute("AdminExhibitionInfoBean", authorSearchBean);
			
			// 작가 검색시 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
			ExhibitionBean AuthorSearchExhibitionCountBean = AdminService.getauthorSearchExhibitionCount(exhibitionsearch);
			model.addAttribute("ExhibitionCountBean",AuthorSearchExhibitionCountBean);
			
			// 작가 검색시 페이징 처리
			PageBean pageBean1 = AdminService.getauthorSearchExhibitionCnt(exhibitionsearch, page);
			model.addAttribute("pageBean1", pageBean1);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("exhibitioncombo",exhibitioncombo);
			model.addAttribute("exhibitionsearch",exhibitionsearch);
			
		} else if ("title".equals(exhibitioncombo)) {	// 제목 검색
			// 제목 검색
			List<ExhibitionBean> titleSearchBean = AdminService.gettitleSearchExhibitionInfo(exhibitionsearch, page);
			model.addAttribute("AdminExhibitionInfoBean",titleSearchBean);
			
			// 제목 검색시 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
			ExhibitionBean TitleSearchExhibitionCountBean = AdminService.gettitleSearchExhibitionCount(exhibitionsearch);
			model.addAttribute("ExhibitionCountBean",TitleSearchExhibitionCountBean);
			
			// 제목 검색시 페이징 처리
			PageBean pageBean2 = AdminService.gettitleSearchExhibitionCnt(exhibitionsearch, page);
			model.addAttribute("pageBean2", pageBean2);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("exhibitioncombo",exhibitioncombo);
			model.addAttribute("exhibitionsearch",exhibitionsearch);
		} 
		
		return "/admin/manager_exhibitionlist";
	}
	
	
}
