package kr.co.softsoldesk.Beans;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeBean {
	 private Integer noticeId; // 공지사항 ID
	 private String title; // 제목
	 private Date createDate; // 생성 날짜
	 private Integer views; // 조회수
	 private String contents; // 내용
	 private Date updateDate; // 수정 날짜
	 private Integer state;
	 
}
