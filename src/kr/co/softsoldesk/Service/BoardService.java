package kr.co.softsoldesk.Service;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.BoardDao;
import kr.co.softsoldesk.mapper.BoardMapper;

import org.apache.commons.io.FilenameUtils;
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
//@PropertySource("/WEB-INF/properties/option.properties")
public class BoardService {

	private final BoardMapper boardMapper;

    @Autowired
    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public BoardBean getBoardById(int board_id) {
        return boardMapper.getBoardById(board_id);
    }

    public List<BoardBean> getAllBoards() {
        return boardMapper.getAllBoards();
    }

    @Transactional
    public void addBoard(BoardBean board) {
        boardMapper.addBoard(board);
    }

    @Transactional
    public void modifyBoard(BoardBean board) {
        boardMapper.modifyBoard(board);
    }

    @Transactional
    public void deleteBoard(int board_id) {
        boardMapper.deleteBoard(board_id);
    }
}
