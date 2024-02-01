package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.Beans.BookMarkBean;

public interface BookMarkMapper {

	// 북마크 추가 
	@Insert("insert into bookmark (bookmark_id, user_id, exhibition_id) values (bookmark_id_seq.nextval ,#{user_id}, #{exhibition_id})")
	void addBookMark(BookMarkBean bookmarkBean);
	
	// 북마크 삭제
	@Delete("delete from bookmark where user_id = #{user_id} and exhibition_id = #{exhibition_id}")
	void deleteBookMark(BookMarkBean bookmarkBean);
	
	// 회원의 북마크 여부 확인
	@Select("SELECT COUNT(*) AS bookmark_count FROM bookmark WHERE user_id = #{user_id} AND exhibition_id = #{exhibition_id}")
	int BookMarkSure(@Param("user_id") int user_id, @Param("exhibition_id") int exhibition_id);
}
