package kr.co.softsoldesk.Beans;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CommentBean {
	private int comment_id; // 댓글 ID
    private int board_id; // 게시글 ID
    private int user_id; // 사용자 ID
    private String contents; // 댓글 내용
    private String regdate_date; // 등록 날짜
    private String modify_date; // 수정 날짜
    private int state; // 상태값 (0:삭제, 1:정상)
    private String nickname;
     
}