package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.UserBean;

public interface UserMapper {
	
	// loginUserBean 객체 저장될 값들
	@Select("select user_id, id, password from user_table2 where id = #{id} and password = #{password}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);

	// login 시 loginUserBean 객체의 user_id 값을 가지고 로그인한 객체의 모든 정보를 가져옴
	@Select("select user_id, id, name, password, nickname, birth, gender, email, point, telephone, exp, create_date, modify_date, state from user_table2 where user_id = #{user_id}")
	UserBean getLoginUserAllInfo(int user_id);
	
	
	//포인트와 경험치 증가
	@Update("")
	void point_expIncrease(int user_id);
}
