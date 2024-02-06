package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QnABean {
	
	private int qna_id;
	private int user_id;
	private String title;
	private String regdate;
	private String contents;
	private String reply;
	private int state;
	
	
	// 쿼리문 추가 변수
	private String nickname;
	
	private int total_count;
	private int state_1_count;
	private int state_0_count;
	
	private int row_number;
	
}
