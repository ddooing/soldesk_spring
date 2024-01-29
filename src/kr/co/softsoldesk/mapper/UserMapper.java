package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.Beans.UserBean;

public interface UserMapper {
	
	// loginUserBean 객체 저장될 값들
	@Select("select user_idx, id, pw from user_table where id = #{id} and pw = #{pw}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);

	// login 시 loginUserBean 객체의 user_idx 값을 가지고 로그인한 객체의 모든 정보를 가져옴
	@Select("select user_idx, id, name, pw, nick, birth, gender, email, point, tel, exp, create_date, modify_date, state from user_table where user_idx = #{user_idx}")
	UserBean getLoginUserAllInfo(int user_idx);
}
