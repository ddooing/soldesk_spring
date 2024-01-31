package kr.co.softsoldesk.Beans;

import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveInfoBean {
	private String orderid;
	
	public ReserveInfoBean(){
		this.orderid= UUID.randomUUID().toString();
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	
	
}
