package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.UserBean;
//import kr.co.softsoldesk.Service.BoardService;


@Controller
@RequestMapping("/board") // /board 
public class BoardController {
	/*
	@Autowired
    private BoardService boardService; // 게시판 서비스
	*/
	/*
    @Autowired
    private CommentService commentService; // 댓글 서비스
	*/
    // 게시판 목록 조회
	@GetMapping("/main")
	public String main(/*@RequestParam("board_id") int board_id, Model model) int page*/) {
		//List<Board> board = boardService.findAllBoards();
        //model.addAttribute("board", board);
		
		return "board/main";
	}
	
	// 게시판 상세 조회(읽기)
	@GetMapping("/post") 
	public String post() {
		return "board/post";
	}
	
	// 게시글 작성
	@GetMapping("/write") // /board/main
	public String write() {
		return "board/write";
	}
	
	//게시글 수정
	@GetMapping("/modify") // /board/main
	public String modify() {
		return "board/modify";
	}
	
	//게시글 삭제
	@PostMapping("/delete_pro") // /board/main
	public String delete_pro() {
		return "board/delete_pro";
	}
	
	
}