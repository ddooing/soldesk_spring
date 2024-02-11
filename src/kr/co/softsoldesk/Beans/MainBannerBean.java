package kr.co.softsoldesk.Beans;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainBannerBean {

	private int main_banner_id;
	private int exhibition_id;
	private String start_date;
	private String end_date;
	private int expose_order;
	private int state;
	private String regdate;
	private int banner_file_id;
	private int pay_money;
	
	// 파일 테이블
	// 가져올때
	private String main_banner_name;
	private String main_banner_path;
	// 저장할때
	private String name;
	private String path;
	
	// 전시회 테이블
	private String title;
	
	// 유저 테이블
	private String user_name;
	private String telephone;
	
	// 관리자 배너 관리 페이지 배지 
	private int banner_all_Cnt;
	private int banner_show_Cnt;
	private int banner_hide_Cnt;
	
	// 파일 업로드
	private MultipartFile main_banner_file;
	
	
}
