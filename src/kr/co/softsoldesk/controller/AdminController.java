package kr.co.softsoldesk.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminService;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.UserService;
import kr.co.softsoldesk.dao.ExhibitionDao;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private ExhibitionService ExhibitionService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	// 재호 부분
	// =========================================== 사용자 계정 관리 =================================
	
	   
	   @GetMapping("/manager_accountmanager")
	   public String manager_accountmanager(Model model,
	           @RequestParam(value="type", required=false) String type,
	           @RequestParam(value="keyword", required=false) String keyword,
	           @ModelAttribute("searchUserBean") UserBean searchUserBean,
	           @RequestParam(value = "page", defaultValue = "1") int page) {
	      
	      if ("nickname".equals(type) && keyword != null) {
	         
	          List<UserBean> searchList = UserService.getNickSearchList(searchUserBean, page);
	          model.addAttribute("userList", searchList);
	         
	         // 페이징 처리
	         PageBean pageBean1 = UserService.getNickSearchCnt(keyword,page);
	         model.addAttribute("pageBean1", pageBean1);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	         
	      } else if ("id".equals(type) && keyword != null) {
	         
	          List<UserBean> searchList = UserService.getIdSearchList(searchUserBean, page);
	          model.addAttribute("userList", searchList);
	          
	          PageBean pageBean2 = UserService.getIdSearchCnt(keyword, page);
	         model.addAttribute("pageBean2", pageBean2);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	         
	      } else if ("email".equals(type) && keyword != null) {
	         
	          List<UserBean> searchList = UserService.getEmailSearchList(searchUserBean, page);
	          model.addAttribute("userList", searchList);
	          
	          PageBean pageBean3 = UserService.getEamilSearchCnt(keyword, page);
	         model.addAttribute("pageBean3", pageBean3);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	         
	      } else {
	          List<UserBean> userList = UserService.getUserList(page);
	          model.addAttribute("userList", userList);
	          
	          PageBean pageBean = UserService.getAccountCnt(page);
	         model.addAttribute("pageBean", pageBean);
	         
	         model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
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
	
	
	// ====================================== 예매 관리 ================================
	@GetMapping("/manager_reservelist")
	public String manager_reservelist() {
	      
	   return "admin/manager_reservelist";
	}
	
	
	//======================================= FAQ관리 ================================
	//=========================================================================FAQ
	   
	   @GetMapping("/manager_FAQlist")
	   public String manager_FAQlist(Model model, @RequestParam(value="page", defaultValue = "1")int page,
	                            @RequestParam(value="type", required=false) String type,
	                           @RequestParam(value="keyword", required=false) String keyword) {
	      
	       if ("title".equals(type) && keyword != null) {
	          List<FAQBean> titleList = adminService.getFAQSerchList(page, keyword);
	          model.addAttribute("FAQList", titleList);
	          
	          
	          PageBean pageBean2 = adminService.getFAQSerchListCnt(page, keyword);
	          model.addAttribute("pageBean1", pageBean2);
	          
	          model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	      }else {
	         List<FAQBean> FAQList = adminService.getFAQList(page);
	          model.addAttribute("FAQList", FAQList);
	          
	          
	          PageBean pageBean1 = adminService.getTotalFAQCnt(page);
	          model.addAttribute("pageBean", pageBean1);
	          
	          model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	         
	      }
	      
	      return "admin/manager_FAQlist";
	   }
	   
	   @GetMapping("/FAQreg")
	   public String FAQreg(@ModelAttribute("FAQBean")FAQBean FAQBean) {
	      

	      
	      return "admin/FAQreg";
	   }
	   
	   @PostMapping("FAQreg_pro")
	   public String FAQreg_pro(@ModelAttribute("FAQBean")FAQBean FAQBean, Model model, @RequestParam(value="page", defaultValue = "1")int page) {
	      
		   adminService.regFAQ(FAQBean);
	      List<FAQBean> FAQList = adminService.getFAQList(page);
	       model.addAttribute("FAQList", FAQList);
	       
	       PageBean pageBean1 = adminService.getTotalFAQCnt(page);
	       model.addAttribute("pageBean1", pageBean1);
	      
	      return "admin/manager_FAQlist";
	   }
	   
	   @GetMapping("manager_FAQdetail")
	   public String FAQdetail(@RequestParam("qna_id") int faq_id, Model model,
	                     @ModelAttribute("FAQmodifyBean")FAQBean FAQmodifyBean) {
	      
	      System.out.println(faq_id);
	      
	      FAQBean oneQnaInfo = adminService.getOneFAQInfo(faq_id);
	      
	      FAQmodifyBean.setContents(oneQnaInfo.getContents());
	      FAQmodifyBean.setTitle(oneQnaInfo.getTitle());
	      FAQmodifyBean.setState(oneQnaInfo.getState());
	      model.addAttribute("oneQnaInfo", oneQnaInfo);
	      System.out.println(FAQmodifyBean.getState());
	      
	      return "admin/manager_FAQdetail";
	   }
	   
	   @PostMapping("manager_FAQdetail_pro")
	   public String FAQdetail_pro(@ModelAttribute("FAQmodifyBean")FAQBean FAQmodifyBean, Model model) {
	      
		  adminService.FAQmodifyBean(FAQmodifyBean);
	      
	      return "redirect:/admin/manager_FAQlist";
	   }
	   
	   @PostMapping("/deleteSelectedFAQ")
	   public ResponseEntity<?> deleteSelectedFAQ(@RequestParam("faqIds") List<Integer> faqIds) {
	      
		   adminService.deleteSelectedFAQ(faqIds);
	      
	       return ResponseEntity.ok().build();
	   }
	
	
	// ======================================= QnA관리 ================================
	@GetMapping("/manager_QnAlist")
	public String manager_QnAlist(@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
			if (usercombo == null || usercombo.isEmpty() || usersearch == null || usersearch.isEmpty()) {
				// QnA 모든 정보 가져가기
				List<QnABean> qnaAllBean = adminService.getAllQnAInfo(page);
				model.addAttribute("qnaAllBean", qnaAllBean);
						
				// QnA 총 개수, 답변전, 답변완료 개수 가져가기
				QnABean qnaCountBean = adminService.getQnACount();
				model.addAttribute("qnaCountBean",qnaCountBean);
						
				// QnA 관리자 페이지 페이징 처리
				PageBean pageBean = adminService.getTotalQnACnt(page);
				model.addAttribute("pageBean", pageBean);
						
				return "admin/manager_QnAlist";
	    }
		
		
		if("nickname".equals(usercombo)) {
			// 닉네임 검색
			List<QnABean> nicknameSearchBean = adminService.getnicknameSearchQnAInfo(usersearch, page);
			model.addAttribute("qnaAllBean", nicknameSearchBean);
			
			// 닉네임 검색 개수 반환 메소드
			QnABean QnAnicknamesearchCount = adminService.getnicknameSearchQnACount(usersearch);
			model.addAttribute("qnaCountBean",QnAnicknamesearchCount);
			
			// 페이징 처리
			PageBean pageBean1 = adminService.getnicknameSearchQnACnt(usersearch, page);
			model.addAttribute("pageBean1", pageBean1);
	
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("usercombo",usercombo);
			model.addAttribute("usersearch",usersearch);
			
		} else if ("title".equals(usercombo)) {
			// 제목 검색
			List<QnABean> titleSearchBean = adminService.gettitleSearchQnAInfo(usersearch, page);
			model.addAttribute("qnaAllBean", titleSearchBean);
			
			// 제목 검색 개수 반환 메소드
			QnABean QnAtitlesearchCount = adminService.gettitleSearchQnACount(usersearch);
			model.addAttribute("qnaCountBean",QnAtitlesearchCount);
			
			// 페이징 처리
			PageBean pageBean2 = adminService.gettitleSearchQnACnt(usersearch, page);
			model.addAttribute("pageBean2", pageBean2);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("usercombo",usercombo);
			model.addAttribute("usersearch",usersearch);
		} 
		
		return "admin/manager_QnAlist";
	}
	
	@GetMapping("/manager_QnAwrite")
	public String manager_QnAwrite(@ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id, Model model) {
		
		QnABean oneQnaInfo = adminService.getOneQnAInfo(qna_id);
		model.addAttribute("oneQnaInfo", oneQnaInfo);
		
		return "admin/manager_QnAwrite";
	}
	
	// qna 답변 등록
	@PostMapping("/qna_reply_enroll")
	public String qna_reply_enroll(@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model, @ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id) {
		
		qnaBean.setQna_id(qna_id);
		
		if(qnaBean.getReply() == "") {
			qnaBean.setState(0);
			adminService.updateQnAReply(qnaBean);
		} else {
			qnaBean.setState(1);
			adminService.updateQnAReply(qnaBean);
		}
		

			return "redirect:/admin/manager_QnAlist";
	}
	
	@GetMapping("/manager_QnAdelete")
	public String manager_QnAdelete(@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model, @ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id) {
		
		// QnA 삭제 처리
		adminService.deleteQnA(qna_id);

		return "redirect:/admin/manager_QnAlist";
	}
	
	@GetMapping("/QnA_recovery")
	public String QnA_recovery(@RequestParam("reply") String reply,@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model, @ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id) {
		
		// QnA 복구 
		if(reply != "") {	// 답글이 달려있을때는 state 값 1로 아닐때는 0으로 복구
			int state = 1;
			adminService.recoveryQnA(state, qna_id);
		} else {
			int state = 0;
			adminService.recoveryQnA(state, qna_id);
		}
		
		return "redirect:/admin/manager_QnAlist";
	}
	
	// 선택 삭제 메소드
	@PostMapping("/deleteSelectedQnA")
	public ResponseEntity<?> deleteSelectedQnA(@RequestParam("qnaIds") List<Integer> qnaIds) {
		
		adminService.deleteSelectedQnA(qnaIds);
		
	    return ResponseEntity.ok().build();
	}
	
	
	// ==============================전시회 관리 ====================================
	
	// 전시회 관리 매핑
	@GetMapping("/manager_exhibitionlist")
	public String manager_exhibitionlist(@RequestParam(value="exhibitioncombo", required=false) String exhibitioncombo, @RequestParam(value="exhibitionsearch", required=false) String exhibitionsearch, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		if (exhibitioncombo == null || exhibitioncombo.isEmpty() || exhibitionsearch == null || exhibitionsearch.isEmpty()) {
			// 전시회 목록 가져가기
		 	List<ExhibitionBean> AdminExhibitionInfoBean = adminService.getAdminexhibitionmange(page);
			model.addAttribute("AdminExhibitionInfoBean", AdminExhibitionInfoBean);
			
			// 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
			ExhibitionBean ExhibitionCountBean = adminService.getExhibitionCount();
			model.addAttribute("ExhibitionCountBean",ExhibitionCountBean);
		 	
			// 전시회 페이징 처리
			PageBean pageBean = adminService.getExhibitionCnt(page);
			model.addAttribute("pageBean", pageBean);
			
			return "/admin/manager_exhibitionlist";
		}
		
		if("author".equals(exhibitioncombo)) {	// 작가 검색
			// 작가 검색
			List<ExhibitionBean> authorSearchBean = adminService.getauthorSearchExhibitionInfo(exhibitionsearch);
			model.addAttribute("AdminExhibitionInfoBean", authorSearchBean);
			
			// 작가 검색시 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
			ExhibitionBean AuthorSearchExhibitionCountBean = adminService.getauthorSearchExhibitionCount(exhibitionsearch);
			model.addAttribute("ExhibitionCountBean",AuthorSearchExhibitionCountBean);
			
			// 작가 검색시 페이징 처리
			PageBean pageBean1 = adminService.getauthorSearchExhibitionCnt(exhibitionsearch, page);
			model.addAttribute("pageBean1", pageBean1);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("exhibitioncombo",exhibitioncombo);
			model.addAttribute("exhibitionsearch",exhibitionsearch);
			
		} else if ("title".equals(exhibitioncombo)) {	// 제목 검색
			// 제목 검색
			List<ExhibitionBean> titleSearchBean = adminService.gettitleSearchExhibitionInfo(exhibitionsearch, page);
			model.addAttribute("AdminExhibitionInfoBean",titleSearchBean);
			
			// 제목 검색시 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
			ExhibitionBean TitleSearchExhibitionCountBean = adminService.gettitleSearchExhibitionCount(exhibitionsearch);
			model.addAttribute("ExhibitionCountBean",TitleSearchExhibitionCountBean);
			
			// 제목 검색시 페이징 처리
			PageBean pageBean2 = adminService.gettitleSearchExhibitionCnt(exhibitionsearch, page);
			model.addAttribute("pageBean2", pageBean2);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("exhibitioncombo",exhibitioncombo);
			model.addAttribute("exhibitionsearch",exhibitionsearch);
		} 
		
		return "/admin/manager_exhibitionlist";
	}
	
	// 전시회 수정 페이지 들어가기
	@GetMapping("/manager_exhibitionmodify")
	public String manager_exhibitionmodify(@RequestParam("exhibition_id") int exhibition_id, Model model) { 
		
		ExhibitionDetailBean DetailExhibitionBean = adminService.getAllDetailExhibitionBean(exhibition_id);
		DetailExhibitionBean.setExhibition_id(exhibition_id);
		
		model.addAttribute("DetailExhibitionBean",DetailExhibitionBean);
		
		return "/admin/manager_exhibitionmodify";
	}
	
	// 전시회 수정
	@PostMapping("/exhibition_exhibitionmodify_pro")
	public String exhibition_exhibitionmodify_pro(@ModelAttribute("DetailExhibitionBean") ExhibitionDetailBean DetailExhibitionBean, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// open 컬럼 set => open_time + " - " + close_time
		String open = (DetailExhibitionBean.getOpen_time() + " - " + DetailExhibitionBean.getClose_time());
		DetailExhibitionBean.setOpen(open);
		
		// 파일 저장하고 전시회 관련 업데이트
		adminService.UpdateExhibitionInfo2(DetailExhibitionBean);
			
		return "redirect:/admin/manager_exhibitionlist";
	}
	
	
	// 전시회 추가 페이지 매핑
	@GetMapping("/manager_exhibitionadd")
	public String manager_exhibitionadd(@ModelAttribute("AddDetailExhibitionBean") ExhibitionDetailBean AddDetailExhibitionBean) {
		
		return "/admin/manager_exhibitionadd";
	}
	
	// 전시회 추가
	@PostMapping("/exhibition_exhibitionadd_pro")
	public String exhibition_exhibitionadd_pro(@ModelAttribute("AddDetailExhibitionBean") ExhibitionDetailBean AddDetailExhibitionBean, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		// 파일테이블 추가
		adminService.addfiletableExhibition(AddDetailExhibitionBean);
		
		// 전시회 테이블 추가
		adminService.addexhibitiontableExhibition(AddDetailExhibitionBean);
		
		return "redirect:/admin/manager_exhibitionlist";
	}
	
	
	// ========================== 전시회 등록 신청 ====================================
	
	// 관리자페이지 전시회 등록 신청 리스트 
	@GetMapping("/manager_exhibitionapplylist")
	public String manager_exhibitionapplylist(@RequestParam(value="exhibitioncombo", required=false) String exhibitioncombo, @RequestParam(value="exhibitionsearch", required=false) String exhibitionsearch, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		if (exhibitioncombo == null || exhibitioncombo.isEmpty() || exhibitionsearch == null || exhibitionsearch.isEmpty()) {
			// 리스트 찍는 정보 가져가기
			List<ExhibitionDetailBean> enrollAllBean = adminService.getAllExhibitionEnroll(page);
			model.addAttribute("enrollAllBean", enrollAllBean);
			
			// 페이징 처리
			PageBean pageBean = adminService.getEnrollExhibitionCnt(page);
			model.addAttribute("pageBean", pageBean);
			
			// 뱃지에 넣을 개수 반환 Bean (total_exhibition_eroll_count,stay_exhibition_eroll_count,complete_exhibition_eroll_count)
			ExhibitionDetailBean countBean = adminService.getEnrollExhibitionbadgeCnt();
			model.addAttribute("countBean", countBean);
			
			return "/admin/manager_exhibitionapplylist";
		}
		
		
		if("title".equals(exhibitioncombo)) {	// 제목검색
			
			// 제목 검색 리스트
			List<ExhibitionDetailBean> titlesearchBean = adminService.getEnrollExhibitionSearchTitle(exhibitionsearch, page);
			model.addAttribute("enrollAllBean",titlesearchBean);
			
			// 제목 검색 중 배지 개수 반환
			ExhibitionDetailBean titlesearchCntBean = adminService.getEnrollExhibitionSearchTitleBadgeCnt(exhibitionsearch);
			model.addAttribute("countBean",titlesearchCntBean);
			
			// 제목 검색 페이징 처리
			PageBean pageBean = adminService.getEnrollExhibitionSearchTitletotalCnt(exhibitionsearch, page);
			model.addAttribute("pageBean1", pageBean);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("exhibitioncombo",exhibitioncombo);
			model.addAttribute("exhibitionsearch",exhibitionsearch);
			
		} else if("apply_person".equals(exhibitioncombo)) {	// 신청인검색
			
			// 신청인 검색 리스트
			List<ExhibitionDetailBean> apply_personsearchBean = adminService.getEnrollExhibitionSearchapply_person(exhibitionsearch, page);
			model.addAttribute("enrollAllBean",apply_personsearchBean);
			
			// 신청인 검색 중 배지 개수 반환
			ExhibitionDetailBean apply_personsearchCntBean = adminService.getEnrollExhibitionSearchapply_personBadgeCnt(exhibitionsearch);
			model.addAttribute("countBean",apply_personsearchCntBean);
			
			// 신청인 검색 페이징 처리
			PageBean pageBean = adminService.getEnrollExhibitionSearchapply_persontotalCnt(exhibitionsearch, page);
			model.addAttribute("pageBean2", pageBean);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("exhibitioncombo",exhibitioncombo);
			model.addAttribute("exhibitionsearch",exhibitionsearch);			
		} else if("author".equals(exhibitioncombo)) {	// 작가검색
			
			// 작가 검색 리스트
			List<ExhibitionDetailBean> getEnrollExhibitionSearchauthor = adminService.getEnrollExhibitionSearchauthor(exhibitionsearch, page);
			model.addAttribute("enrollAllBean", getEnrollExhibitionSearchauthor);
			
			// 작가 검색 중 배지 개수 반환
			ExhibitionDetailBean authorsearchCntBean = adminService.getEnrollExhibitionSearchauthorBadgeCnt(exhibitionsearch);
			model.addAttribute("countBean", authorsearchCntBean);
			
			// 작가 검색 페이징 처리
			PageBean pageBean = adminService.getEnrollExhibitionSearchauthortotalCnt(exhibitionsearch, page);
			model.addAttribute("pageBean3", pageBean);
			
			// 페이징 처리로 인한 검색조건 검색어 가져가기
			model.addAttribute("exhibitioncombo",exhibitioncombo);
			model.addAttribute("exhibitionsearch",exhibitionsearch);
			
		} else if("enroll_state".equals(exhibitioncombo)) {		// 상태검색
			
			// 상태 검색 매핑?
			if(exhibitionsearch.contains("대")||exhibitionsearch.contains("기")) {
				
				int searching = 1;
				// 상태 검색 리스트
				List<ExhibitionDetailBean> getEnrollExhibitionSearchstate = adminService.getEnrollExhibitionSearchstate(searching, page);
				model.addAttribute("enrollAllBean",getEnrollExhibitionSearchstate);
				
				// 상태 검색 중 배지 개수 반환
				ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt = adminService.getEnrollExhibitionSearchstateBadgeCnt(searching);
				model.addAttribute("countBean",getEnrollExhibitionSearchstateBadgeCnt);
				
				// 상태 검색 페이징 처리
				PageBean pageBean = adminService.getEnrollExhibitionSearchstatetotalCnt(searching, page);
				model.addAttribute("pageBean4", pageBean);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("searching",searching);
				model.addAttribute("exhibitionsearch",exhibitionsearch);
				
			} else if(exhibitionsearch.contains("완")||exhibitionsearch.contains("료")||exhibitionsearch.contains("등")||exhibitionsearch.contains("록")) {
				
				int searching = 2;
				// 상태 검색 리스트
				List<ExhibitionDetailBean> getEnrollExhibitionSearchstate = adminService.getEnrollExhibitionSearchstate(searching, page);
				model.addAttribute("enrollAllBean",getEnrollExhibitionSearchstate);
				
				// 상태 검색 중 배지 개수 반환
				ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt = adminService.getEnrollExhibitionSearchstateBadgeCnt(searching);
				model.addAttribute("countBean",getEnrollExhibitionSearchstateBadgeCnt);
				
				// 상태 검색 페이징 처리
				PageBean pageBean = adminService.getEnrollExhibitionSearchstatetotalCnt(searching, page);
				model.addAttribute("pageBean4", pageBean);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("searching",searching);
				model.addAttribute("exhibitionsearch",exhibitionsearch);
				
			} else if(exhibitionsearch.contains("거")||exhibitionsearch.contains("절")) {
				
				int searching = 3;
				// 상태 검색 리스트
				List<ExhibitionDetailBean> getEnrollExhibitionSearchstate = adminService.getEnrollExhibitionSearchstate(searching, page);
				model.addAttribute("enrollAllBean",getEnrollExhibitionSearchstate);
				
				// 상태 검색 중 배지 개수 반환
				ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt = adminService.getEnrollExhibitionSearchstateBadgeCnt(searching);
				model.addAttribute("countBean",getEnrollExhibitionSearchstateBadgeCnt);
				
				// 상태 검색 페이징 처리
				PageBean pageBean = adminService.getEnrollExhibitionSearchstatetotalCnt(searching, page);
				model.addAttribute("pageBean4", pageBean);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("searching",searching);
				model.addAttribute("exhibitionsearch",exhibitionsearch);
				
			}
			
		}
		
		return "/admin/manager_exhibitionapplylist";
	}
	
	// 관리자 페이지 전시회 등록 확인 페이지 매핑
	@GetMapping("/manager_exhibitionenrolladd")
	public String manager_exhibitionenrolladd(@RequestParam("exhibition_enroll_id") int exhibition_enroll_id ,Model model) {
		
		// 해당 전시회 등록 모든 정보 가져오기
		ExhibitionDetailBean AddDetailEnrollExhibitionBean = adminService.getOneEnrollExhitiion(exhibition_enroll_id);
		model.addAttribute("AddDetailEnrollExhibitionBean",AddDetailEnrollExhibitionBean);
		
		return "/admin/manager_exhibitionenrolladd";
	}
	
	// 관리자 페이지 전시회 등록 신청 -> 전시회 등록으로 넘어가는 메소드
	@PostMapping("manager_exhibitionenrolladd_pro")
	public String manager_exhibitionenrolladd_pro(@ModelAttribute("AddDetailEnrollExhibitionBean") ExhibitionDetailBean AddDetailEnrollExhibitionBean, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 파일을 변경 할 수 있으므로 파일 변경을 할 경우 새로 파일 저장
		if(AddDetailEnrollExhibitionBean.getMain_poster_file().getSize()>0) {
			// 메인 포스터 파일 변경
			adminService.adddetailfiletableExhibition(AddDetailEnrollExhibitionBean);
		}
		
		if(AddDetailEnrollExhibitionBean.getDetail_poster_file().getSize()>0) {
			// 상세 포스터 파일 변경
			adminService.addexhibitiontableExhibition(AddDetailEnrollExhibitionBean);
		}
		
		// 전시회 테이블 추가
		adminService.addEnrollexhibitiontableExhibition(AddDetailEnrollExhibitionBean);	
		
		// 전시회 등록 신청 완료 후 상태값 2로 변경
		adminService.UpdateExhibitionEnrollState(2, AddDetailEnrollExhibitionBean.getExhibition_enroll_id());
		
		return "redirect:/admin/manager_exhibitionlist";
	}
	
	@GetMapping("/manager_enroll_reject")
	public String manager_enroll_reject(@RequestParam(value = "page", defaultValue = "1") int page,@RequestParam("exhibition_enroll_id") int exhibition_enroll_id, Model model) {
		
		// 상태값 거절(3) 으로 변경
		adminService.UpdateExhibitionEnrollState(3, exhibition_enroll_id);
		
		// 리스트 찍는 정보 가져가기
		List<ExhibitionDetailBean> enrollAllBean = adminService.getAllExhibitionEnroll(page);
		model.addAttribute("enrollAllBean", enrollAllBean);
					
		// 페이징 처리
		PageBean pageBean = adminService.getEnrollExhibitionCnt(page);
		model.addAttribute("pageBean", pageBean);
					
		// 뱃지에 넣을 개수 반환 Bean (total_exhibition_eroll_count,stay_exhibition_eroll_count,complete_exhibition_eroll_count)
		ExhibitionDetailBean countBean = adminService.getEnrollExhibitionbadgeCnt();
		model.addAttribute("countBean", countBean);
					
		return "/admin/manager_exhibitionapplylist";		
		
	}
	
	// ============================== 관리자 페이지 배너관리 ================================
	// 메인 배너 관리 관리자 페이지
	@GetMapping("/manager_mainbannershowlist")
	public String manager_mainbannershowlist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 메인 배너 모든 정보 가져가기
			List<MainBannerBean> AllMainBannerInfo = adminService.getAllShowMainbannerInfo();
			model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
			
			// 메인 배너 뱃지 관련
			MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
			
			return "/admin/manager_mainbannershowlist";
		}
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 메인 배너 제목 검색 모든 정보 가져가기
			List<MainBannerBean> TitleSearchBannerInfo = adminService.titleSearchMainbannerInfo(bannersearch);
			model.addAttribute("AllMainBannerInfo",TitleSearchBannerInfo);
			
			// 메인 배너 제목 검색 뱃지 관련
			MainBannerBean TitleSearchBadgeCnt = adminService.getTitleSearchMainBannerBadgeCnt(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
		}
		
		
		return "/admin/manager_mainbannershowlist";
	}
	
	// 배너 순서 변경 (드래그앤 드롭)
	@PostMapping("/saveRowOrder")	
	public ResponseEntity<?> saveRowOrder(@RequestParam("order") String order) {
	    String[] ids = order.split(",");
	    adminService.updateExposeOrder(ids);
	    return ResponseEntity.ok("Row order saved");
	}
	
	// 메인 배너 수정 페이지 매핑
	@GetMapping("/manager_mainbannermodify")
	public String manager_mainbannermodify(@RequestParam("main_banner_id") int main_banner_id, Model model) {
		
		// 메인 배너 한개 모든 정보 가져오기
		MainBannerBean getOneMainBannerInfo = adminService.getOneMainBannerInfo(main_banner_id);
		model.addAttribute("getOneMainBannerInfoBean",getOneMainBannerInfo);
		
		// 메인 배너 뱃지 관련
		MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
		model.addAttribute("BadgeCnt", BadgeCnt);
		
		return "admin/manager_mainbannermodify";
	}
	
	// 메인 배너 삭제
	@GetMapping("/DeleteMainBanner")
	public String DeleteMainBanner(@RequestParam("main_banner_id") int main_banner_id, @RequestParam("expose_order") int expose_order ,@RequestParam("state") int state, Model model) {

		// 배너 삭제
		adminService.DeleteMainBanner(main_banner_id);
		
		// 노출 순서 높은것들 노출순서 낮추기 state 가 1일때만
		if(state == 1) {
			adminService.UpdateDeleteAndExpose_order(expose_order);
		}


		// 메인 배너 모든 정보 가져가기
		List<MainBannerBean> AllMainBannerInfo = adminService.getAllShowMainbannerInfo();
		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
					
		// 메인 배너 뱃지 관련
		MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
		model.addAttribute("BadgeCnt", BadgeCnt);
					
		return "/admin/manager_mainbannershowlist";
	}
	
	// 숨김 만 보이는 메인 배너 관리 페이지
	@GetMapping("/manager_mainbannerhidelist")
	public String manager_mainbannerhidelist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 메인 배너 모든 정보 가져가기 state 2 (숨김)
			List<MainBannerBean> AllMainBannerInfo = adminService.getAllHideMainbannerInfo();
			model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
			
			// 메인 배너 뱃지 관련
			MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			return "/admin/manager_mainbannerhidelist";
		}

		return "/admin/manager_mainbannerhidelist";
	}
	
	// 메인 배너 수정 페이지 업데이트수행
	@PostMapping("/manager_mainbannermodify_pro")
	public String manager_mainbannerUpdate(@ModelAttribute("getOneMainBannerInfoBean") MainBannerBean mainBannerBean ,Model model) {
		
		// state 값 비교해서 expose_order 값 재정렬
		int originalState = adminService.getMainBannerState(mainBannerBean.getMain_banner_id());
				
		// 파일 변경시 파일 변경
		if(mainBannerBean.getMain_banner_file().getSize()>0) {
			adminService.addfiletableBanner(mainBannerBean);
		}
		
		
		// expose_order 값 재정렬
	    if (originalState != mainBannerBean.getState()) {
	        if (mainBannerBean.getState() == 1) { // 숨김에서 노출로 변경
	        	int maxExposeOrder = adminService.getMaxExposeOrder() + 1;
	            mainBannerBean.setExpose_order(maxExposeOrder);
	        } else if (originalState == 1 && mainBannerBean.getState() == 2) { // 노출에서 숨김으로 변경
	        	adminService.UpdateExpose_order(mainBannerBean.getExpose_order());
	            mainBannerBean.setExpose_order(0);
	        }
	    }
	    
	    // 업데이트
	    adminService.UpdateMainBanner(mainBannerBean);
		
		return "redirect:/admin/manager_mainbannershowlist";
	}
	
	// 메인 배너 추가
	@GetMapping("/manager_mainbanneradd")
	public String manager_mainbanneradd(@ModelAttribute("AddBannerBean") MainBannerBean AddBannerBean, Model model) {
		
		//모든 전시회 콤보박스 활용 가져가기
		List<ExhibitionBean> exhibitiontitleAndid = ExhibitionService.getexhibitionallTitle();
		model.addAttribute("exhibitiontitleAndid",exhibitiontitleAndid);
		
		return "/admin/manager_mainbanneradd";
	}
	
	// 메인 배너 관리자 직접 추가
	@PostMapping("/manager_mainbanneradd_pro")
	public String manager_mainbanneradd_pro(@ModelAttribute("AddBannerBean") MainBannerBean AddBannerBean, Model model) {
		
		// 파일 저장
		if(AddBannerBean.getMain_banner_file().getSize()>0) {
			adminService.addfiletableBanner(AddBannerBean);
		}
		
		// expose_order 최대값으로 set해주기
		int maxExposeOrder = adminService.getMaxExposeOrder() + 1;
		AddBannerBean.setExpose_order(maxExposeOrder);
		
		// 메인 배너 main_banner 테이블 추가
		adminService.AddmanagerMainBanner(AddBannerBean);
		
		return "redirect:/admin/manager_mainbannershowlist";
	}
	
	
	// 배너 견적 신청
	@GetMapping("/mainbannerapplyform")
	public String mainbannerapplyform(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = adminService.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/admin/mainbannerapplyform";
	}
	
	// 메인 배너 신청 폼 제출
	@PostMapping("/mainbannerapplyform_pro")
	public String mainbannerapplyform_pro(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// 파일저장 및 banner_file_id set
		if(applybannerBean.getBanner_file().getSize()>0) {
			adminService.addfiletableBannerBannerApplyFormBean(applybannerBean);
		} 
		
		// 상태 1 로 등록대기 상태 set
		applybannerBean.setState(1);
		// banner_type(메인배너1) set
		applybannerBean.setBanner_type(1);
		
		// 배너신청폼 테이블 insert
		adminService.insertbanner_apply_form(applybannerBean);
	
		
		return "redirect:/view/index";
	}
	
	// 서브 배너 매핑
	@GetMapping("/subbannerapplyform")
	public String estimate2(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = adminService.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/admin/subbannerapplyform";
	}
	
	// 서브 배너 신청 폼 제출
	@PostMapping("/subbannerapplyform_pro")
	public String subbannerapplyform_pro(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
				
		// 파일저장 및 banner_file_id set
		if(applybannerBean.getBanner_file().getSize()>0) {
			adminService.addfiletableBannerSubBannerApplyFormBean(applybannerBean);
		} 
				
		// 상태 1 로 등록대기 상태 set
		applybannerBean.setState(1);
		// banner_type(서브배너2) set
		applybannerBean.setBanner_type(2);
				
		// 배너신청폼 테이블 insert
		adminService.insertbanner_apply_form(applybannerBean);
		
		return "redirect:/view/index";
	}
	
	// 인덱스 -> 배너 등록 페이지 매핑
	@GetMapping("/bannerapply")
	public String bannerapply() {
		return "/admin/bannerapply";
	}
	
	// 서브배너 showlist 매핑
	@GetMapping("/manager_subbannershowlist")
	public String manager_subbannershowlist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 서브 배너 모든 정보 가져가기
			List<SubBannerBean> AllSubBannerInfo = adminService.getAllShowSubbannerInfo();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			// 서브 배너 뱃지 관련
			SubBannerBean BadgeCnt = adminService.getSubBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
			
			return "/admin/manager_subbannershowlist";
		}
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 서브 배너 제목 검색 모든 정보 가져가기
			List<SubBannerBean> TitleSearchBannerInfo = adminService.titleSearchSubbannerInfo(bannersearch);
			model.addAttribute("AllSubBannerInfo",TitleSearchBannerInfo);
			
			// 서브 배너 제목 검색 뱃지 관련
			SubBannerBean TitleSearchBadgeCnt = adminService.getTitleSearchSubBannerBadgeCnt(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
		}
		
		
		return "/admin/manager_subbannershowlist";
	}
		
	
	
	// 서브배너 hidelist 매핑
	@GetMapping("/manager_subbannerhidelist")
	public String manager_subbannerhidelist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 서브 배너 모든 정보 가져가기
			List<SubBannerBean> AllSubBannerInfo = adminService.getAllHideSubbannerInfo();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			// 서브 배너 뱃지 관련
			SubBannerBean BadgeCnt = adminService.getSubBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			return "/admin/manager_subbannerhidelist";
		}
	
		return "/admin/manager_subbannerhidelist";
	}
	
	// 서브 배너 삭제
	@GetMapping("/DeleteSubBanner")
	public String DeleteSubBanner(@RequestParam("sub_banner_id") int sub_banner_id, @RequestParam("expose_order") int expose_order ,@RequestParam("state") int state ,Model model) {

		// 배너 삭제
		adminService.DeleteSubBanner(sub_banner_id);
		
		// 노출 순서 높은것들 노출순서 낮추기
		if(state == 1) {
			adminService.UpdateDeleteAndExpose_orderSub(expose_order);			
		}
					
		return "redirect:/admin/manager_subbannershowlist";
	}		
	
	
	// 서브 배너 수정 페이지 매핑
	@GetMapping("/manager_subbannermodify")
	public String manager_subbannermodify(@RequestParam("sub_banner_id") int sub_banner_id, Model model) {
		
		// 서브 배너 한개 모든 정보 가져오기
		SubBannerBean getOneSubBannerInfo = adminService.getOneSubBannerInfo(sub_banner_id);
		model.addAttribute("getOneSubBannerInfoBean",getOneSubBannerInfo);
		
		// 서브 배너 뱃지 관련
		SubBannerBean BadgeCnt = adminService.getSubBannerBadgeCnt();
		model.addAttribute("BadgeCnt", BadgeCnt);
		
		return "admin/manager_subbannermodify";
	}			
	
	// 서브 배너 수정 페이지 업데이트수행
	@PostMapping("/manager_subbannermodify_pro")
	public String manager_subbannermodify_pro(@ModelAttribute("getOneSubBannerInfoBean") SubBannerBean subBannerBean ,Model model) {
		
		// state 값 비교해서 expose_order 값 재정렬
		int originalState = adminService.getSubBannerState(subBannerBean.getSub_banner_id());
		
		// 파일 변경시 파일 변경
		if(subBannerBean.getSub_banner_file().getSize()>0) {
			adminService.addfiletableBanner2(subBannerBean);
		}
		
		// expose_order 값 재정렬
	    if (originalState != subBannerBean.getState()) {
	        if (subBannerBean.getState() == 1) { // 숨김에서 노출로 변경
	        	int maxExposeOrder = adminService.getSubMaxExposeOrder() + 1;
	        	subBannerBean.setExpose_order(maxExposeOrder);
	        } else if (originalState == 1 && subBannerBean.getState() == 2) { // 노출에서 숨김으로 변경
	        	adminService.UpdateSubBannerExpose_order(subBannerBean.getExpose_order());
	            subBannerBean.setExpose_order(0);
	        }
	    }
	    
	    // 업데이트
	    adminService.UpdateSubBanner(subBannerBean);
				
		return "redirect:/admin/manager_subbannershowlist";
	}
	
	// 메인 배너 추가
	@GetMapping("/manager_subbanneradd")
	public String manager_subbanneradd(@ModelAttribute("AddBannerBean") SubBannerBean AddBannerBean, Model model) {
			
		//모든 전시회 콤보박스 활용 가져가기
		List<ExhibitionBean> exhibitiontitleAndid = ExhibitionService.getexhibitionallTitle();
		model.addAttribute("exhibitiontitleAndid",exhibitiontitleAndid);
			
		return "/admin/manager_subbanneradd";
	}
	
	@PostMapping("/manager_subbanneradd_pro")
	public String manager_subbanneradd_pro(@ModelAttribute("AddBannerBean") SubBannerBean AddBannerBean, Model model) {
		
		// 파일 저장
		if(AddBannerBean.getSub_banner_file().getSize()>0) {
			adminService.addfiletableBanner2(AddBannerBean);
		}
		
		// expose_order 최대값으로 set해주기
		int maxExposeOrder = adminService.getSubMaxExposeOrder() + 1;
		AddBannerBean.setExpose_order(maxExposeOrder);
					
		// 메인 배너 main_banner 테이블 추가
		adminService.AddmanagerSubBanner(AddBannerBean);
		
		return "redirect:/admin/manager_subbannershowlist";
	}
	
	
	// 서브 배너 드래그 앤 드롭 순서 변경 오류오류 수정 필요
		@PostMapping("/saveRowOrder1")	
		public ResponseEntity<?> saveRowOrder1(@RequestParam("order") String order) {
		    String[] ids = order.split(",");
		    adminService.updateSubExposeOrder(ids);
		    return ResponseEntity.ok("Row order saved");
		}
	
	// 관리자 페이지 메인 배너 신청 리스트 매핑
	@GetMapping("/manager_mainbannerapplylist")
	public String manager_bannerapplylist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
			
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 메인 배너 신청내역 리스트 가져가기
			List<BannerApplyFormBean> mainBannerApplylistBean = adminService.getAllApplyMainbanner(page);
			model.addAttribute("BannerApplylistBean", mainBannerApplylistBean);
			
			// 메인 배너 신청내역 뱃지 관련
			BannerApplyFormBean BadgeBean = adminService.getMainBannerBadge();
			model.addAttribute("BadgeCnt", BadgeBean);		
			
			// 메인 배너 페이징 처리
			PageBean pageBean = adminService.getAllApplyMainbannerCnt(page);
			model.addAttribute("pageBean", pageBean);
		}
		
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 메인 배너 제목 검색 모든 정보 가져가기
			List<BannerApplyFormBean> TitleSearchapplyMainBannerInfo = adminService.getMainBannerapplytitleSearch(bannersearch, page);
			model.addAttribute("BannerApplylistBean",TitleSearchapplyMainBannerInfo);
			
			// 메인 배너 제목 검색 뱃지 관련
			BannerApplyFormBean TitleSearchBadgeCnt = adminService.getMainBannerapplytitlesearchBadge(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			// 메인 배너 제목 검색 페이징 처리
			PageBean pageBean1 = adminService.getMainBannerapplytitleSearchCnt(bannersearch, page);
			model.addAttribute("pageBean1", pageBean1);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
		}
		
		
		
		return "/admin/manager_mainbannerapplylist";
	}
		
	// 관리자 페이지 서브 배너 신청 리스트 매핑
	@GetMapping("/manager_subbannerapplylist")
	public String manager_subbannerapplylist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 서브 배너 신청내역 리스트 가져가기
			List<BannerApplyFormBean> subBannerApplylistBean = adminService.getAllApplySubbanner(page);
			model.addAttribute("BannerApplylistBean", subBannerApplylistBean);
			
			// 서브 배너 신청내역 뱃지 관련
			BannerApplyFormBean BadgeBean = adminService.getSubBannerBadge();
			model.addAttribute("BadgeCnt", BadgeBean);

			// 메인 배너 페이징 처리
			PageBean pageBean = adminService.getAllApplySubbannerCnt(page);
			model.addAttribute("pageBean", pageBean);
			
		}
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 서브 배너 제목 검색 모든 정보 가져가기
			List<BannerApplyFormBean> TitleSearchapplySubBannerInfo = adminService.getSubBannerapplytitleSearch(bannersearch, page);
			model.addAttribute("BannerApplylistBean",TitleSearchapplySubBannerInfo);
			
			// 서브 배너 제목 검색 뱃지 관련
			BannerApplyFormBean TitleSearchBadgeCnt = adminService.getSubBannerapplytitlesearchBadge(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			// 메인 배너 제목 검색 페이징 처리
			PageBean pageBean1 = adminService.getSubBannerapplytitleSearchCnt(bannersearch, page);
			model.addAttribute("pageBean1", pageBean1);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
		}
		
		return "/admin/manager_subbannerapplylist";
	}
	
	// 배너 신청 취소 처리
	@GetMapping("/BannerApplyCancel")
	public String UpdateApplyBannerCancel(@RequestParam("banner_apply_form_id") int banner_apply_form_id, @RequestParam("banner_type") int banner_type) {

		// 메인베너 취소시 메인배너로 리다이렉트
		if(banner_type == 1) {
			adminService.UpdateApplyBannerCancle(banner_apply_form_id);
			
			return "redirect:/admin/manager_mainbannerapplylist";
		} else { // 메인베너 취소시 서브배너로 리다이렉트
			adminService.UpdateApplyBannerCancle(banner_apply_form_id);
			
			return "redirect:/admin/manager_subbannerapplylist";
		}
		
	}
	
	// 배너 신청 추가/상세 페이지 매핑 (신청1개 모든 정보 가져가기)
	@GetMapping("/manager_bannerapplyadd")
	public String manager_bannerapplyadd(@RequestParam("banner_apply_form_id") int banner_apply_form_id, Model model) {

		// 배너 신청 1개 모든 정보 가져가기
		BannerApplyFormBean applyinfo = adminService.getBannerapplyDetail(banner_apply_form_id);
		model.addAttribute("AllBannerApplyInfo",applyinfo);
		
		
		return "/admin/manager_bannerapplyadd";
	}

	
	// 신청된 배너 추가
	@PostMapping("/manager_bannerapplyadd_pro")
	public String manager_bannerapplyadd_pro(@ModelAttribute("AllBannerApplyInfo") BannerApplyFormBean AllBannerApplyInfo, Model model) {
		
		// 배너타입이 1일때 (메인베너 리다이렉트)
		if(AllBannerApplyInfo.getBanner_type() == 1) {
			
			MainBannerBean addmainBannerBean = new MainBannerBean();
			
			//파일 변경시
			if(AllBannerApplyInfo.getBanner_file().getSize()>0) {
				// 새파일 저장 및 file_id set
				addmainBannerBean.setMain_banner_file(AllBannerApplyInfo.getBanner_file());
				adminService.addfiletableBanner(addmainBannerBean);
			} else {
				addmainBannerBean.setBanner_file_id(AllBannerApplyInfo.getBanner_file_id());				
			}
			
			addmainBannerBean.setExhibition_id(AllBannerApplyInfo.getExhibition_id());
			addmainBannerBean.setApply_person_id(AllBannerApplyInfo.getApply_person_id());
			addmainBannerBean.setStart_date(AllBannerApplyInfo.getStart_date());
			addmainBannerBean.setEnd_date(AllBannerApplyInfo.getEnd_date());
			
			// 숨김 안숨김 변경
			if(AllBannerApplyInfo.getState1() == 1) {
				addmainBannerBean.setState(1);
			} else {
				addmainBannerBean.setState(2);
			}
			addmainBannerBean.setPay_money(AllBannerApplyInfo.getPayment());
			// expose_order max값 가져와서 +1
			addmainBannerBean.setExpose_order(adminService.getMaxExposeOrder() + 1);
			
			// sub_banner 테이블에 insert
			adminService.addApplyMainBanner(addmainBannerBean);
			
			// banner_apply_form 에서 state 값 2로(등록완료) 변경
			adminService.updatebanner_apply_formState(AllBannerApplyInfo.getBanner_apply_form_id());
			
			return "redirect:/admin/manager_mainbannershowlist";
			
		} else if(AllBannerApplyInfo.getBanner_type() == 2) {	// 2일때 (서브배너 리다이렉트)
			
			SubBannerBean addsubBannerBean = new SubBannerBean();
			
			//파일 변경시
			if(AllBannerApplyInfo.getBanner_file().getSize()>0) {
				// 새파일 저장 및 file_id set
				addsubBannerBean.setSub_banner_file(AllBannerApplyInfo.getBanner_file());
				adminService.addfiletableBanner2(addsubBannerBean);
				
			} else {
				addsubBannerBean.setBanner_file_id(AllBannerApplyInfo.getBanner_file_id());				
			}
			
			addsubBannerBean.setExhibition_id(AllBannerApplyInfo.getExhibition_id());
			addsubBannerBean.setApply_person_id(AllBannerApplyInfo.getApply_person_id());
			addsubBannerBean.setStart_date(AllBannerApplyInfo.getStart_date());
			addsubBannerBean.setEnd_date(AllBannerApplyInfo.getEnd_date());
			
			// 숨김 안숨김 변경
			if(AllBannerApplyInfo.getState1() == 1) {
				addsubBannerBean.setState(1);
			} else {
				addsubBannerBean.setState(2);
			}
			
			addsubBannerBean.setPay_money(AllBannerApplyInfo.getPayment());
			// expose_order max값 가져와서 +1
			addsubBannerBean.setExpose_order(adminService.getSubMaxExposeOrder() + 1);
			
			// sub_banner 테이블에 insert
			adminService.addApplySubBanner(addsubBannerBean);
			
			// banner_apply_form 에서 state 값 2로(등록완료) 변경
			adminService.updatebanner_apply_formState(AllBannerApplyInfo.getBanner_apply_form_id());
			
			return "redirect:/admin/manager_subbannershowlist";
		}
		
		return "redirect:/admin/manager_subbannershowlist";

	}
		
}
