package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.UserBean;

public interface UserMapper {
	
	// ======================================= 승찬부분
	// loginUserBean 객체 저장될 값들
	@Select("select user_id, id, password, state from user_table where id = #{id} and password = #{password} and (state=1 or state=3)")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);

	// loginUserBean 객체의 user_id 값을 가지고 로그인한 객체의 모든 정보를 가져옴
	@Select("select user_id, id, name, password, nickname, TO_CHAR(birth, 'YYYY-MM-DD') AS birth, gender, email, point, telephone, exp, create_date, modify_date, state from user_table where user_id = #{user_id}")
	UserBean getLoginUserAllInfo(int user_id);
	
	//포인트와 경험치 증가
	@Update("update user_table set point=point + #{point}, exp=exp+50 where user_id= #{user_id}")
	void point_expIncrease(@Param("user_id")int user_id,@Param("point")int point);
	
	// 예약시 유저의 레벨에 따라 적립이 다르게 보여지게 하려고 사용
	@Select("SELECT g.grade as grade FROM user_table u JOIN grade g ON u.exp BETWEEN g.start_exp AND NVL(g.end_exp, u.exp) WHERE u.user_id = #{user_id}")
	String getLevel(int user_id);

	// 경험치 부여
		@Update("UPDATE user_table set exp = exp + #{exp} where user_id = #{user_id}")
		void IncreaseExp(@Param("exp") int exp, @Param("user_id") int user_id);
		
	// 재호부분 ================================================================
	//중복검사
		@Select("select name from user_table where id = #{id}")
		String checkIdExist(String id);
		@Select("select name from user_table where nickname = #{nickname}")
		String checkNickExist(String nickname);
		
		//회원가입
		@Insert("insert into user_table(user_id, id, name, password, nickname, birth, gender, email, telephone, create_date, modify_date, state)"
				+ "values (user_id_seq.nextval, #{id}, #{name}, #{password}, #{nickname}, #{birth}, #{gender}, #{email}, #{telephone}, sysdate, null, 1)")
		void addUserInfo(UserBean joinUserBean);
		
		
		//--------------------수정
		@Select("select id, name, password from user_table where user_id = #{user_id}")
		UserBean getModifyUserInfo(int user_id);

		@Update("UPDATE user_table\r\n"
	               + "set nickname = #{nickname}, \r\n"
	               + "email = #{email},\r\n"
	               + "password = #{icpassword}, \r\n"
	               + "modify_date = sysdate \r\n"
	               + "WHERE user_id = #{user_id} AND password = #{password}")
	         void modifyUserInfo(UserBean modifyUserBean);
		
		
		//------------------삭제(상태만 변경)
		@Update("update user_table set state = 2 where id = #{id} and password = #{password}")
		void deleteUserInfo(UserBean deleteUserBean);
		
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
				+ "TO_CHAR(ut.create_date, 'YYYY-MM-DD') as create_date, ut.state, ut.exp, g.grade\r\n"
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
		
		
	
	
}
