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

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Service.AdminContentsService;


@Controller
@RequestMapping("/admin")
public class AdminContentsController {
	
	@Autowired
	private AdminContentsService AdminContentsService;
	
	//1. 공지사항 관리==================================================================================================
	
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
	
	@GetMapping("/onedeleteN")
	public String onedeleteN(@RequestParam("notice_id")int notice_id) {
		
		AdminContentsService.DeleteNotice(notice_id);
		
		return "redirect:/admin/manager_noticemanage";
	}
	
	// 2. 게시판 관리==============================================================================================
	
	// 게시글 목록
		@GetMapping("manager_boardlist")
		public String manager_boardlist(Model model, @RequestParam(value="type", required=false) String type,
											@RequestParam(value="keyword", required=false) String keyword,
											@RequestParam(value="page", defaultValue = "1")int page) {
			// 제목 내용
			if ("titlecontents".equals(type) && keyword != null) {
				 List<BoardBean> titleList = AdminContentsService.getSearchBoardAllTitleList(keyword, page);
				 model.addAttribute("boardList", titleList);
				 
				 PageBean pageBean2 = AdminContentsService.AllSearchBoardCnt(keyword, page);
				 model.addAttribute("pageBean2", pageBean2);
				 
				 int n3 = AdminContentsService.AllSearchBoardCnt(keyword);
				 model.addAttribute("n3", n3);
				 
				 
				 model.addAttribute("type",type);
				 model.addAttribute("keyword",keyword);
				 
			}else if("title".equals(type) && keyword != null) {
				List<BoardBean> allList = AdminContentsService.getSearchBoardTitleList(keyword, page);
				model.addAttribute("boardList", allList);
				
				PageBean pageBean1 = AdminContentsService.SearchBoardCnt(keyword, page);
				model.addAttribute("pageBean1", pageBean1);
				
				int n2 = AdminContentsService.SearchBoardCnt(keyword);
				model.addAttribute("n2", n2);
				
				model.addAttribute("type",type);
				model.addAttribute("keyword",keyword);
				
					
			}else if("nickname".equals(type) && keyword != null) {
				List<BoardBean> nameList = AdminContentsService.getSearchBoardUserNameList(keyword, page);
				model.addAttribute("boardList", nameList);
				
				PageBean pageBean3 = AdminContentsService.SearchBoardCnt(keyword, page);
				model.addAttribute("pageBean3", pageBean3);
				
				int n4 = AdminContentsService.SearchBoardCnt(keyword);
				model.addAttribute("n4", n4);
				
				model.addAttribute("type",type);
				model.addAttribute("keyword",keyword);
			} else {
				List<BoardBean> boardList = AdminContentsService.getAllBoardList(page);
				model.addAttribute("boardList", boardList);
				
				PageBean pageBean = AdminContentsService.AllBoardCnt(page);
				model.addAttribute("pageBean", pageBean);
				
				int n1 = AdminContentsService.AllBoardCnt1();
				model.addAttribute("n1", n1);
				
				model.addAttribute("type",type);
				model.addAttribute("keyword",keyword);
				
			 }
			
			return "admin/manager_boardlist";
		}
		
		// 게시판 상세보기
		@GetMapping("/manager_boardlook") 
		public String manager_boardlook(@RequestParam("board_id")int board_id, Model model) {
		
			model.addAttribute("board_id", board_id);
			
			BoardBean RN = AdminContentsService.getBoardInfo(board_id);
			model.addAttribute("RN", RN);
			
			return "admin/manager_boardlook";
		}
		
		
		// 게시판 관리자 글쓰기
		@GetMapping("/manager_boardwrite")
		public String manager_boardwrite() {
			
			return "admin/manager_boardwrite";
		}
		
		// 게시글 관리자 작성 처리
	    @PostMapping("/manager_boardwrite_pro")
	    public String manager_boardwrite_pro(@ModelAttribute("boardBean")BoardBean boardBean, Model model) {
	   
	    	// 게시글 추가
	    	AdminContentsService.addboardFromAdmin(boardBean);
	    	
	    	return "redirect:/admin/manager_boardlist";
	    }
		
		@PostMapping("/DeleteBoard")
		public ResponseEntity<?> AllDeleteBoard(@RequestParam("boardIds") List<Integer> boardIds) {
			
			AdminContentsService.DeleteBoard(boardIds);
			
		    return ResponseEntity.ok().build();
		} 
		
		@GetMapping("/onedeleteB")
		public String onedeleteB(@RequestParam("board_id")int board_id) {
			
			AdminContentsService.DeleteBoard(board_id);
			
			return "redirect:/admin/manager_boardlist";
		}
		// 게시판 복구
		@GetMapping("/board_recovery")
		public String board_recovery(@RequestParam("board_id") int board_id,
									 @RequestParam(value="type", required=false) String type,
									 @RequestParam(value="keyword", required=false) String keyword,
									 @RequestParam(value = "page", defaultValue = "1") int page, Model model, 
									 @ModelAttribute("boardBean") BoardBean boardBean) {
			AdminContentsService.recoveryBoard(board_id);
		    return "redirect:/admin/manager_boardlist";
		}
		
		@GetMapping("/manager_boardmodify")
		public String manager_boardmodify(@RequestParam("board_id")int board_id, Model model,
											@ModelAttribute("bModifyBean")BoardBean bModifyBean) {
			
			BoardBean boardModify = AdminContentsService.getBoardInfo(board_id);
			model.addAttribute("boardModify", boardModify);
			
			bModifyBean.setContents(boardModify.getContents());
			
			return "admin/manager_boardmodify";
		}
		
		@PostMapping("/boardmodify_pro")
		public String boardmodify_pro(@ModelAttribute("bModifyBean")BoardBean bModifyBean) {
			AdminContentsService.managerModifyBoard(bModifyBean);
			
			
			return "redirect:/admin/manager_boardlist";
		}
	
	
	// ======================================= 3. QnA관리 ================================
		@GetMapping("/manager_QnAlist")
		public String manager_QnAlist(@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
			
				if (usercombo == null || usercombo.isEmpty() || usersearch == null || usersearch.isEmpty()) {
					// QnA 모든 정보 가져가기
					List<QnABean> qnaAllBean = AdminContentsService.getAllQnAInfo(page);
					model.addAttribute("qnaAllBean", qnaAllBean);
							
					// QnA 총 개수, 답변전, 답변완료 개수 가져가기
					QnABean qnaCountBean = AdminContentsService.getQnACount();
					model.addAttribute("qnaCountBean",qnaCountBean);
							
					// QnA 관리자 페이지 페이징 처리
					PageBean pageBean = AdminContentsService.getTotalQnACnt(page);
					model.addAttribute("pageBean", pageBean);
							
					return "admin/manager_QnAlist";
		    }
			
			
			if("nickname".equals(usercombo)) {
				// 닉네임 검색
				List<QnABean> nicknameSearchBean = AdminContentsService.getnicknameSearchQnAInfo(usersearch, page);
				model.addAttribute("qnaAllBean", nicknameSearchBean);
				
				// 닉네임 검색 개수 반환 메소드
				QnABean QnAnicknamesearchCount = AdminContentsService.getnicknameSearchQnACount(usersearch);
				model.addAttribute("qnaCountBean",QnAnicknamesearchCount);
				
				// 페이징 처리
				PageBean pageBean1 = AdminContentsService.getnicknameSearchQnACnt(usersearch, page);
				model.addAttribute("pageBean1", pageBean1);
		
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("usercombo",usercombo);
				model.addAttribute("usersearch",usersearch);
				
			} else if ("title".equals(usercombo)) {
				// 제목 검색
				List<QnABean> titleSearchBean = AdminContentsService.gettitleSearchQnAInfo(usersearch, page);
				model.addAttribute("qnaAllBean", titleSearchBean);
				
				// 제목 검색 개수 반환 메소드
				QnABean QnAtitlesearchCount = AdminContentsService.gettitleSearchQnACount(usersearch);
				model.addAttribute("qnaCountBean",QnAtitlesearchCount);
				
				// 페이징 처리
				PageBean pageBean2 = AdminContentsService.gettitleSearchQnACnt(usersearch, page);
				model.addAttribute("pageBean2", pageBean2);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("usercombo",usercombo);
				model.addAttribute("usersearch",usersearch);
			} 
			
			return "admin/manager_QnAlist";
		}
		
		@GetMapping("/manager_QnAwrite")
		public String manager_QnAwrite(@ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id, Model model) {
			
			QnABean oneQnaInfo = AdminContentsService.getOneQnAInfo(qna_id);
			model.addAttribute("oneQnaInfo", oneQnaInfo);
			
			return "admin/manager_QnAwrite";
		}
		
		// qna 답변 등록
		@PostMapping("/qna_reply_enroll")
		public String qna_reply_enroll(@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model, @ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id) {
			
			qnaBean.setQna_id(qna_id);
			
			if(qnaBean.getReply() == "") {
				qnaBean.setState(0);
				AdminContentsService.updateQnAReply(qnaBean);
			} else {
				qnaBean.setState(1);
				AdminContentsService.updateQnAReply(qnaBean);
			}
			

				return "redirect:/admin/manager_QnAlist";
		}
		
		@GetMapping("/manager_QnAdelete")
		public String manager_QnAdelete(@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model, @ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id) {
			
			// QnA 삭제 처리
			AdminContentsService.deleteQnA(qna_id);

			return "redirect:/admin/manager_QnAlist";
		}
		
		@GetMapping("/QnA_recovery")
		public String QnA_recovery(@RequestParam("reply") String reply,@RequestParam(value="usercombo", required=false) String usercombo, @RequestParam(value="usersearch", required=false) String usersearch,@RequestParam(value = "page", defaultValue = "1") int page, Model model, @ModelAttribute("oneQnaInfo") QnABean qnaBean, @RequestParam("qna_id") int qna_id) {
			
			// QnA 복구 
			if(reply != "") {	// 답글이 달려있을때는 state 값 1로 아닐때는 0으로 복구
				int state = 1;
				AdminContentsService.recoveryQnA(state, qna_id);
			} else {
				int state = 0;
				AdminContentsService.recoveryQnA(state, qna_id);
			}
			
			return "redirect:/admin/manager_QnAlist";
		}
		
		// 선택 삭제 메소드
		@PostMapping("/deleteSelectedQnA")
		public ResponseEntity<?> deleteSelectedQnA(@RequestParam("qnaIds") List<Integer> qnaIds) {
			
			AdminContentsService.deleteSelectedQnA(qnaIds);
			
		    return ResponseEntity.ok().build();
		}
	
	
	
	
	
	//=========================================================================4. FAQ
	   
	   @GetMapping("/manager_FAQlist")
	   public String manager_FAQlist(Model model, @RequestParam(value="page", defaultValue = "1")int page,
	                            @RequestParam(value="type", required=false) String type,
	                           @RequestParam(value="keyword", required=false) String keyword) {
	      
	       if ("title".equals(type) && keyword != null) {
	          List<FAQBean> titleList = AdminContentsService.getFAQSerchList(page, keyword);
	          model.addAttribute("FAQList", titleList);
	          
	          
	          PageBean pageBean2 = AdminContentsService.getFAQSerchListCnt(page, keyword);
	          model.addAttribute("pageBean1", pageBean2);
	          
	          model.addAttribute("type",type);
	         model.addAttribute("keyword",keyword);
	      }else {
	         List<FAQBean> FAQList = AdminContentsService.getFAQList(page);
	          model.addAttribute("FAQList", FAQList);
	          
	          
	          PageBean pageBean1 = AdminContentsService.getTotalFAQCnt(page);
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
	   public String FAQreg_pro(@ModelAttribute("FAQBean")FAQBean FAQBean) {
	      
		   AdminContentsService.regFAQ(FAQBean);
	      
	      
	      return "redirect:/admin/manager_FAQlist";
	   }
	   
	   @GetMapping("manager_FAQdetail")
	   public String FAQdetail(@RequestParam("faq_id") int faq_id, Model model,
	                     @ModelAttribute("FAQmodifyBean")FAQBean FAQmodifyBean) {
	      
	     // System.out.println(faq_id);
	      
	      FAQBean oneFAQInfo = AdminContentsService.getOneFAQInfo(faq_id);
	      
	      FAQmodifyBean.setContents(oneFAQInfo.getContents());
	      FAQmodifyBean.setTitle(oneFAQInfo.getTitle());
	      FAQmodifyBean.setState(oneFAQInfo.getState());
	      model.addAttribute("oneFAQInfo", oneFAQInfo);
	     // System.out.println(FAQmodifyBean.getState());
	      
	      return "admin/manager_FAQdetail";
	   }
	   
	   @PostMapping("manager_FAQdetail_pro")
	   public String FAQdetail_pro(@ModelAttribute("FAQmodifyBean")FAQBean FAQmodifyBean, Model model) {
	      
		   AdminContentsService.FAQmodifyBean(FAQmodifyBean);
	      
	      return "redirect:/admin/manager_FAQlist";
	   }
	   
	   @PostMapping("/deleteSelectedFAQ")
	   public ResponseEntity<?> deleteSelectedFAQ(@RequestParam("faqIds") List<Integer> faqIds) {
	      
		   AdminContentsService.deleteSelectedFAQ(faqIds);
	      
	       return ResponseEntity.ok().build();
	   }
	   
	   @GetMapping("FAQ_recovery")
	   public String FAQ_recovery(@RequestParam("faq_id")int faq_id) {
		   AdminContentsService.recoveryFAQ(faq_id);
		   
		   return "redirect:/admin/manager_FAQlist";
	   }
	

}
