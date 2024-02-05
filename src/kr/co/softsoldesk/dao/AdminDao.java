package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.mapper.AdminMapper;

@Repository
public class AdminDao {

	@Autowired
	private AdminMapper adminMapper;
	
	// 관리자 페이지 QnA 모든 리스트 가져오기
	public List<QnABean> getAllQnAInfo() {
		return adminMapper.getAllQnAInfo();
	}
	
	// 관리자 페이지 QnA 한개 정보 가져오기
	public QnABean getOneQnAInfo(int qna_id) {
		return adminMapper.getOneQnAInfo(qna_id);
	}
	
	// 관리자 페이지 QnA 모든 개수 가져오기
	public QnABean getQnACount() {
		return adminMapper.getQnACount();
	}
	
	// 관리자 페이지 QnA 답변 달기
	public void updateQnAReply(QnABean qnaBean) {
		adminMapper.updateQnAReply(qnaBean);
	}
	
	// QnA 삭제 처리(state 값 3으로 변경)
	public void deleteQnA(int qna_id) {
		adminMapper.deleteQnA(qna_id);
	}
	
	// QnA 복구 처리 (state 값 1로 변경)
	public void recoveryQnA(int state, int qna_id) {
		adminMapper.recoveryQnA(state, qna_id);
	}
	
	// QnA 닉네임 검색 메소드
	public List<QnABean> getnicknameSearchQnAInfo(String search) {
		return adminMapper.getnicknameSearchQnAInfo(search);
	}
	
	// QnA 제목 검색 메소드
	public List<QnABean> gettitleSearchQnAInfo(String search) {
		return adminMapper.gettitleSearchQnAInfo(search);
	}
	
	// QnA 제목 검색 개수 반환 메소드
	public QnABean gettitleSearchQnACount(String search) {
		return adminMapper.gettitleSearchQnACount(search);
	}
	
	// QnA 닉네임 검색 개수 반환 메소드
	public QnABean getnicknameSearchQnACount(String search) {
		return adminMapper.getnicknameSearchQnACount(search);
	}
	
	// QnA 선택 삭제 메소드
	public void deleteSelectedQnA(int qna_id) {
		adminMapper.deleteSelectedQnA(qna_id);
	}
	
	
}
