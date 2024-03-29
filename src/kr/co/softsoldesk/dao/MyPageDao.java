package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ArchiveBean;
import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.QnABean;
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
   public List<ReserveBean> getMyPageReserveList(int user_id, RowBounds rowBounds) {
      return myPageMapper.getMyPageReserveList(user_id, rowBounds);
   }
   
   // 마이페이지 북마크 내역 메소드
   public List<ExhibitionBean> getMyPageBookmarkList(int user_id, RowBounds rowBounds) {
      return myPageMapper.getMyPageBookmarkList(user_id,rowBounds);
   }
   
   // 마이페이지 아카이브 모든 정보 리스트
   public List<ArchiveBean> getArciveAllInfo(int user_id, RowBounds rowBounds) {
      return myPageMapper.getArciveAllInfo(user_id, rowBounds); 
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
   
   // 해당 유저 QnA 리스트 가져오는 메소드
   public List<QnABean> getUserQnAList(int user_id, RowBounds rowBounds) {
      return myPageMapper.getUserQnAList(user_id, rowBounds);
   }
   
   // 마이페이지 QnA 등록 메소드
   public void addUserQnA(QnABean qnaBean) {
      myPageMapper.addUserQnA(qnaBean);
   }
   
   // 마이페이지 QnA 해당 유저 개수 반환
   public int getQnAlistCnt(int user_id) {
      return myPageMapper.getQnAlistCnt(user_id);
   }
   
   // reservelist 페이징 처리용 
   public int getreservelistCnt(int user_id) {
      return myPageMapper.getreservelistCnt(user_id);
   }
   
   // bookmark 페이징 처리용 전체개수 가져오기
   public int getbookmarklistCnt(int user_id) {
      return myPageMapper.getbookmarklistCnt(user_id);
   }
   
   // 아카이브 페이징 처리용 전체 개수 가져오기
   public int getarchivelistCnt(int user_id) {
      return myPageMapper.getarchivelistCnt(user_id);
   }
   
   public List<NoticeBean> getImportantNoticeList(RowBounds rowBounds){
      return myPageMapper.getImportantNoticeList(rowBounds);
   }
   
   public int getImportantNoticeListCnt() {
      return myPageMapper.getImportantNoticeListCnt();
   }
   
   public List<NoticeBean>getImportantNoticeSearchList(String title, RowBounds rowBounds){
      return myPageMapper.getImportantNoticeSearchList(title, rowBounds);
   }
   
   public int getImportantNoticeSearchListCnt(String title) {
      return myPageMapper.getImportantNoticeSearchListCnt(title);
   }
   
   public List<NoticeBean>getImportantNoticSearchAllList(String title, RowBounds rowBounds){
      return myPageMapper.getImportantNoticeSearchAllList(title, rowBounds);
   }
   
   public int getImportantNoticeSearchAllListCnt(String title) {
      return myPageMapper.getImportantNoticeSearchAllListCnt(title);
   }
   
   //마이페이지 내가 쓴글 목록
   public List<BoardBean>myBoardList(int user_id, RowBounds rowBounds){
	   return myPageMapper.myBoardList(user_id, rowBounds);
   }
   
   public int getMyBoardListCnt(int user_id) {
	   return myPageMapper.getMyBoardListCnt(user_id);
   }
}