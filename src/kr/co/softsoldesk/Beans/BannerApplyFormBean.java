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
	private String approved_At;
	private int payment;
	private int state;		// banner_apply_form 테이블의 state
	private int state1;		// main,sub_banner 테이블의 노출,숨김 상태값
	private int banner_type;
	private int banner_file_id;

	// 파일 테이블
	// 가져올때
	private String banner_name;
	private String banner_path;
	// 저장할때
	private String name;
	private String path;
	
	// 신청내역때 사용
	private String exhibition_title;
	private String user_name;
	private String user_telephone;
	private String user_email;
	
	// 파일 업로드
	private MultipartFile banner_file;
	
	// 뱃지 관련
	private int total_count;
	private int state_1_count;
	private int state_2_count;
	
	
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

	public int getBanner_apply_form_id() {
		return banner_apply_form_id;
	}

	public void setBanner_apply_form_id(int banner_apply_form_id) {
		this.banner_apply_form_id = banner_apply_form_id;
	}

	public int getApply_person_id() {
		return apply_person_id;
	}

	public void setApply_person_id(int apply_person_id) {
		this.apply_person_id = apply_person_id;
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

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

	public String getApproved_At() {
		return approved_At;
	}

	public void setApproved_At(String approved_At) {
		this.approved_At = approved_At;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getState1() {
		return state1;
	}

	public void setState1(int state1) {
		this.state1 = state1;
	}

	public int getBanner_type() {
		return banner_type;
	}

	public void setBanner_type(int banner_type) {
		this.banner_type = banner_type;
	}

	public int getBanner_file_id() {
		return banner_file_id;
	}

	public void setBanner_file_id(int banner_file_id) {
		this.banner_file_id = banner_file_id;
	}

	public String getBanner_name() {
		return banner_name;
	}

	public void setBanner_name(String banner_name) {
		this.banner_name = banner_name;
	}

	public String getBanner_path() {
		return banner_path;
	}

	public void setBanner_path(String banner_path) {
		this.banner_path = banner_path;
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

	public String getExhibition_title() {
		return exhibition_title;
	}

	public void setExhibition_title(String exhibition_title) {
		this.exhibition_title = exhibition_title;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_telephone() {
		return user_telephone;
	}

	public void setUser_telephone(String user_telephone) {
		this.user_telephone = user_telephone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public MultipartFile getBanner_file() {
		return banner_file;
	}

	public void setBanner_file(MultipartFile banner_file) {
		this.banner_file = banner_file;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getState_1_count() {
		return state_1_count;
	}

	public void setState_1_count(int state_1_count) {
		this.state_1_count = state_1_count;
	}

	public int getState_2_count() {
		return state_2_count;
	}

	public void setState_2_count(int state_2_count) {
		this.state_2_count = state_2_count;
	}

	public String getRequested_at() {
		return requested_at;
	}

	public void setRequested_at(String requested_at) {
		this.requested_at = requested_at;
	}

	public String getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(String approved_at) {
		this.approved_at = approved_at;
	}

	public int getPay_state() {
		return pay_state;
	}

	public void setPay_state(int pay_state) {
		this.pay_state = pay_state;
	}

	public int getPay_approval_state() {
		return pay_approval_state;
	}

	public void setPay_approval_state(int pay_approval_state) {
		this.pay_approval_state = pay_approval_state;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getPaymentkey() {
		return paymentkey;
	}

	public void setPaymentkey(String paymentkey) {
		this.paymentkey = paymentkey;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	
	
	
}