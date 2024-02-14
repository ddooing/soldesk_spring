package kr.co.softsoldesk.validator;

import javax.annotation.Resource;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.softsoldesk.Beans.UserBean;

public class UserValidator implements Validator {
	

	private UserBean loginUserBean;

    public UserValidator(UserBean loginUserBean) {
        this.loginUserBean = loginUserBean;
    }

	@Override
	public boolean supports(Class<?> clazz) {

		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		UserBean userBean = (UserBean) target;

		String beanName = errors.getObjectName();
		/*
		타겟으로 받아온 객체가 joinUserBean이 아니면 에러 로그인 객체도 @Vaild가 있어 타깃으로 넘어옴
		 */
		
		if(beanName.equals("modifyUserBean")) {		//회원정보 수정
				
			
			if(loginUserBean.getPassword().equals(userBean.getCrpassword()) == false) {
				
				errors.rejectValue("crpassword", "CurrentPasswordNotMatch");
				
			}
			
			
			if (userBean.getPassword2().equals(userBean.getPassword3()) == false) {
				errors.rejectValue("password2", "NotEquals");
				errors.rejectValue("password3", "NotEquals");
			}
			
			if(beanName.equals("modifyUserBean")) {
				
				
					if(userBean.isNickExist() == false) {
					errors.rejectValue("nickname", "DontCheckNickExist");
				}
			}
		}
		//----------------------------
		if (beanName.equals("joinUserBean")) {	//회원가입
			// 조건문을 만들어 회원가입 객체가 넘어올 때만 유효성 검사

			
			
			if (userBean.getPassword().equals(userBean.getPassword2()) == false) {
				errors.rejectValue("password", "NotEquals");
				errors.rejectValue("password2", "NotEquals");
			}
			
			if(userBean.getEmail() == null) {
				errors.rejectValue("email", "Notemail");
				
			}

			if (beanName.equals("joinUserBean")) {

				if (userBean.isIdExist() == false) {

					errors.rejectValue("id", "DontCheckIdExist");
				}
				
				if(userBean.isNickExist() == false) {
					
					errors.rejectValue("nickname", "DontCheckNickExist");
					
				}
				
			}
		}
			//--------------------------------
			/*
			 * if(beanName.equals("deleteUserBean")) {
			 * 
			 * if(loginUserBean.getPassword().equals(userBean.getPassword()) == false) {
			 * 
			 * errors.rejectValue("password", "CurrentPasswordNotMatch");
			 * 
			 * if (userBean.getPassword().equals(userBean.getPassword2()) == false) {
			 * errors.rejectValue("password", "NotEquals"); errors.rejectValue("password2",
			 * "NotEquals"); }
			 * 
			 * } }
			 */
	}
}
