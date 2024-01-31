package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;

import kr.co.softsoldesk.Beans.BoardBean;

public interface BoardMapper {
    @Insert("INSERT INTO board (board_idx, user_idx, title, create_date, views, contents, update_date, state) " +
            "VALUES (board_idx_seq.NEXTVAL, #{userIdx}, #{title}, #{createDate}, #{views}, #{contents}, #{updateDate}, #{state})")
    void insertBoard(BoardBean board);

    @Select("SELECT board_idx, user_idx, title, create_date, views, contents, update_date, state " +
            "FROM board " +
            "WHERE board_idx = #{boardIdx}")
    BoardBean selectBoard(int boardIdx);

    @Select("SELECT board_idx, user_idx, title, create_date, views, contents, update_date, state " +
            "FROM board")
    List<BoardBean> selectAllBoards();

    @Update("UPDATE board " +
            "SET title = #{title}, create_date = #{createDate}, views = #{views}, contents = #{contents}, " +
            "update_date = #{updateDate}, state = #{state} " +
            "WHERE board_idx = #{boardIdx}")
    void updateBoard(BoardBean board);

    @Delete("DELETE FROM board " +
            "WHERE board_idx = #{boardIdx}")
    void deleteBoard(int boardIdx);
}
