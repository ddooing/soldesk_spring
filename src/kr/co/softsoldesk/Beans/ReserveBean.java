package kr.co.softsoldesk.Beans;

import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveBean {

	private int reserve_id;
	private int user_id;
	private int exhibition_id;
	private String reserve_date;
	private int total_price;
	private int point_deduction;
	private int payment;
	private int ticket_count;
	private String requested_at; // 주문 날짜 +시간
	private String approved_at; // 결제 날짜 +시간 
	private int state;// 
	private int pay_state;
	private int pay_approval_state;
	private String order_id;
	private String paymentkey;
	private String payment_method; // 결제 방법: 
	
	
	
	private String name;
	
	private int plusPoint; // 예매 시, 등급에 따른 포인트 
	
	public ReserveBean(){
		this.order_id= UUID.randomUUID().toString();
	}

	private String title;
	private String main_poster_path;
	private String main_poster_name;
	
	
	public int getReserve_id() {
		return reserve_id;
	}

	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getExhibition_id() {
		return exhibition_id;
	}

	public void setExhibition_id(int exhibition_id) {
		this.exhibition_id = exhibition_id;
	}

	public String getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getPoint_deduction() {
		return point_deduction;
	}

	public void setPoint_deduction(int point_deduction) {
		this.point_deduction = point_deduction;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getTicket_count() {
		return ticket_count;
	}

	public void setTicket_count(int ticket_count) {
		this.ticket_count = ticket_count;
	}

	

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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



	public int getPlusPoint() {
		return plusPoint;
	}

	public void setPlusPoint(int plusPoint) {
		this.plusPoint = plusPoint;
	}
	
	
	
	
}
