package kr.co.softsoldesk.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.ArchiveBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.ReviewBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.MyPageDao;

@Service
public class MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	// 마이페이지용 상단 Info창
	public UserBean getMyPageTopInfo(int user_id) {
		return myPageDao.getMyPageTopInfo(user_id);
	}
	
	// 마이페이지 예약 조회 리스트
	public List<ReserveBean> getMyPageReserveList(int user_id) {
		return myPageDao.getMyPageReserveList(user_id);
	}
	
	// 마이페이지 북마크 리스트
	public List<ExhibitionBean> getMyPageBookmarkList(int user_id) {
		return myPageDao.getMyPageBookmarkList(user_id);
	}
	
	// 마이페이지 아카이브 모든 정보 리스트
	public List<ArchiveBean> getArciveAllInfo(int user_id) {
		return myPageDao.getArciveAllInfo(user_id);
	}
	
	// 마이페이지 아카이브 모든 정보 리스트
	public ArchiveBean getArchiveOneInfo(int reserve_id) {
		return myPageDao.getArchiveOneInfo(reserve_id);
	}	
	
	// 마이페이지 아카이브 글등록 메소드
	public void enrollArchive(ReviewBean reviewBean) {
		myPageDao.enrollArchive(reviewBean);
	}
	
	// 해당 유저 QnA 리스트 가져오는 메소드
	public List<QnABean> getUserQnAList(int user_id) {
		return myPageDao.getUserQnAList(user_id);
	}
	
	// 마이페이지 아카이브 글수정 메소드
	public void modifyArchive(ReviewBean reviewBean) {
		myPageDao.modifyArchive(reviewBean);
	}
	
	// 마이페이지 qna 등록 메소드
	public void addUserQnA(QnABean qnaBean) {
		myPageDao.addUserQnA(qnaBean);
	}
	
	
}
