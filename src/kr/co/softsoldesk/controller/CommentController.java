package kr.co.softsoldesk.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.CommentBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Service.BoardService;


@RestController
public class CommentController {
	@Autowired
    private BoardService boardService;
	
	// 추가
	@PostMapping("/comments")
	public CommentBean addComment(@RequestBody CommentBean commentBean) {
		
		boardService.addComment(commentBean);
		
		
		return commentBean;	
	}
		
	// 조회
	@GetMapping("/comment_s")
	public Map<String, Object> getComment_s(@RequestParam("board_id") int board_id,
										  @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
	    List<CommentBean> comment_s = boardService.getComment_s(board_id, page);
	    //model.addAttribute("comment_s",comment_s);
	    
	    PageBean pageBean = boardService.getCommentPage(board_id, page);
	    //model.addAttribute("pageBean", pageBean);
	    
	    Map<String, Object> result = new HashMap<>();
	    result.put("comment_s", comment_s);
	    result.put("pageBean", pageBean);
	    
	    return result;
	}
	
	// 수정
	@PostMapping("/modifyComment") // 댓글 수정 메소드를 POST 방식으로 변경
	public ResponseEntity<?> updateComment(@RequestBody CommentBean updateComment) {
	    boardService.updateComment(updateComment);
	    return ResponseEntity.ok().build(); // 성공적으로 처리됨을 응답
	}
	
	//삭제
	@PostMapping("/deleteComment")
	public ResponseEntity<?> deleteComment(@RequestParam("comment_id") int comment_id) {
	    boardService.deleteComment(comment_id);
	    return ResponseEntity.ok().build();
	}
}
