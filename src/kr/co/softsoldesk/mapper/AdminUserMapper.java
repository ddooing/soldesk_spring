package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.UserBean;

public interface AdminUserMapper {
	
	//관리자페이지에서 삭제
			@Update("update user_table set state = 2 where user_id = #{user_id}")
			int deleteAdminUserInfo(int user_id);
			
			
			//-------------------------(관리자) 모든회원정보 조회
			@Select("SELECT \r\n"
					+ "    ut.user_id, \r\n"
					+ "    ut.nickname, \r\n"
					+ "    ut.id, \r\n"
					+ "    ut.email,\r\n"
					+ "    ut.point, \r\n"
					+ "    ut.state, \r\n"
					+ "    ut.exp, \r\n"
					+ "    CASE \r\n"
					+ "        WHEN ut.exp >= 800 THEN 'level3'\r\n"
					+ "        ELSE g.grade \r\n"
					+ "    END AS grade\r\n"
					+ "FROM \r\n"
					+ "    user_table ut\r\n"
					+ "LEFT JOIN \r\n"
					+ "    grade g\r\n"
					+ "ON \r\n"
					+ "    ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
					+ "ORDER BY \r\n"
					+ "    ut.user_id DESC")
			List<UserBean> getUserList(RowBounds rowBounds);
			
			//--------------------------(관리자) 사용자 관리 페이징 처리 전체 유저 수 반환 메소드
			@Select("select count(*) from user_table")
			int getAccountCnt();
			
			//--------------------------(관리자) 검색회원정보 조회----------------
			@Select("SELECT \r\n"
		            + "    ut.user_id, \r\n"
		            + "    ut.nickname, \r\n"
		            + "    ut.id, \r\n"
		            + "    ut.email,\r\n"
		            + "    ut.point, \r\n"
		            + "    ut.state, \r\n"
		            + "    ut.exp, \r\n"
		            + "    CASE \r\n"
		            + "        WHEN ut.exp >= 800 THEN 'level3'\r\n"
		            + "        ELSE g.grade \r\n"
		            + "    END AS grade\r\n"
		            + "FROM \r\n"
		            + "    user_table ut\r\n"
		            + "LEFT JOIN \r\n"
		            + "    grade g\r\n"
		            + "ON \r\n"
		            + "    ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
		            + "WHERE \r\n"
		            + "    UPPER(nickname) LIKE '%' || UPPER(#{keyword}) || '%'\r\n"
		            + "ORDER BY \r\n"
		            + "    ut.user_id DESC")
		         List<UserBean> getNickSearchList(UserBean searchUserBean, RowBounds rowBounds);
		      
		      @Select("SELECT \r\n"
		            + "    count(*)\r\n"
		            + "FROM \r\n"
		            + "    user_table ut\r\n"
		            + "LEFT JOIN \r\n"
		            + "    grade g ON ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
		            + "WHERE \r\n"
		            + "    UPPER(ut.nickname) LIKE '%' || UPPER(#{keyword}) || '%'")
		      int getNickSearchCnt(String keyword);
		         
		      @Select("SELECT \r\n"
		             + "    ut.user_id, \r\n"
		             + "    ut.nickname, \r\n"
		             + "    ut.id, \r\n"
		             + "    ut.email,\r\n"
		             + "    ut.point, \r\n"
		             + "    ut.state, \r\n"
		             + "    ut.exp, \r\n"
		             + "    CASE \r\n"
		             + "        WHEN ut.exp >= 800 THEN 'level3'\r\n"
		             + "        ELSE g.grade \r\n"
		             + "    END AS grade\r\n"
		             + "FROM \r\n"
		             + "    user_table ut\r\n"
		             + "LEFT JOIN \r\n"
		             + "    grade g\r\n"
		             + "ON \r\n"
		             + "    ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
		             + "WHERE \r\n"
		             + "    UPPER(id) LIKE '%' || UPPER(#{keyword}) || '%'\r\n"
		             + "ORDER BY \r\n"
		             + "    ut.user_id DESC")
		         List<UserBean> getIdSearchList(UserBean searchUserBean, RowBounds rowBounds);
		         
		         @Select("SELECT \r\n"
		               + "    count(*)\r\n"
		               + "FROM \r\n"
		               + "    user_table ut\r\n"
		               + "LEFT JOIN \r\n"
		               + "    grade g ON ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
		               + "WHERE \r\n"
		               + "    UPPER(ut.id) LIKE '%' || UPPER(#{keyword}) || '%'")
		         int getIdSearchCnt(String keyword);
		         
		         @Select("SELECT \r\n"
		                + "    ut.user_id, \r\n"
		                + "    ut.nickname, \r\n"
		                + "    ut.id, \r\n"
		                + "    ut.email,\r\n"
		                + "    ut.point, \r\n"
		                + "    ut.state, \r\n"
		                + "    ut.exp, \r\n"
		                + "    CASE \r\n"
		                + "        WHEN ut.exp >= 800 THEN 'level3'\r\n"
		                + "        ELSE g.grade \r\n"
		                + "    END AS grade\r\n"
		                + "FROM \r\n"
		                + "    user_table ut\r\n"
		                + "LEFT JOIN \r\n"
		                + "    grade g\r\n"
		                + "ON \r\n"
		                + "    ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
		                + "WHERE \r\n"
		                + "    UPPER(email) LIKE '%' || UPPER(#{keyword}) || '%'\r\n"
		                + "ORDER BY \r\n"
		                + "    ut.user_id DESC")
		         List<UserBean> getEmailSearchList(UserBean searchUserBean, RowBounds rowBounds);
		      
		         @Select("SELECT \r\n"
		               + "    count(*)\r\n"
		               + "FROM \r\n"
		               + "    user_table ut\r\n"
		               + "LEFT JOIN \r\n"
		               + "    grade g ON ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
		               + "WHERE \r\n"
		               + "    UPPER(ut.email) LIKE '%' || UPPER(#{keyword}) || '%'")
		         int getEmailSearchCnt(String keyword);
			
			
			//-----------------------(관리자) 계정정보수정 기본값 가져오기
			@Select("SELECT ut.user_id, ut.nickname, ut.id, ut.email,\r\n"
					+ "TO_CHAR(ut.create_date, 'YYYY-MM-DD') as create_date, ut.state, ut.point ,ut.exp, g.grade\r\n"
					+ "FROM user_table ut\r\n"
					+ "LEFT JOIN grade g\r\n"
					+ "ON ut.exp BETWEEN g.start_exp AND g.end_exp\r\n"
					+ "where user_id = #{user_id}")
			UserBean getAdminModifyInfo(int user_id);
			
			
			//-------------------------(관리자) 계정정보 수정
			@Update("update user_table\r\n"
					+ "set nickname = #{nickname}, id = #{id}, email = #{email}, state = #{state}\r\n"
					+ "where user_id = #{user_id}")
			void AdminModifyInfo(UserBean acModifyBean);
			
			// 유저 수정 페이지에 게시글, 댓글, qna, 전시회 요청, 전시회 등록 개수 반환
			@Select("SELECT \r\n"
					+ "        (SELECT COUNT(*) FROM board WHERE user_id = #{user_id}) AS board_count,\r\n"
					+ "        (SELECT COUNT(*) FROM comment_table WHERE user_id = #{user_id}) AS comment_count,\r\n"
					+ "        (SELECT COUNT(*) FROM QnA WHERE user_id = #{user_id}) AS qna_count,\r\n"
					+ "        (SELECT COUNT(*) FROM banner_apply_form WHERE apply_person_id = #{user_id}) AS banner_apply_count,\r\n"
					+ "        (SELECT COUNT(*) FROM exhibition_enroll WHERE apply_person = #{user_id}) AS exhibition_enroll_count\r\n"
					+ "    FROM dual")
			UserBean getUserCountInfo(int user_id);

}
