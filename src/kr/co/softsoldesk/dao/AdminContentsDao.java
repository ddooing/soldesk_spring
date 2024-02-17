package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.mapper.AdminContentsMapper;

@Repository
public class AdminContentsDao {
	
	@Autowired
	private AdminContentsMapper adminContentsMapper;
	
	//======================================================1. 공지사항
	
		public List<NoticeBean>getAllNoticeList(RowBounds rowBounds){
			return adminContentsMapper.getAllNoticeList(rowBounds);
		}
		
		public int AllNoticeCnt() {
			return adminContentsMapper.AllNoticeCnt();
		}
		
		
		public List<NoticeBean>getSearchNoticeTitleList(String title, RowBounds rowBounds){
			return adminContentsMapper.getSearchNoticeTitleList(title, rowBounds);
		}
		
		public int SearchNoticeCnt(String title) {
			return adminContentsMapper.SearchNoticeCnt(title);
		}
		
		
		public List<NoticeBean>getSearchNoticeAllTitleList(String title, RowBounds rowBounds){
			return adminContentsMapper.getSearchNoticeAllTitleList(title, rowBounds);
		}
		
		public int AllSearchNoticeCnt(String title) {
			return adminContentsMapper.AllSearchNoticeCnt(title);
		}
		
		public void addNotice(NoticeBean njoinBean) {
			adminContentsMapper.addNotice(njoinBean);
		}
		
		public NoticeBean getNoticeInfo(int notice_id) {
			return adminContentsMapper.getNoticeInfo(notice_id);
		}
		
		public void Noticeview(int notice_id) {
			adminContentsMapper.Noticeview(notice_id);
		}
		
		public void ModifyNoticeInfo(NoticeBean nmodifyBean) {
			adminContentsMapper.ModifyNoticeInfo(nmodifyBean);
		}
		
		public void DeleteNotice(int notice_id) {
			adminContentsMapper.DeleteNotice(notice_id);
		}
		
		
		//2. 게시판============================================================
		
		// 게시글 추가테이블
		public void addboardFromAdmin(BoardBean boardBean) {

			adminContentsMapper.addboardFromAdmin(boardBean);
		}
		// 게시글 목록
		public List<BoardBean> getAllBoardList(RowBounds rowBounds) {
			return adminContentsMapper.AllBoardList(rowBounds);
		}
		// 게시글 총 수
		public int AllBoardCnt() {
			return adminContentsMapper.AllBoardCnt();
		}
		
		// 검색
		public List<BoardBean> getSearchBoardTitleList(String title, RowBounds rowBounds) {
			return adminContentsMapper.getSearchBoardTitleList(title, rowBounds);
		}

		public int SearchBoardCnt(String title) {
			return adminContentsMapper.SearchBoardCnt(title);
		}

		public List<BoardBean> getSearchBoardAllTitleList(String title, RowBounds rowBounds) {
			return adminContentsMapper.getSearchBoardAllTitleList(title, rowBounds);
		}
		
		public int AllSearchBoardCnt(String title) {
			return adminContentsMapper.AllSearchBoardCnt(title);
		}
		// 관리자 게시글 상세보기
		public BoardBean getBoardInfo(int board_id) {
			return adminContentsMapper.getBoardInfo(board_id);
		}
		
		// 삭제
		public void DeleteBoard(int board_id) {
			adminContentsMapper.DeleteBoard(board_id);
		}

		// QnA 복구 처리 (state 값 1로 변경)
		public void recoveryBoard(int state, int board_id) {
			adminContentsMapper.recoveryBoard(state, board_id);
		}
		
		
		
		
		// ============================3. QnA==============================
		
		// 관리자 페이지 QnA 모든 리스트 가져오기
		public List<QnABean> getAllQnAInfo(RowBounds rowBounds) {
			return adminContentsMapper.getAllQnAInfo(rowBounds);
		}
		
		// 관리자 페이지 QnA 한개 정보 가져오기
		public QnABean getOneQnAInfo(int qna_id) {
			return adminContentsMapper.getOneQnAInfo(qna_id);
		}
		
		// 관리자 페이지 QnA 모든 개수 가져오기
		public QnABean getQnACount() {
			return adminContentsMapper.getQnACount();
		}
		
		// 관리자 페이지 QnA 답변 달기
		public void updateQnAReply(QnABean qnaBean) {
			adminContentsMapper.updateQnAReply(qnaBean);
		}
		
		// QnA 삭제 처리(state 값 3으로 변경)
		public void deleteQnA(int qna_id) {
			adminContentsMapper.deleteQnA(qna_id);
		}
		
		// QnA 복구 처리 (state 값 1로 변경)
		public void recoveryQnA(int state, int qna_id) {
			adminContentsMapper.recoveryQnA(state, qna_id);
		}
		
		// QnA 닉네임 검색 메소드
		public List<QnABean> getnicknameSearchQnAInfo(String search, RowBounds rowBounds) {
			return adminContentsMapper.getnicknameSearchQnAInfo(search, rowBounds);
		}
		
		// QnA 닉네임 검색 페이징처리 총개수 반환
		public int getnicknameSearchQnACnt(String search) {
			return adminContentsMapper.getnicknameSearchQnACnt(search);
		}
		
		// QnA 제목 검색 메소드
		public List<QnABean> gettitleSearchQnAInfo(String search, RowBounds rowBounds) {
			return adminContentsMapper.gettitleSearchQnAInfo(search, rowBounds);
		}
		
		// QnA 제목 검색 페이징처리 총개수 반환
		public int gettitleSearchQnACnt(String search) {
			return adminContentsMapper.gettitleSearchQnACnt(search);
		}
		
		// QnA 제목 검색 개수 반환 메소드
		public QnABean gettitleSearchQnACount(String search) {
			return adminContentsMapper.gettitleSearchQnACount(search);
		}
		
		// QnA 닉네임 검색 개수 반환 메소드
		public QnABean getnicknameSearchQnACount(String search) {
			return adminContentsMapper.getnicknameSearchQnACount(search);
		}
		
		// QnA 선택 삭제 메소드
		public void deleteSelectedQnA(int qna_id) {
			adminContentsMapper.deleteSelectedQnA(qna_id);
		}
		
		// QnA 페이징 처리를 위한 총 qna 개수 반환
		public int getTotalQnACnt() {
			return adminContentsMapper.getTotalQnACnt();
		}
		
		
		
		// ============================4. FAQ==============================
		
		   public List<FAQBean>getFAQList(RowBounds rowBounds){
		      return adminContentsMapper.getFAQList(rowBounds);
		   }
		   
		   public List<FAQBean>getmpFAQList(){
		      return adminContentsMapper.getmpFAQList();
		   }
		   
		   public void regFAQ(FAQBean FAQBean) {
		      
			   adminContentsMapper.regFAQ(FAQBean);
		   }
		   
		   public void FAQmodifyBean(FAQBean FAQmodifyBean) {
			   adminContentsMapper.FAQmodifyBean(FAQmodifyBean);
		   }
		   
		   public int getTotalFAQCnt() {
		      return adminContentsMapper.getTotalFAQCnt();
		   }
		   
		   public List<FAQBean>getFAQSerchList(RowBounds rowBounds, String title){
		      return adminContentsMapper.getFAQSerchList(rowBounds, title);
		   }
		   
		   public int getFAQSerchListCnt(String keyword) {
		      return adminContentsMapper.getFAQSerchListCnt(keyword);
		   }
		   
		   public FAQBean getOneFAQInfo(int faq_id) {
		      return adminContentsMapper.getOneFAQInfo(faq_id);
		   }
		   
		   // FaQ 선택 삭제 메소드
		   public void deleteSelectedFAQ(int faq_id) {
			   adminContentsMapper.deleteSelectedFAQ(faq_id);
		   }
		

}
