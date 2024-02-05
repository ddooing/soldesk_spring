package kr.co.softsoldesk.dao;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.mapper.BoardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDao {
	
	@Autowired
    private BoardMapper boardMapper;
    
	public void addBoardContent(BoardBean writeBoardBean) {
        boardMapper.addBoardContent(writeBoardBean);
    }
	
	
	public BoardBean getReadInfo(int board_id)
	{
		return boardMapper.getReadInfo(board_id);
	} 
	
	public List<BoardBean> getBoardList() {
        return boardMapper.getBoardList(); // BoardDao에서 전체 게시글 목록을 가져오는 메서드를 호출
    }
	
	public String getTest() {
		
		return boardMapper.getTest();
	}
	/*
	public List<BoardBean> findAll() {
        return boardMapper.findAll(); // findAll 메서드 호출
    }*/
	
    /*
    @Autowired
    public BoardDao(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public BoardBean getBoardById(int board_id) {
        return boardMapper.getBoardById(board_id);
    }

    // 새 게시글 정보를 데이터베이스에 저장하는 메소드
    public void addContentInfo(BoardBean writeContentBean) {
        boardMapper.addContent(writeContentBean);
    }

     */
    /*
    public void modifyBoard(BoardBean board) {
        boardMapper.modifyBoard(board);
    }

    public void deleteBoard(int board_id) {
        boardMapper.deleteBoard(board_id);
    }*/
	
	public void addingBoardContent(BoardBean boardBean) {
		boardMapper.addingBoardContent(boardBean);
	}
}
