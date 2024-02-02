package kr.co.softsoldesk.dao;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.mapper.BoardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDao {

    private final BoardMapper boardMapper;

    @Autowired
    public BoardDao(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public BoardBean getBoardById(int board_id) {
        return boardMapper.getBoardById(board_id);
    }

    public List<BoardBean> getAllBoards() {
        return boardMapper.getAllBoards();
    }

    public void addBoard(BoardBean board) {
        boardMapper.addBoard(board);
    }

    public void modifyBoard(BoardBean board) {
        boardMapper.modifyBoard(board);
    }

    public void deleteBoard(int board_id) {
        boardMapper.deleteBoard(board_id);
    }
}
