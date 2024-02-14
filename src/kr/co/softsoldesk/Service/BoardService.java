package kr.co.softsoldesk.Service;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.CommentBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.BoardDao;
import kr.co.softsoldesk.mapper.BoardMapper;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Map;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Value("${boardpage.listcnt}")
	private int page_listcnt;
	
	@Value("${boardpage.paginationcnt}")
	private int page_paginationcnt;
	
	@Value("${comment.listcnt}")
	private int comment_listCnt;

	@Value("${comment.paginationcnt}")
	private int comment_paginationCnt;
	
	
	public void addBoardContent(BoardBean boardBean) {
		boardBean.setUser_id(loginUserBean.getUser_id());
		System.out.println(loginUserBean.getUser_id());
		boardDao.addBoardContent(boardBean);
		
	}
	
	// 게시글 상세 조회
	public BoardBean getReadInfo(int board_id){
		return boardDao.getReadInfo(board_id);
	}
	
    public List<BoardBean> getBoardList(int page) {
    	int start = (page -1) * page_listcnt;
    	
    	RowBounds rowBounds = new RowBounds(start, page_listcnt); //start부터 page_list개 
    	
        return boardDao.getBoardList(rowBounds);
    }
    
    // 게시글 조회
    public void increaseViewCount(int board_id) {
        boardDao.increaseViewCount(board_id);
    }
    // 게시글 이전글
    public BoardBean getPreviousBoardInfo(int board_id) {
        System.out.println("Requesting Previous Board for board_id: " + board_id);
        BoardBean result = boardDao.getPreviousBoard(board_id);
        System.out.println("Previous Board: " + result);
        return result;
    }

    // 게시글 다음글
    public BoardBean getNextBoardInfo(int board_id) {
    	BoardBean result = boardDao.getNextBoard(board_id);
    	System.out.println("Next Board: " + result); // 로깅 추가
        return boardDao.getNextBoard(board_id);
    }
    
    // 페이징 처리
    public PageBean getContent(int currentPage) {
    	int content_Cnt = boardDao.getContentCnt();
		PageBean pageBean = new PageBean(content_Cnt, currentPage, page_listcnt, page_paginationcnt);
		return pageBean;
	}
    
    // 회원과 게시글작성자 일치하는지 확인
    public BoardBean getBoardInfo(int board_id) {
    	return boardDao.getBoardInfo(board_id);
    }
    
    // 게시글 수정
    public void modifyContentInfo(BoardBean modifyContentBean) {
		/*
		MultipartFile upload_file = modifyContentBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			modifyContentBean.setContent_file(file_name);
		}*/
    	boardDao.modifyContentInfo(modifyContentBean);
	}
    // 게시글 삭제
    public void deleteBoardInfo(int board_id) {
		boardDao.deleteBoardInfo(board_id);
	}
    
    // 댓글
    public void addComment(CommentBean commentBean) {
    	// 로그인될 시 해제
    	commentBean.setUser_id(loginUserBean.getUser_id());
    	boardDao.addComment(commentBean);
    }
    
    // 댓글 목록 조회
    public List<CommentBean> getComment_s(int board_id, int page) {
    	int start = (page -1)*comment_listCnt;
    	RowBounds rowBounds = new RowBounds(start, comment_listCnt);
	    return boardDao.getComment_s(board_id, rowBounds);
	}
    
    // 댓글 페이징 처리
    public PageBean getCommentPage(int board_id, int currentPage) {
    	int commentCnt = getReplyCnt(board_id);
		PageBean pageBean = new PageBean(commentCnt, currentPage, comment_listCnt, comment_paginationCnt);
		return pageBean;
    }
    
    
    
	// 댓글 수정
	public void updateComment(CommentBean updateComment) {
		boardDao.updateComment(updateComment);
	}
	
	// 댓글 삭제
	public void deleteComment(int comment_id) {
		boardDao.deleteComment(comment_id);
	}
    
    public int getReplyCnt(int board_id) {
        return boardDao.getCommentPage(board_id);
    }
    
    // 검색 조건에 맞는 게시글 목록 가져오기
    public List<BoardBean> getSearchBoards(String searchType, String searchText, int page) {
        int start = (page - 1) * 10; // 예시로 페이지당 10개의 게시글을 보여준다고 가정
        RowBounds rowBounds = new RowBounds(start, 10);
        return boardDao.getSearchBoards(searchType, searchText, rowBounds);
    }

    // 검색 결과에 따른 페이지 정보 가져오기
    public PageBean getSearchBoardPage(String searchType, String searchText, int currentPage) {
        int contentCnt = boardDao.getSearchBoardsCnt(searchType, searchText);
        return new PageBean(contentCnt, currentPage, 10, 10); // 페이지당 게시글 수와 페이지네이션 수를 예시로 10으로 설정
    }
}
