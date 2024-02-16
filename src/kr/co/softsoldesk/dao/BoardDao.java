package kr.co.softsoldesk.dao;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.CommentBean;
import kr.co.softsoldesk.mapper.BoardMapper;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardDao {
	
	@Autowired
    private BoardMapper boardMapper;
    
	// 게시글 추가
	public void addBoardContent(BoardBean BoardBean) {
        boardMapper.addBoardContent(BoardBean);
    }
	// 게시글 목록
	public List<BoardBean> getBoardList(RowBounds rowBounds) {
        return boardMapper.getBoardList(rowBounds); // BoardDao에서 전체 게시글 목록을 가져오는 메서드를 호출
    }
	// 게시글 상세조회
	public BoardBean getReadInfo(int board_id) {
		return boardMapper.getReadInfo(board_id);
	} 
	
	// 회원과 게시글작성자 일치하는지 확인
	public BoardBean getBoardInfo(int board_id) {
		return boardMapper.getBoardInfo(board_id);
	}
	
	// 게시글 수정 이름 고정
	public BoardBean getmodifyContentInfo(int board_id) {
		return boardMapper.getmodifyContentInfo(board_id);
	}
	
	// 게시글 수정
	public void modifyContentInfo(BoardBean modifyContentBean) {
		boardMapper.modifyContentInfo(modifyContentBean);
	}
	// 게시글 삭제
	public void deleteBoardInfo(int board_id) {
		boardMapper.deleteBoardInfo(board_id);
	}
	// 게시글 총 수량
	public int getContentCnt() {
	    return boardMapper.getContentCnt();
	}

	// 게시글 조회수 증가
	public void increaseViewCount(int board_id) {
		boardMapper.increaseViewCount(board_id);
	}

	// 게시글 이전글
	public BoardBean getPreviousBoard(int board_id) {
		return boardMapper.getPreviousBoard(board_id);
	}

	// 게시글 다음글
	public BoardBean getNextBoard(int board_id) {
		return boardMapper.getNextBoard(board_id);
	}
	
	// 댓글 추가
	public void addComment(CommentBean commentBean) {
		boardMapper.addComment(commentBean);
	}
	
	// 댓글 조회
	public List<CommentBean> getComment_s(int board_id, RowBounds rowBounds) {
		return boardMapper.getComment_s(board_id, rowBounds);
	}
	// 댓글 페이징처리
	public int getCommentPage(int board_id) {
	    return boardMapper.countCommentsByBoardId(board_id);
	}
	
	// 댓글 수정
	public void updateComment(CommentBean updateComment) {
		boardMapper.updateComment(updateComment);
	}
	
	// 댓글 삭제
	public void deleteComment(int comment_id) {
		boardMapper.deleteComment(comment_id);
	}
	
	// 댓글 일치
	/*
	public CommentBean getCommentInfo(int comment_id) {
		return boardMapper.getCommentInfo(comment_id);
	}
	*/
    
	// 검색 조건에 맞는 게시글 목록 가져오기
    public List<BoardBean> getSearchBoards(String searchType, String searchText, RowBounds rowBounds) {
        return boardMapper.getSearchBoards(searchType, searchText, rowBounds);
    }

    // 검색 결과의 총 게시글 수 가져오기
    public int getSearchBoardsCnt(String searchType, String searchText) {
        return boardMapper.getSearchBoardsCnt(searchType, searchText);
    }
}
