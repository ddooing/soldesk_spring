package kr.co.softsoldesk.Service;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.BoardDao;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

/*@Service
@PropertySource("/WEB-INF/properties/option.properties")*/
public class BoardService {
/*
    private final BoardDao boardDao;

    @Autowired
    public BoardService(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    // 파일 업로드 관련 설정
    @Resource(name="loginUserBean")
    private UserBean loginUserBean;

    @Value("${path.upload}")
    private String path_upload;

    // 기타 메서드들

    private String saveUploadFile(MultipartFile upload_file) {
        String file_name = System.currentTimeMillis() + "_"
                + FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "."
                + FilenameUtils.getExtension(upload_file.getOriginalFilename());

        try {
            upload_file.transferTo(new File(path_upload + "/" + file_name));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file_name;
    }

    public List<BoardBean> getBoardList(int page) {
        // 페이징 처리를 위한 로직이 필요합니다. 여기서는 예시로 간단한 구현을 제시합니다.
        int start = (page - 1) * 10; // 10은 페이지당 게시글 수를 나타냅니다.
        return boardDao.findBoardListPaged(start, 10);
    }

    public BoardBean getBoardById(int boardId) {
        return boardDao.findBoardById(boardId);
    }

    public void createBoard(BoardBean board) {
        boardDao.insertBoard(board);
    }

    public void updateBoard(BoardBean board) {
        boardDao.updateBoard(board);
    }

    public void deleteBoard(int boardId) {
        boardDao.deleteBoard(boardId);
    }
*/
}
