package kr.co.softsoldesk.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;
import kr.co.softsoldesk.Beans.BoardBean;

@Mapper
public interface BoardMapper {
	/*
    @Select("SELECT * FROM board WHERE board_id = #{board_id}")
    BoardBean getBoardById(int board_id);
	 */
	
	/*
    @Insert("INSERT INTO board (board_id, user_id, title, create_date, views, contents, update_date, state) "
    		+ "VALUES (board_id_seq.NEXTVAL, #{user_id}, #{title}, TO_DATE(#{create_date}, 'YYYY-MM-DD'), #{views}, #{contents}, TO_DATE(#{update_date}, 'YYYY-MM-DD'), #{state})")
    void addBoardContent(BoardBean writeContentBean);
    */
	/*"INSERT INTO board (user_id, title, create_date, views, contents, update_date, state) "
	        + "VALUES (#{title}, #{user_id}, TO_DATE(#{create_date}, 'YYYY-MM-DD'), #{views}, #{contents}, TO_DATE(#{update_date}, 'YYYY-MM-DD'), #{state})"*/
	/*
	@Insert("INSERT INTO board (board_id, user_id, title, views, contents, state, create_date, update_date) " +
	        "VALUES (board_id_seq.NEXTVAL, #{user_id, jdbcType=INTEGER}, " +
	        "#{title, jdbcType=VARCHAR}, " +
	        "#{views, jdbcType=INTEGER}, " +
	        "#{contents, jdbcType=CLOB}, " +
	        "#{state, jdbcType=INTEGER}, " +
	        "SYSDATE, SYSDATE)")
	@Options(useGeneratedKeys=true, keyProperty="board_id")
	int addBoardContent(BoardBean writeContentBean);
*/
	/*
	@Insert("INSERT INTO board (board_id, user_id, title, create_date, contents, state) " +
	        "VALUES (board_id_seq.NEXTVAL, #{user_id}, " +
	        "#{title, jdbcType=VARCHAR}, " +
	        "SYSDATE, " +
	        "#{contents, jdbcType=CLOB}, " +
			"#{state})")
	@Options(keyProperty="board_id")
	void addBoardContent(BoardBean writeContentBean);*/
	
	@Insert("INSERT INTO board (board_id, title, contents) " +
	        "VALUES (board_id_seq.nextval, #{title, jdbcType=VARCHAR}, #{contents, jdbcType=VARCHAR})")
	void addBoardContent(BoardBean writeContentBean);
	
	@Insert("INSERT INTO board (board_id, title, contents) VALUES (board_id_seq.nextval, #{title}, #{contents})")
	void addingBoardContent(BoardBean boardBean);
	
	// 내용 상세조회
	@Select("select * from board where board_id=#{board_id}")
	BoardBean getReadInfo(int board_id);
	
	// 목록 조회
	@Select("SELECT board_id, title, user_id, create_date FROM board")
	List<BoardBean> getBoardList();
	
	@Select("select title from board where board_id=341")
	String getTest();
	
	
	/*
	@Insert("INSERT INTO board (board_id, title, contents) " +
	        "VALUES (board_id_seq.NEXTVAL, #{user_id, jdbcType=INTEGER}, " +
	        "#{title, jdbcType=VARCHAR}, " +
	        "#{views, jdbcType=INTEGER}, " +
	        "#{contents, jdbcType=CLOB}, " +
	        "#{state, jdbcType=INTEGER}, " +
	        "SYSDATE)")
	@Options(useGeneratedKeys=true, keyProperty="board_id")
	int addBoardContent(BoardBean writeContentBean);
	 */
    /*
    @Update("UPDATE board SET title = #{title}, contents = #{contents}, update_date = #{update_date}, state = #{state} " +
            "WHERE board_id = #{board_id}")
    void modifyBoard(BoardBean board);

    // 게시글 삭제(비공개)
    @Update("UPDATE board SET state = 0 WHERE board_id = #{board_id}")
    void deleteBoard(int board_id);
    */
}
