package kr.co.softsoldesk.Service;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.BoardDao;
import kr.co.softsoldesk.mapper.BoardMapper;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;
	/* 로그인 적용시키면 해제
	@Resource(name="loginBean")
	private User loginBean;
	 */
	
	public void addBoardContent(BoardBean writeBoardBean) {
		// 로그인할 때 해제
		// writeBoardBean.setUser_id(loginBean.getUser_id());
		
		boardDao.addBoardContent(writeBoardBean);
	}
	
	public String getTest() {
		return boardDao.getTest();
	}
	
	// 게시글 상세 조회
	public BoardBean getReadInfo(int board_id)
	{
		return boardDao.getReadInfo(board_id);
	}
	
	// 전체 게시글 목록을 가져오는 메서드
    public List<BoardBean> getBoardList() {
        return boardDao.getBoardList(); // BoardDao에서 전체 게시글 목록을 가져오는 메서드를 호출
    }
    
	/*
	public void addBoardContent(BoardBean writeBoardBean) {
		// 로그인할 때 해제
		// writeBoardBean.setUser_id(loginBean.getUser_id());
		
		 boardDao.addBoardContent(writeBoardBean);
	}*/
    
    public void addingBoardContent(BoardBean boardBean) {
    	boardDao.addingBoardContent(boardBean);
    }
}
