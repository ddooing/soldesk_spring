package kr.co.softsoldesk.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;
     
    /*
    @Resource(name = "loginUserBean")
    private UserBean loginUserBean;
     */
    // 게시판 목록 조회
    @GetMapping("/main")
    public String main(@RequestParam("board_id") int board_id, Model model) {
    	 
    	List<BoardBean> boards = boardService.getAllBoards();
         model.addAttribute("boards", boards);
         
        return "board/main";
    }

    // 게시판 상세 조회(읽기)
    @GetMapping("/post")
    public String post(@RequestParam("board_id") int board_id, Model model) {
    	 //BoardBean board = boardService.getBoardById(board_id);
         //model.addAttribute("board", board);
        return "board/post";
    }

    // 게시글 작성
    @GetMapping("/write")
    public String boardWrite(Model model) {
        //model.addAttribute("boardBean", new BoardBean());
        return "board/write";
    }

    // 게시글 작성 처리
    @PostMapping("/write_pro")
    public String boardWrite(BoardBean boardBean) {
        //boardService.addBoard(boardBean);
        return "redirect:/board/write_pro";
    }

    // 게시글 수정
    @GetMapping("/modify")
    public String modify(@RequestParam("board_id") int board_id, Model model) {
    	//BoardBean board = boardService.getBoardById(board_id);
        //model.addAttribute("boardBean", board);
        return "board/modify";
    }

    // 게시글 수정 처리
    @PostMapping("/modify_pro")
    public String modify_pro(BoardBean boardBean) {
    	 //boardService.modifyBoard(boardBean);
         return "redirect:/board/view?board_id=" + boardBean.getBoard_id();
    }

    // 게시글 삭제
    @PostMapping("/delete_pro")
    public String delete_pro(@RequestParam("board_id") int board_id) {
    	//boardService.deleteBoard(board_id);
        return "redirect:/board/main";
    }
}
