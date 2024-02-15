package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.mapper.AdminContentsMapper;

@Repository
public class AdminContentsDao {
	
	@Autowired
	private AdminContentsMapper adminContentsMapper;
	
	//======================================================공지사항
	
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
		
		

}
