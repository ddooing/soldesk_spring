package kr.co.softsoldesk.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.dao.AdminContentsDao;

@Service
public class AdminContentsService {
	
	@Autowired
	private AdminContentsDao adminContentsDao;
	
	@Value("${admin.listcnt}")
	private int admin_listcnt;
	
	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;
	
	
	//======================================================공지사항
	
		public List<NoticeBean> getAllNoticeList(int page){
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getAllNoticeList(rowBounds);
			
		}
		
		public PageBean AllNoticeCnt(int currentPage) {
			int all_cnt = adminContentsDao.AllNoticeCnt();
			PageBean pageBean = new PageBean(all_cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}
		public int AllNoticeCnt1() {
			
			return adminContentsDao.AllNoticeCnt();
		}
		
		
		public List<NoticeBean> getSearchNoticeTitleList(String title, int page){
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getSearchNoticeTitleList(title, rowBounds);
		}
		
		public PageBean SearchNoticeCnt(String title, int currentPage) {
			int title_cnt = adminContentsDao.SearchNoticeCnt(title);
			PageBean pageBean = new PageBean(title_cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}
		public int SearchNoticeCnt(String title) {
			return adminContentsDao.SearchNoticeCnt(title);
		}
		
		
		public List<NoticeBean>getSearchNoticeAllTitleList(String title, int page){
			int start = (page - 1) * admin_listcnt;
			RowBounds rowBounds = new RowBounds(start, admin_listcnt);
			
			return adminContentsDao.getSearchNoticeAllTitleList(title, rowBounds);
		}
		
		public PageBean AllSearchNoticeCnt(String title, int currentPage) {
			int allcon_cnt = adminContentsDao.AllSearchNoticeCnt(title);
			PageBean pageBean = new PageBean(allcon_cnt, currentPage, admin_listcnt, admin_paginationcnt);
			
			return pageBean;
		}
		public int AllSearchNoticeCnt(String title) {
			return adminContentsDao.AllSearchNoticeCnt(title);
		}
		
		public void addNotice(NoticeBean njoinBean) {
			adminContentsDao.addNotice(njoinBean);
		}
		
		public NoticeBean getNoticeInfo(int notice_id) {
			return adminContentsDao.getNoticeInfo(notice_id);
		}
		
		public void Noticeview(int notice_id) {
			adminContentsDao.Noticeview(notice_id);
		}
		
		public void ModifyNoticeInfo(NoticeBean nmodifyBean) {
			adminContentsDao.ModifyNoticeInfo(nmodifyBean);
		}
		
		public void DeleteNotice(List<Integer> noIds ) {
			for(Integer noId : noIds) {
				adminContentsDao.DeleteNotice(noId);
			}
		}
		
		public void DeleteNotice(int notice_id) {
			adminContentsDao.DeleteNotice(notice_id);
		}
	
	

}
