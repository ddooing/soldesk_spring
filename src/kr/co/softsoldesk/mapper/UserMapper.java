package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.UserBean;

public interface UserMapper {
	
	@Select("select user_idx, name from user_table where id = #{id} and pw = #{pw}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
}
