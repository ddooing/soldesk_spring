package kr.co.softsoldesk.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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
	
	// QnA 검색 메소드
	public List<QnABean> getnicknameSearchQnAInfo(String search) {
		return adminDao.getnicknameSearchQnAInfo(search);
	}

	// QnA 제목 검색 메소드
	public List<QnABean> gettitleSearchQnAInfo(String search) {
		return adminDao.gettitleSearchQnAInfo(search);
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
	
}
