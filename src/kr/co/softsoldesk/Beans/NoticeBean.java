package kr.co.softsoldesk.Beans;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeBean {
	 private Integer notice_id; // 공지사항 ID
	 private String title; // 제목
	 private Date create_date; // 생성 날짜
	 private Integer views; // 조회수
	 private String contents; // 내용
	 private Date update_date; // 수정 날짜
	 private Integer state;
	 
}
