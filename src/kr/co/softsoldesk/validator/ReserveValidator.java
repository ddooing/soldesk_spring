package kr.co.softsoldesk.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.softsoldesk.Beans.ReserveBean;

public class ReserveValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ReserveBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ReserveBean reserveBean = (ReserveBean) target;
		
		String beanName = errors.getObjectName();

	}

	
}
