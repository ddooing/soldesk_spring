package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.NoticeBean;

@Mapper
public interface NoticeMapper {
	/*
	@Select("select * from notice;")
	List<NoticeBean> selectNoticeList();

	@Select("SELECT * FROM notice WHERE notice_id = 1;")
	NoticeBean selectNoticeById(int notice_id);
*/
	// 목록 조회 (로그인 전 사용)
	@Select("SELECT board_id, title, user_id, create_date FROM board")
	List<NoticeBean> getNoticeList();
	
	// 내용 상세조회
	@Select("select * from board where notice_id=#{notice_id}")   
	NoticeBean getNoticeInfo(int notice_id);
}
