package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.mapper.AdminMapper;

@Repository
public class AdminDao {

	@Autowired
	private AdminMapper adminMapper;
	
	// ============================QnA==============================
	
	// 관리자 페이지 QnA 모든 리스트 가져오기
	public List<QnABean> getAllQnAInfo(RowBounds rowBounds) {
		return adminMapper.getAllQnAInfo(rowBounds);
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
	public List<QnABean> getnicknameSearchQnAInfo(String search, RowBounds rowBounds) {
		return adminMapper.getnicknameSearchQnAInfo(search, rowBounds);
	}
	
	// QnA 닉네임 검색 페이징처리 총개수 반환
	public int getnicknameSearchQnACnt(String search) {
		return adminMapper.getnicknameSearchQnACnt(search);
	}
	
	// QnA 제목 검색 메소드
	public List<QnABean> gettitleSearchQnAInfo(String search, RowBounds rowBounds) {
		return adminMapper.gettitleSearchQnAInfo(search, rowBounds);
	}
	
	// QnA 제목 검색 페이징처리 총개수 반환
	public int gettitleSearchQnACnt(String search) {
		return adminMapper.gettitleSearchQnACnt(search);
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
	
	// QnA 페이징 처리를 위한 총 qna 개수 반환
	public int getTotalQnACnt() {
		return adminMapper.getTotalQnACnt();
	}
	
	
	// ============================= 전시회 관리 =======================
	
	// 전시회 관리 페이지 찍혀오는 값 가져가기
	public List<ExhibitionBean> getAdminexhibitionmange(RowBounds rowBounds) {
		return adminMapper.getAdminexhibitionmange(rowBounds);
	}
	
	// 전시회 관리 페이지 전시회 총개수, 전시예정, 진행중, 종료전시 반환
	public ExhibitionBean getExhibitionCount() {
		return adminMapper.getExhibitionCount();
	}
	
	// 전시회 관리 페이징 처리
	public int getExhibitionCnt() {
		return adminMapper.getExhibitionCnt();
	}
	
	// 전시회 관리 작가 검색
	public List<ExhibitionBean> getauthorSearchExhibitionInfo(String search) {
		return adminMapper.getauthorSearchExhibitionInfo(search);
	}
	
	// 전시회 관리 작가 검색 중 총 전시 개수, 전시예정 , 종료 전시 개수 반환
	public ExhibitionBean getauthorSearchExhibitionCount(String search) {
		return adminMapper.getauthorSearchExhibitionCount(search);
	}
	
	// 전시회 관리 작가 검색 페이징 처리
	public int getauthorSearchExhibitionCnt(String search) {
		return adminMapper.getauthorSearchExhibitionCnt(search);
	}
	
	// 전시회 관리 제목 검색
	public List<ExhibitionBean> gettitleSearchExhibitionInfo(String search, RowBounds rowBounds) {
		return adminMapper.gettitleSearchExhibitionInfo(search, rowBounds);
	}
	
	// 전시회 관리 제목 검색 중 총 전시 개수, 전시예정, 종료 전시 개수 반환
	public ExhibitionBean gettitleSearchExhibitionCount(String search) {
		return adminMapper.gettitleSearchExhibitionCount(search);
	}
	
	// 전시회 관리 제목 검색 페이징 처리
	public int gettitleSearchExhibitionCnt(String search) {
		return adminMapper.gettitleSearchExhibitionCnt(search);
	}
	
	// 전시회 관리 전시회 수정
	public ExhibitionDetailBean getAllDetailExhibitionBean(int exhibition_id) {
		return adminMapper.getAllDetailExhibitionBean(exhibition_id);
	}
	
	// 전시회 수정 업데이트문 1 (file table)
	public void UpdateExhibitionInfo1(String name, int file_id) {
		adminMapper.UpdateExhibitionInfo1(name, file_id);
	}
	
	// 전시회 수정 업데이트문 2 (exhibition table)
	public void UpdateExhibitionInfo2(ExhibitionDetailBean exhibitiondetailBean) {
		adminMapper.UpdateExhibitionInfo2(exhibitiondetailBean);
	}
	
	// 전시회 추가 파일테이블 1
	public void addfiletableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
				
		adminMapper.addfiletableExhibition(exhibitionDetailBean);
	}
	
	// 전시회 추가 파일테이블에서 file_id 가져오기
	public int getFileId(String name) {
		
		return adminMapper.getFileId(name); 
	}
	
	
	// 전시회 추가 전시회테이블 2
	public void addexhibitiontableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
		
		adminMapper.addexhibitiontableExhibition(exhibitionDetailBean);
	}
}
