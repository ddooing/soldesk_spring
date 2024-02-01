package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.BookMarkBean;
import kr.co.softsoldesk.mapper.BookMarkMapper;

@Repository
public class BookMarkDao {

	@Autowired
	private BookMarkMapper bookmarkMapper;
	
	// 북마크 추가
	public void addBookMark(BookMarkBean bookmarkBean) {
	   	bookmarkMapper.addBookMark(bookmarkBean);
	}
	
	// 북마크 삭제
	public void deleteBookMark(BookMarkBean bookmarkBean) {
	   	bookmarkMapper.deleteBookMark(bookmarkBean);
	}
	
	// 북마크 여부 확인용
	public int BookMarkSure(int user_id, int exhibition_id) {
		return bookmarkMapper.BookMarkSure(user_id, exhibition_id);
	}
}
