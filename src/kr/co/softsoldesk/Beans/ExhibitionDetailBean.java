package kr.co.softsoldesk.Beans;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitionDetailBean {

	private int exhibition_id;
	private String title;
	private String regdate;
	private int state;
	private String author;
	private int price;
	private String exhibition_start; 
	private String exhibition_end;
	private String open;
	private String holiday;
	private String address;
	private String place;
	private double latitude;				// 전시회 위도
	private double longitude;				// 전시회 경도
	private String site;					// 전시회 사이트
	private int apply_person;
	private String apply_name;				// 신청인 이름
	private String apply_email;				// 신청인 이메일
	private String apply_telephone;			// 신청인 전화번호
	private String main_poster_path;		// 실제 가져오는 메인포스터 파일 경로
	private String main_poster_name;		// 실제 가져오는 메인포스터 파일 이름
	private String detail_poster_path;		// 실제 가져오는 상세포스터 파일 경로
	private String detail_poster_name;		// 실제 가져오는 상세포스터 파일 이름
	private int main_poster_file_id;		// 전시회 테이블에 있는 main_poster_file_id
	private int detail_poster_file_id;		// 전시회 테이블에 있는 detail_poster_file_id
	
	// 파일 처리용
	private MultipartFile main_poster_file;			// 파일 업로드 처리 받을 메인포스터
	private MultipartFile detail_poster_file;		// 파일 업로드 처리 받을 상세포스터
	
	private String open_time;						// open_time + close_time = open에 set해서 db 저장
	private String close_time;
	
	// file_table name, path
	private String name;
	private String path;
	
	private int exhibition_enroll_id;
	private int enroll_state;
	
	
	private int total_exhibition_eroll_count;	// 전시회 신청관리 뱃지 부분 총개수
	private int stay_exhibition_eroll_count;	// 전시회 신청관리 뱃지 부분 등록대기개수
	private int complete_exhibition_eroll_count;// 전시회 신청관리 뱃지 부분 완료개수
	public int getExhibition_id() {
		return exhibition_id;
	}
	public void setExhibition_id(int exhibition_id) {
		this.exhibition_id = exhibition_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getExhibition_start() {
		return exhibition_start;
	}
	public void setExhibition_start(String exhibition_start) {
		this.exhibition_start = exhibition_start;
	}
	public String getExhibition_end() {
		return exhibition_end;
	}
	public void setExhibition_end(String exhibition_end) {
		this.exhibition_end = exhibition_end;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public int getApply_person() {
		return apply_person;
	}
	public void setApply_person(int apply_person) {
		this.apply_person = apply_person;
	}
	public String getApply_name() {
		return apply_name;
	}
	public void setApply_name(String apply_name) {
		this.apply_name = apply_name;
	}
	public String getApply_email() {
		return apply_email;
	}
	public void setApply_email(String apply_email) {
		this.apply_email = apply_email;
	}
	public String getApply_telephone() {
		return apply_telephone;
	}
	public void setApply_telephone(String apply_telephone) {
		this.apply_telephone = apply_telephone;
	}
	public String getMain_poster_path() {
		return main_poster_path;
	}
	public void setMain_poster_path(String main_poster_path) {
		this.main_poster_path = main_poster_path;
	}
	public String getMain_poster_name() {
		return main_poster_name;
	}
	public void setMain_poster_name(String main_poster_name) {
		this.main_poster_name = main_poster_name;
	}
	public String getDetail_poster_path() {
		return detail_poster_path;
	}
	public void setDetail_poster_path(String detail_poster_path) {
		this.detail_poster_path = detail_poster_path;
	}
	public String getDetail_poster_name() {
		return detail_poster_name;
	}
	public void setDetail_poster_name(String detail_poster_name) {
		this.detail_poster_name = detail_poster_name;
	}
	public int getMain_poster_file_id() {
		return main_poster_file_id;
	}
	public void setMain_poster_file_id(int main_poster_file_id) {
		this.main_poster_file_id = main_poster_file_id;
	}
	public int getDetail_poster_file_id() {
		return detail_poster_file_id;
	}
	public void setDetail_poster_file_id(int detail_poster_file_id) {
		this.detail_poster_file_id = detail_poster_file_id;
	}
	public MultipartFile getMain_poster_file() {
		return main_poster_file;
	}
	public void setMain_poster_file(MultipartFile main_poster_file) {
		this.main_poster_file = main_poster_file;
	}
	public MultipartFile getDetail_poster_file() {
		return detail_poster_file;
	}
	public void setDetail_poster_file(MultipartFile detail_poster_file) {
		this.detail_poster_file = detail_poster_file;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getClose_time() {
		return close_time;
	}
	public void setClose_time(String close_time) {
		this.close_time = close_time;
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
	public int getExhibition_enroll_id() {
		return exhibition_enroll_id;
	}
	public void setExhibition_enroll_id(int exhibition_enroll_id) {
		this.exhibition_enroll_id = exhibition_enroll_id;
	}
	public int getEnroll_state() {
		return enroll_state;
	}
	public void setEnroll_state(int enroll_state) {
		this.enroll_state = enroll_state;
	}
	public int getTotal_exhibition_eroll_count() {
		return total_exhibition_eroll_count;
	}
	public void setTotal_exhibition_eroll_count(int total_exhibition_eroll_count) {
		this.total_exhibition_eroll_count = total_exhibition_eroll_count;
	}
	public int getStay_exhibition_eroll_count() {
		return stay_exhibition_eroll_count;
	}
	public void setStay_exhibition_eroll_count(int stay_exhibition_eroll_count) {
		this.stay_exhibition_eroll_count = stay_exhibition_eroll_count;
	}
	public int getComplete_exhibition_eroll_count() {
		return complete_exhibition_eroll_count;
	}
	public void setComplete_exhibition_eroll_count(int complete_exhibition_eroll_count) {
		this.complete_exhibition_eroll_count = complete_exhibition_eroll_count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
