package kr.co.softsoldesk.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.BookMarkBean;
import kr.co.softsoldesk.dao.BookMarkDao;

@Service
public class BookMarkService {

	@Autowired
	private BookMarkDao bookMarkDao;
	
	// 북마크 추가
	public void addBookMark (BookMarkBean bookmarkBean) {
		bookMarkDao.addBookMark(bookmarkBean);
	}
	
	// 북마크 삭제
	public void deleteBookMark (BookMarkBean bookmarkBean) {
		bookMarkDao.deleteBookMark(bookmarkBean);
	}
	
	// 북마크 여부 확인용
	public int BookMarkSure (int user_id, int exhibition_id) {
		return bookMarkDao.BookMarkSure(user_id, exhibition_id);
	}
	
}
