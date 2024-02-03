package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ArchiveBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.ReviewBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.mapper.MyPageMapper;

@Repository
public class MyPageDao {

	@Autowired
	private MyPageMapper myPageMapper;
	
	// 마이페이지 상단 info 창용
	public UserBean getMyPageTopInfo(int user_id) {
		return myPageMapper.getMyPageTopInfo(user_id);
	}
	
	// 마이페이지 결제 내역 조회 메소드
	public List<ReserveBean> getMyPageReserveList(int user_id) {
		return myPageMapper.getMyPageReserveList(user_id);
	}
	
	// 마이페이지 북마크 내역 메소드
	public List<ExhibitionBean> getMyPageBookmarkList(int user_id) {
		return myPageMapper.getMyPageBookmarkList(user_id);
	}
	
	// 마이페이지 아카이브 모든 정보 리스트
	public List<ArchiveBean> getArciveAllInfo(int user_id) {
		return myPageMapper.getArciveAllInfo(user_id); 
	}
	
	// 마이페이지 아카이브 1개 정보 메소드
	public ArchiveBean getArchiveOneInfo(int reserve_id) {
		return myPageMapper.getArchiveOneInfo(reserve_id); 
	}
	
	// 마이페이지 아카이브 글등록 메소드
	public void enrollArchive(ReviewBean reviewBean) {
		myPageMapper.enrollArchive(reviewBean);
	}
	
	// 마이페이지 아카이브 글수정 메소드
	public void modifyArchive(ReviewBean reviewBean) {
		myPageMapper.modifyArchive(reviewBean);
	}
	
	
}
