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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BoardService;
import kr.co.softsoldesk.dao.BoardDao;

@Controller
@RequestMapping("/board")
public class BoardController {

	/*
	@Autowired
	private BoardDao boardDao;*/
	
    @Autowired
    private BoardService boardService;
     
    /*
    @Resource(name = "loginUserBean")
    private UserBean loginUserBean;
     */
    @GetMapping("/main")
    public String main(Model model) {
    	//model.addAttribute("board_id", board_id);
    	
		List<BoardBean> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);

        return "board/main"; // board/main 뷰로 이동합니다.
    }

    // 게시판 상세 조회(읽기)
    @GetMapping("/read")
    public String read(@RequestParam("board_id") int board_id, Model model) {
    	BoardBean readContentBean = boardService.getReadInfo(board_id);
		model.addAttribute("readContentBean", readContentBean);   //read.jsp로 보냄
		System.out.print("/read 컨트롤러 - readContentBean.boad_id : " +readContentBean.getBoard_id());
		System.out.print("/read 컨트롤러 - readContentBean.boad_id : " +readContentBean.getContents());
		
		model.addAttribute("board_id", board_id);
		//model.addAttribute("loginUserBean", loginUserBean);
    	
        return "board/read";
    }

    // 게시글 작성
    @GetMapping("/write")
    public String write(@ModelAttribute("boardBean") BoardBean boardBean, Model model) {
    	
    	
    	
        return "board/write";
    }

    // 게시글 작성 처리
    @PostMapping("/write_pro")
    public String boardWrite(@ModelAttribute("boardBean") BoardBean boardBean, Model model) {
    	
    	boardService.addingBoardContent(boardBean);
    	
    	return "view/index";
    }

    // 게시글 수정
    @GetMapping("/modify")
    public String modify() {
    	
        return "board/modify";
    }

    // 게시글 수정 처리
    @PostMapping("/modify_pro")
    public String modify_pro(BoardBean boardBean) {
    	 
         return "board/modify_pro";
    }

    // 게시글 삭제
    @PostMapping("/delete_pro")
    public String delete_pro() {
    
        return "board/delete_pro";
    }
}
