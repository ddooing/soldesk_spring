package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.UserBean;

public interface UserMapper {
	@Select("select name from user_table where id = #{id}")
	String checkIdExist(String id);
	
	
	@Select("select name from user_table where nickname = #{nickname}")
	String checkNickExist(String nickname);
	
	
	@Insert("insert into user_table(user_id, id, name, password, nickname, birth, gender, email, telephone, create_date, modify_date, state)"
			+ "values (user_id_seq.nextval, #{id}, #{name}, #{password}, #{nickname}, #{birth}, #{gender}, #{email}, #{telephone}, sysdate, null, 1)")
	void addUserInfo(UserBean joinUserBean);
	
	@Select("SELECT user_id, name, password, TO_CHAR(birth, 'YYYY-MM-DD') AS birth FROM user_table WHERE id = #{id} AND password = #{password}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
	
	
	//--------------------수정
	@Select("select id, name, password from user_table where user_id = #{user_id}")
	UserBean getModifyUserInfo(int user_id);

	@Update("update user_table set birth = #{birth}, nickname = #{nickname}, telephone = #{telephone}, email = #{email}, password = #{password2}, modify_date = sysdate where user_id = #{user_id} and password = #{crpassword}")
	void modifyUserInfo(UserBean modifyUserBean);
}
