package kr.co.softsoldesk.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Value("${admin.listcnt}")
	private int admin_listcnt;
	
	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;
	
	
	// ===================================QnA===================================
	
	// 관리자 페이지 QnA 모든 info 가져오기
	public List<QnABean> getAllQnAInfo(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAllQnAInfo(rowBounds);
	}
	
	// 관리자 페이지 QnA 한개 정보 가져오기
	public QnABean getOneQnAInfo(int qna_id) {
		return adminDao.getOneQnAInfo(qna_id);
	}
	
	// 관리자 페이지 QnA 모든 개수 가져오기
	public QnABean getQnACount() {
		return adminDao.getQnACount();
	}
	
	// 관리자 페이지 QnA 답변 달기 메소드
	public void updateQnAReply(QnABean qnaBean) {
		adminDao.updateQnAReply(qnaBean);
	}
	
	// QnA 삭제처리(state 값 3으로 변경)
	public void deleteQnA(int qna_id) {
		adminDao.deleteQnA(qna_id);
	}
	
	// QnA 복구 처리 (state 값 1로 변경)
	public void recoveryQnA(int state, int qna_id) {
		adminDao.recoveryQnA(state, qna_id);
	}
	
	// QnA 닉네임 검색 메소드
	public List<QnABean> getnicknameSearchQnAInfo(String search, int page) {
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getnicknameSearchQnAInfo(search, rowBounds);
	}
	
	// QnA 닉네임 검색 페이지 처리 총개수 반환
	public PageBean getnicknameSearchQnACnt(String search, int currentPage) {
		
		int nickname_Cnt = adminDao.getnicknameSearchQnACnt(search);
		PageBean pageBean = new PageBean(nickname_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}

	// QnA 제목 검색 메소드
	public List<QnABean> gettitleSearchQnAInfo(String search, int page) {
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.gettitleSearchQnAInfo(search, rowBounds);
	}	
	
	// QnA 제목 검색 페이지 처리 총개수 반환
	public PageBean gettitleSearchQnACnt(String search, int currentPage) {
		
		int title_Cnt = adminDao.gettitleSearchQnACnt(search);
		PageBean pageBean = new PageBean(title_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// QnA 제목 검색 개수 반환 메소드
	public QnABean gettitleSearchQnACount(String search) {
		return adminDao.gettitleSearchQnACount(search);
	}
	
	// QnA 닉네임 검색 개수 반환 메소드
	public QnABean getnicknameSearchQnACount(String search) {
		return adminDao.getnicknameSearchQnACount(search);
	}
	
	// QnA 선택 삭제 메소드
	public void deleteSelectedQnA(List<Integer> qnaIds) {
		for (Integer qnaId : qnaIds) {
			adminDao.deleteSelectedQnA(qnaId);
	    }
	}
	
	// QnA 페이징 처리를 위한 메소드
	public PageBean getTotalQnACnt(int currentPage) {
		
		int qna_Cnt = adminDao.getTotalQnACnt();
		PageBean pageBean = new PageBean(qna_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		
		return pageBean;
	}
	
	
	//=================================== 전시회 관리 ===========================
	
	// 전시회 관리 첫페이지 찍혀오는 값 가져오기
	public List<ExhibitionBean> getAdminexhibitionmange(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAdminexhibitionmange(rowBounds);
	}
	
	// 전시회 관리 전시총개수, 전시예정, 진행중, 종료 전시 개수 반환
	public ExhibitionBean getExhibitionCount() {
		return adminDao.getExhibitionCount();
	}
	
	// 전시회 관리 페이징 처리
	public PageBean getExhibitionCnt(int currentPage) {
		int exhibition_Cnt = adminDao.getExhibitionCnt();
		PageBean pageBean = new PageBean(exhibition_Cnt, currentPage, admin_listcnt, admin_paginationcnt);

		return pageBean;
	}
	
	// 전시회 관리 작가 검색
	public List<ExhibitionBean> getauthorSearchExhibitionInfo(String search) {
		return adminDao.getauthorSearchExhibitionInfo(search);
	}
	
	// 전시회 관리 작가 검색 총 전시 개수, 종료예정, 전시예정, 진행중 개수 반환
	public ExhibitionBean getauthorSearchExhibitionCount(String search) {
		return adminDao.getauthorSearchExhibitionCount(search);
	}
	
	// 전시회 관리 작가 검색시 페이징 처리 위한 검색 총 개수 반환
	public PageBean getauthorSearchExhibitionCnt(String search, int currentPage) {
		
		int searchautor_Cnt = adminDao.getauthorSearchExhibitionCnt(search);
		PageBean pageBean = new PageBean(searchautor_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 관리 제목 검색
	public List<ExhibitionBean> gettitleSearchExhibitionInfo(String search, int page) {
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.gettitleSearchExhibitionInfo(search, rowBounds);
	}
	
	// 전시회 관리 제목 검색 총 전시 개수, 종료예정, 전시예정, 진행중 개수 반환
	public ExhibitionBean gettitleSearchExhibitionCount(String search) {
		return adminDao.gettitleSearchExhibitionCount(search);
	}
	
	// 전시회 관리 제목 검색시 페이징 처리 위한 검색 총 개수 반환
	public PageBean gettitleSearchExhibitionCnt(String search, int currentPage) {
		
		int searchtitle_Cnt = adminDao.gettitleSearchExhibitionCnt(search);
		PageBean pageBean = new PageBean(searchtitle_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}		
}
