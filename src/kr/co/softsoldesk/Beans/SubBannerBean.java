package kr.co.softsoldesk.Beans;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubBannerBean {

	private int sub_banner_id;
	private int exhibition_id;
	private String start_date;
	private String end_date;
	private int expose_order;
	private int state;
	private String regdate;
	private int banner_file_id;
	private int pay_money;
	private int apply_person_id;
	
	// 파일 테이블
	// 가져올때
	private String sub_banner_name;
	private String sub_banner_path;
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
	private MultipartFile sub_banner_file;

	public int getSub_banner_id() {
		return sub_banner_id;
	}

	public void setSub_banner_id(int sub_banner_id) {
		this.sub_banner_id = sub_banner_id;
	}

	public int getExhibition_id() {
		return exhibition_id;
	}

	public void setExhibition_id(int exhibition_id) {
		this.exhibition_id = exhibition_id;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getExpose_order() {
		return expose_order;
	}

	public void setExpose_order(int expose_order) {
		this.expose_order = expose_order;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getBanner_file_id() {
		return banner_file_id;
	}

	public void setBanner_file_id(int banner_file_id) {
		this.banner_file_id = banner_file_id;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}

	public int getApply_person_id() {
		return apply_person_id;
	}

	public void setApply_person_id(int apply_person_id) {
		this.apply_person_id = apply_person_id;
	}

	public String getSub_banner_name() {
		return sub_banner_name;
	}

	public void setSub_banner_name(String sub_banner_name) {
		this.sub_banner_name = sub_banner_name;
	}

	public String getSub_banner_path() {
		return sub_banner_path;
	}

	public void setSub_banner_path(String sub_banner_path) {
		this.sub_banner_path = sub_banner_path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public int getBanner_all_Cnt() {
		return banner_all_Cnt;
	}

	public void setBanner_all_Cnt(int banner_all_Cnt) {
		this.banner_all_Cnt = banner_all_Cnt;
	}

	public int getBanner_show_Cnt() {
		return banner_show_Cnt;
	}

	public void setBanner_show_Cnt(int banner_show_Cnt) {
		this.banner_show_Cnt = banner_show_Cnt;
	}

	public int getBanner_hide_Cnt() {
		return banner_hide_Cnt;
	}

	public void setBanner_hide_Cnt(int banner_hide_Cnt) {
		this.banner_hide_Cnt = banner_hide_Cnt;
	}

	public MultipartFile getSub_banner_file() {
		return sub_banner_file;
	}

	public void setSub_banner_file(MultipartFile sub_banner_file) {
		this.sub_banner_file = sub_banner_file;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
