package kr.co.softsoldesk.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	// 관리자 페이지 QnA 모든 info 가져오기
	public List<QnABean> getAllQnAInfo() {
		return adminDao.getAllQnAInfo();
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
	
	
}
