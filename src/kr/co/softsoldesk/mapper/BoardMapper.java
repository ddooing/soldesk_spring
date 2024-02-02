package kr.co.softsoldesk.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;
import kr.co.softsoldesk.Beans.BoardBean;

@Mapper
public interface BoardMapper {

    @Select("SELECT * FROM board WHERE board_id = #{board_id}")
    BoardBean getBoardById(int board_id);

    @Select("SELECT * FROM board")
    List<BoardBean> getAllBoards();

    @Insert("INSERT INTO board (board_id, user_id, title, create_date, views, contents, update_date, state) " +
            "VALUES (#{board_id}, #{user_id}, #{title}, #{create_date}, #{views}, #{contents}, #{update_date}, #{state})")
    void addBoard(BoardBean board);
    
    
    @Update("UPDATE board SET title = #{title}, contents = #{contents}, update_date = #{update_date}, state = #{state} " +
            "WHERE board_id = #{board_id}")
    void modifyBoard(BoardBean board);

    // 게시글 삭제(비공개)
    @Update("UPDATE board SET state = 0 WHERE board_id = #{board_id}")
    void deleteBoard(int board_id);
}
