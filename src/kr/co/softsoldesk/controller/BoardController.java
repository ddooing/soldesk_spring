package kr.co.softsoldesk.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BoardService;
import kr.co.softsoldesk.Service.UserService;
import kr.co.softsoldesk.dao.BoardDao;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardDao boardDao;

    @Autowired
    private BoardService boardService;
     
    @Resource(name = "loginUserBean")
    private UserBean loginUserBean;
    
    @GetMapping("/main")
    public String main(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			    		@RequestParam(value="searchType", required=false) String searchType,
				        @RequestParam(value="searchText", required=false) String searchText,
				        @ModelAttribute("searchUserBean") UserBean searchUserBean) {
    	
    	  // 검색 조건이 있는 경우
        if (searchType != null && searchText != null && !searchType.isEmpty() && !searchText.isEmpty()) {
            List<BoardBean> boardList = boardService.getSearchBoards(searchType, searchText, page);
            PageBean pageBean = boardService.getSearchBoardPage(searchType, searchText, page);
            model.addAttribute("boardList", boardList);
            model.addAttribute("pageBean", pageBean);
        } else {
            // 검색 조건이 없는 경우 전체 게시물 리스트와 페이지 정보를 가져옴
            List<BoardBean> boardList = boardService.getBoardList(page);
            PageBean pageBean = boardService.getContent(page);
            model.addAttribute("boardList", boardList);
            model.addAttribute("pageBean", pageBean);
        }
        
        model.addAttribute("searchType", searchType); // 검색 조건 유지를 위해 모델에 추가
        model.addAttribute("searchText", searchText);
        
        return "board/main"; // board/main 뷰로 이동합니다.
    }
    
    // 게시판 상세 조회(읽기)
    @GetMapping("/read")
    public String read(@RequestParam(value = "board_id", required = false, defaultValue = "0") int board_id, Model model) {
    	boardService.increaseViewCount(board_id); 
    	BoardBean readContentBean = boardService.getReadInfo(board_id);
    	model.addAttribute("readContentBean", readContentBean);   //read.jsp로 보냄
    	
    	model.addAttribute("board_id", board_id);
    	model.addAttribute("loginUserBean", loginUserBean);
    	
    	// 게시글 이전, 다음글
    	BoardBean PreviousBoard = boardService.getPreviousBoardInfo(board_id);
    	BoardBean NextBoard = boardService.getNextBoardInfo(board_id);

		model.addAttribute("PreviousBoard", PreviousBoard);
		model.addAttribute("NextBoard", NextBoard);
		
        return "board/read";
    }

    // 게시글 작성
    @GetMapping("/write")
    public String write(@ModelAttribute("boardBean") BoardBean boardBean, Model model) {
        return "board/write";
    }

    // 게시글 작성 처리
    @PostMapping("/write_pro")
    public String boardWrite(@ModelAttribute("boardBean") BoardBean boardBean, 
    						Model model, BindingResult result) {
       
    	if(result.hasErrors()) {
			return "board/write";
		}

    	boardService.addBoardContent(boardBean);
    	// board/write_success로 아예 안들어감 -> 오류나타남
    	return "board/write_success";
    }

    // 게시글 수정
    @GetMapping("/modify")
    public String modify(@RequestParam("board_id") int board_id, 
    					 @ModelAttribute("modifyContentBean") BoardBean modifyContentBean, Model model) {
		
    	model.addAttribute("board_id", board_id); //수정 페이지로 보냄
		
		//정보 가져옴 => 수정할 하나의 게시글 정보 가져옴
		// 사용자 확인
		BoardBean tempContentBean = boardService.getBoardInfo(board_id);
		
		modifyContentBean.setUser_id(tempContentBean.getUser_id());
		modifyContentBean.setCreate_date(tempContentBean.getUpdate_date());
		modifyContentBean.setTitle(tempContentBean.getTitle());
		modifyContentBean.setContents(tempContentBean.getContents());
		
		modifyContentBean.setBoard_id(board_id);
		
        return "board/modify";
    }

    // 게시글 수정 처리
    @PostMapping("/modify_pro")
    public String modify_pro(@Valid @ModelAttribute("modifyContentBean") BoardBean modifyContentBean,
    		                 BindingResult result) {
    	if(result.hasErrors()) {
			return "board/modify";
		}
    	boardService.modifyContentInfo(modifyContentBean); //service, dao, mappper 껴서 db 수정
         return "board/modify_success";
    }
    // 로그인 연동하고 넣을것
	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("board_id") int board_id,
			 			 Model model) {
		boardService.deleteBoardInfo(board_id);
		
		return "board/delete";
	}
	
    // 게시글 삭제
    @PostMapping("/delete_pro")
    public String delete_pro(@RequestParam("board_id") int board_id, Model model) {
    	boardService.deleteBoardInfo(board_id);
    	
    	return "board/delete";   
    }
  
    // 게시글 검색
    @GetMapping("/board/search")
    public String search(@RequestParam(value="searchType") String searchType,
                         @RequestParam(value="searchText") String searchText,
                         @RequestParam(value = "page", defaultValue = "1") int page,
                         Model model) {
        // 검색 결과를 가져오는 서비스 메서드 호출
        List<BoardBean> searchResult = boardService.getSearchBoards(searchType, searchText, page);
        model.addAttribute("boardList", searchResult);
        
    	PageBean pageBean = boardService.getSearchBoardPage(searchType, searchText, page);
        model.addAttribute("pageBean", pageBean);
        
        return "board/main"; // 검색 결과를 보여줄 뷰로 이동
    }
}