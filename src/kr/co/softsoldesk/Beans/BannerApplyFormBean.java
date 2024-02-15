package kr.co.softsoldesk.Beans;

import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BannerApplyFormBean {

	private int banner_apply_form_id;
	private int apply_person_id;
	private int exhibition_id;
	private String start_date;
	private String end_date;
	private String command;
	private int payment;
	private int state;
	private int banner_type;
	private int banner_file_id;

	
	//추가
	private String requested_at; // 주문 날짜 +시간
	private String approved_at; // 결제 날짜 +시간 
	private int pay_state;
	private int pay_approval_state;
	private String order_id;
	private String paymentkey;
	private String payment_method;	
    	
	public BannerApplyFormBean(){
		this.order_id= UUID.randomUUID().toString();
	}
	// 파일 테이블
	// 가져올때
	private String banner_name;
	private String banner_path;
	// 저장할때
	private String name;
	private String path;
	
	// 파일 업로드
	private MultipartFile banner_file;
	
	
}
