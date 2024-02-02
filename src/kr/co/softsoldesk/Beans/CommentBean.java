package kr.co.softsoldesk.Beans;

import java.util.Date;

public class CommentBean {
	private Integer  comment_id; // 댓글 ID
    private Integer board_id; // 게시글 ID
    private Integer user_id; // 사용자 ID
    private String contents; // 댓글 내용
    private Date regdate_date; // 등록 날짜
    private Date modify_date; // 수정 날짜
    private Integer state; // 상태값 (0:삭제, 1:정상)
}
