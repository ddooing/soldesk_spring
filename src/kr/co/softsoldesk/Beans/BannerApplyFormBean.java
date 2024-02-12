package kr.co.softsoldesk.Beans;

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
	private String regdate;
	private int payment;
	private int state;
	private int banner_type;
	private int banner_file_id;

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
