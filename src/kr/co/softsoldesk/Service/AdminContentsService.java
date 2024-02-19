package kr.co.softsoldesk.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.dao.AdminContentsDao;

@Service
public class AdminContentsService {
	
	@Autowired
	private AdminContentsDao adminContentsDao;
	
	@Value("${admin.listcnt}")
	private int admin_listcnt;
	
	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;
	
	
	//======================================================1. 공지사항
	
		public List<NoticeBean> getAllNoticeList(int page){
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getAllNoticeList(rowBounds);
			
		}
		
		public PageBean AllNoticeCnt(int currentPage) {
			int all_cnt = adminContentsDao.AllNoticeCnt();
			PageBean pageBean = new PageBean(all_cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}
		public int AllNoticeCnt1() {
			
			return adminContentsDao.AllNoticeCnt();
		}
		
		
		public List<NoticeBean> getSearchNoticeTitleList(String title, int page){
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getSearchNoticeTitleList(title, rowBounds);
		}
		
		public PageBean SearchNoticeCnt(String title, int currentPage) {
			int title_cnt = adminContentsDao.SearchNoticeCnt(title);
			PageBean pageBean = new PageBean(title_cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}
		public int SearchNoticeCnt(String title) {
			return adminContentsDao.SearchNoticeCnt(title);
		}
		
		
		public List<NoticeBean>getSearchNoticeAllTitleList(String title, int page){
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getSearchNoticeAllTitleList(title, rowBounds);
		}
		
		public PageBean AllSearchNoticeCnt(String title, int currentPage) {
			int allcon_cnt = adminContentsDao.AllSearchNoticeCnt(title);
			PageBean pageBean = new PageBean(allcon_cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}
		public int AllSearchNoticeCnt(String title) {
			return adminContentsDao.AllSearchNoticeCnt(title);
		}
		
		public void addNotice(NoticeBean njoinBean) {
			adminContentsDao.addNotice(njoinBean);
		}
		
		public NoticeBean getNoticeInfo(int notice_id) {
			return adminContentsDao.getNoticeInfo(notice_id);
		}
		
		public void Noticeview(int notice_id) {
			adminContentsDao.Noticeview(notice_id);
		}
		
		public void ModifyNoticeInfo(NoticeBean nmodifyBean) {
			adminContentsDao.ModifyNoticeInfo(nmodifyBean);
		}
		
		public void DeleteNotice(List<Integer> noIds ) {
			for(Integer noId : noIds) {
				adminContentsDao.DeleteNotice(noId);
			}
		}
		
		public void DeleteNotice(int notice_id) {
			adminContentsDao.DeleteNotice(notice_id);
		}
		
		//2. 게시판========================================================================
		
		// 게시글을 데이터베이스에 추가
		public void addboardFromAdmin(BoardBean boardBean) {

			adminContentsDao.addboardFromAdmin(boardBean);
		}
		
		
		public List<BoardBean> getAllBoardList(int page) {
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);

			return adminContentsDao.getAllBoardList(rowBounds);

		}
		
		public PageBean AllBoardCnt(int currentPage) {
			int all_cnt = adminContentsDao.AllBoardCnt();
			PageBean pageBean = new PageBean(all_cnt, currentPage, admin_listcnt, admin_paginationcnt);

			return pageBean;
		}
		
		public int AllBoardCnt1() {
			return adminContentsDao.AllBoardCnt();
		}
		
		public List<BoardBean> getSearchBoardTitleList(String title, int page) {
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);

			return adminContentsDao.getSearchBoardTitleList(title, rowBounds);
		}

		public PageBean SearchBoardCnt(String title, int currentPage) {
			int title_cnt = adminContentsDao.SearchBoardCnt(title);
			PageBean pageBean = new PageBean(title_cnt, currentPage, admin_listcnt, admin_paginationcnt);

			return pageBean;
		}

		public int SearchBoardCnt(String title) {
			return adminContentsDao.SearchBoardCnt(title);
		}

		public List<BoardBean> getSearchBoardAllTitleList(String title, int page) {
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);

			return adminContentsDao.getSearchBoardAllTitleList(title, rowBounds);
		}

		public PageBean AllSearchBoardCnt(String title, int currentPage) {
			int allcon_cnt = adminContentsDao.AllSearchBoardCnt(title);
			PageBean pageBean = new PageBean(allcon_cnt, currentPage, admin_listcnt, admin_paginationcnt);

			return pageBean;
		}

		public int AllSearchBoardCnt(String title) {
			return adminContentsDao.AllSearchBoardCnt(title);
		}
		public BoardBean getBoardInfo(int board_id) {
			return adminContentsDao.getBoardInfo(board_id);
		}
		
		public void DeleteBoard(List<Integer> noIds) {
			for (Integer noId : noIds) {
				adminContentsDao.DeleteBoard(noId);
			}
		}

		public void DeleteBoard(int notice_id) {
			adminContentsDao.DeleteBoard(notice_id);
		}

		
		// QnA 복구 처리 (state 값 1로 변경)
		public void recoveryBoard(int state, int board_id) {
			adminContentsDao.recoveryBoard(state, board_id);
		}
		
		
		
		
		// ===================================3. QnA===================================
		
		// 관리자 페이지 QnA 모든 info 가져오기
		public List<QnABean> getAllQnAInfo(int page) {
			
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getAllQnAInfo(rowBounds);
		}
		
		// 관리자 페이지 QnA 한개 정보 가져오기
		public QnABean getOneQnAInfo(int qna_id) {
			return adminContentsDao.getOneQnAInfo(qna_id);
		}
		
		// 관리자 페이지 QnA 모든 개수 가져오기
		public QnABean getQnACount() {
			return adminContentsDao.getQnACount();
		}
		
		// 관리자 페이지 QnA 답변 달기 메소드
		public void updateQnAReply(QnABean qnaBean) {
			adminContentsDao.updateQnAReply(qnaBean);
		}
		
		// QnA 삭제처리(state 값 3으로 변경)
		public void deleteQnA(int qna_id) {
			adminContentsDao.deleteQnA(qna_id);
		}
		
		// QnA 복구 처리 (state 값 1로 변경)
		public void recoveryQnA(int state, int qna_id) {
			adminContentsDao.recoveryQnA(state, qna_id);
		}
		
		// QnA 닉네임 검색 메소드
		public List<QnABean> getnicknameSearchQnAInfo(String search, int page) {
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getnicknameSearchQnAInfo(search, rowBounds);
		}
		
		// QnA 닉네임 검색 페이지 처리 총개수 반환
		public PageBean getnicknameSearchQnACnt(String search, int currentPage) {
			
			int nickname_Cnt = adminContentsDao.getnicknameSearchQnACnt(search);
			PageBean pageBean = new PageBean(nickname_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}

		// QnA 제목 검색 메소드
		public List<QnABean> gettitleSearchQnAInfo(String search, int page) {
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.gettitleSearchQnAInfo(search, rowBounds);
		}	
		
		// QnA 제목 검색 페이지 처리 총개수 반환
		public PageBean gettitleSearchQnACnt(String search, int currentPage) {
			
			int title_Cnt = adminContentsDao.gettitleSearchQnACnt(search);
			PageBean pageBean = new PageBean(title_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}
		
		// QnA 제목 검색 개수 반환 메소드
		public QnABean gettitleSearchQnACount(String search) {
			return adminContentsDao.gettitleSearchQnACount(search);
		}
		
		// QnA 닉네임 검색 개수 반환 메소드
		public QnABean getnicknameSearchQnACount(String search) {
			return adminContentsDao.getnicknameSearchQnACount(search);
		}
		
		// QnA 선택 삭제 메소드
		public void deleteSelectedQnA(List<Integer> qnaIds) {
			for (Integer qnaId : qnaIds) {
				adminContentsDao.deleteSelectedQnA(qnaId);
		    }
		}
		
		// QnA 페이징 처리를 위한 메소드
		public PageBean getTotalQnACnt(int currentPage) {
			
			int qna_Cnt = adminContentsDao.getTotalQnACnt();
			PageBean pageBean = new PageBean(qna_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			
			return pageBean;
		}
		
		
		
		
		
		// ===================================4. FAQ===================================
		
		   public List<FAQBean>getFAQList(int page){
		      int start = (page - 1) * admin_listcnt;
		      RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		      
		      
		      return adminContentsDao.getFAQList(rowBounds);
		   }
		   
		   public List<FAQBean>getmpFAQList(){
		      return adminContentsDao.getmpFAQList();
		   }
		   
		   public void regFAQ(FAQBean FAQBean) {
		      
			   adminContentsDao.regFAQ(FAQBean);
		   }
		   
		   public void FAQmodifyBean(FAQBean FAQmodifyBean) {
			   adminContentsDao.FAQmodifyBean(FAQmodifyBean);
		   }
		   
		   public PageBean getTotalFAQCnt(int currentPage) {
		      
		      int faq_Cnt = adminContentsDao.getTotalFAQCnt();
		      PageBean pageBean1 = new PageBean(faq_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		      
		      
		      return pageBean1;
		   }
		   
		   public List<FAQBean>getFAQSerchList(int page, String title){
		      
		      int start = (page - 1) * admin_listcnt;
		      RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		      
		      return adminContentsDao.getFAQSerchList(rowBounds, title);
		   }
		   
		   public PageBean getFAQSerchListCnt(int currentPage, String keyword) {
		      
		      int faq_cnt = adminContentsDao.getFAQSerchListCnt(keyword);
		      PageBean pageBean = new PageBean(faq_cnt, currentPage, admin_listcnt, admin_paginationcnt);
		      
		      return pageBean;
		      
		   }
		   
		   public FAQBean getOneFAQInfo(int faq_id) {
		      return adminContentsDao.getOneFAQInfo(faq_id);
		   }
		   
		   public void deleteSelectedFAQ(List<Integer> faqIds) {
		      for (Integer faqId : faqIds) {
		    	  adminContentsDao.deleteSelectedFAQ(faqId);
		       }
		   }
	
	

}
