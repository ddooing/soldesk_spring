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
	
	// 예약시 유저의 레벨에 따라 적립이 다르게 보여지게 하려고 사용
	@Select("SELECT g.grade as grade FROM user_table u JOIN grade g ON u.exp BETWEEN g.start_exp AND NVL(g.end_exp, u.exp) WHERE u.user_id = #{user_id}")
	UserBean getUserGrade(int user_id);
	 
	// 포인트 적립
	@Update("UPDATE user_table set point = point + #{point} where user_id = #{user_id}")
	void UpdatepointPlus(@Param("point") int point, @Param("user_id") int user_id);
	
	// 포인트 사용
	@Update("UPDATE user_table set point = point - #{point} where user_id = #{user_id}")
	void UpdatepointMinus(@Param("point") int point, @Param("user_id") int user_id);
	
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
		
		
	
	
}
