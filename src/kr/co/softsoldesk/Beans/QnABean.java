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
	
}
