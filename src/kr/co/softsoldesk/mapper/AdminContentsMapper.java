package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.NoticeBean;

public interface AdminContentsMapper {
	
	
	//===================================================================공지사항
		//전체 공지조회, 및 수량체크
		@Select("select notice_id, title, TO_CHAR(create_date, 'YYYY-MM-DD') as create_date, views, contents, state\r\n"
				+ "from notice order by notice_id desc")
		List<NoticeBean> getAllNoticeList(RowBounds rowBounds);
		
		@Select("select count(*), count(*) as count\r\n"
				+ "from notice")
		int AllNoticeCnt();
		
		//제목만 검색, 수량체크
		@Select("select notice_id, title, TO_CHAR(create_date, 'YYYY-MM-DD') as create_date, views, state\r\n"
				+ "from notice\r\n"
				+ "where upper(title) LIKE '%' || UPPER(#{title}) || '%' order by notice_id desc")
		List<NoticeBean> getSearchNoticeTitleList(@Param("title")String title, RowBounds rowBounds);
		
		@Select("select count(*), count(*) as count\r\n"
				+ "from notice\r\n"
				+ "where upper(title) LIKE '%' || UPPER(#{title}) || '%'")
		int SearchNoticeCnt(@Param("title")String title);
		
		//제목+내용검색, 수량체크
		@Select("SELECT notice_id, title, TO_CHAR(create_date, 'YYYY-MM-DD') as create_date, views, state\r\n"
				+ "FROM notice\r\n"
				+ "WHERE UPPER(title) LIKE '%' || UPPER(#{title}) || '%'\r\n"
				+ "OR UPPER(contents) LIKE '%' || UPPER(#{title}) || '%' order by notice_id desc")
		List<NoticeBean> getSearchNoticeAllTitleList(@Param("title")String title, RowBounds rowBounds);
		
		@Select("select count(*), count(*) as count\r\n"
				+ "from notice\r\n"
				+ "where upper(title) LIKE '%' || UPPER(#{title}) || '%'\r\n"
				+ "or upper(contents) LIKE '%' || UPPER(#{title}) || '%'")
		int AllSearchNoticeCnt(@Param("title")String title);
		
		
		//공지작성
		@Insert("INSERT INTO notice (notice_id, title, create_date, views, contents, update_date, state)\r\n"
				+ "VALUES (notice_id_seq.NEXTVAL, #{title}, SYSDATE, 0, #{contents}, SYSDATE, #{state})")
		void addNotice(NoticeBean njoinBean);
		
		//공지사항 세부정보 확인
		@Select("select notice_id, title, create_date, contents, state, views\r\n"
				+ "from notice\r\n"
				+ "where notice_id = #{notice_id}")
		NoticeBean getNoticeInfo(int notice_id);
		
		@Update("UPDATE notice\r\n"
				+ "SET views = views + 1\r\n"
				+ "WHERE notice_id = #{notice_id}")
		void Noticeview(int notice_id);
		
		@Update("update notice\r\n"
				+ "set title = #{title}, state = #{state}, contents = #{contents}, update_date = sysdate\r\n"
				+ "where notice_id = #{notice_id}")
		void ModifyNoticeInfo(NoticeBean nmodifyBean);
		
		@Update("update notice\r\n"
				+ "set state = 0\r\n"
				+ "where notice_id = #{notice_id}")
		void DeleteNotice(@Param("notice_id") int notice_id);
		
		

}
