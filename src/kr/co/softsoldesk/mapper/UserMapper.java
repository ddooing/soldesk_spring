package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.Beans.UserBean;

public interface UserMapper {
	
	// loginUserBean 객체 저장될 값들
	@Select("select user_id, id, password from user_table where id = #{id} and password = #{password}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);

	// login 시 loginUserBean 객체의 user_id 값을 가지고 로그인한 객체의 모든 정보를 가져옴
	@Select("select user_id, id, name, password, nickname, birth, gender, email, point, telephone, exp, create_date, modify_date, state from user_table where user_id = #{user_id}")
	UserBean getLoginUserAllInfo(int user_id);
	
	// 예약시 유저의 레벨에 따라 적립이 다르게 보여지게 하려고 사용
	@Select("SELECT g.grade as grade FROM user_table u JOIN grade g ON u.exp BETWEEN g.start_exp AND NVL(g.end_exp, u.exp) WHERE u.user_id = #{user_id}")
	UserBean getUserGrade(int user_id);
}
