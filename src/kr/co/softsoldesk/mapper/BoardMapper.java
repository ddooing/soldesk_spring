package kr.co.softsoldesk.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.annotations.Delete;
import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.CommentBean;

@Mapper
public interface BoardMapper {
	 
	// 게시글 추가
	@SelectKey(statement = "select board_id_seq.nextval from dual", keyProperty = "board_id", before = true, resultType = int.class)
	@Insert("INSERT INTO board (board_id, user_id, title, create_date, views, contents, update_date, state) " +
	        "VALUES (#{board_id}, #{user_id}, #{title}, sysdate, #{views}, #{contents}, sysdate, 1)")
	void addBoardContent(BoardBean boardBean);
	
	// 내용 상세조회
	@Select("SELECT a2.*, TO_CHAR(a2.create_date, 'YYYY') AS create_date, a1.name AS user_name "
			+ "FROM user_table a1, board a2 "
			+ "WHERE a1.user_id = a2.user_id AND a2.board_id = #{board_id}")
	//@Select("SELECT * FROM board WHERE board_id = #{board_id}")
	BoardBean getReadInfo(int board_id);

	// 게시글 목록(사용자 명과 같은) 조회(내림차순)
	@Select("SELECT a1.board_id, a1.title, a2.name AS user_name, to_char(a1.create_date, 'yyyy-mm-dd') as create_date, a2.user_id as user_id, a1.state "
			+ "FROM board a1 JOIN user_table a2 ON a1.user_id = a2.user_id and a1.state = 1 "
			+ "ORDER BY a1.board_id DESC")
	List<BoardBean> getBoardList(RowBounds rowBounds);

	// 해당 게시글 번호에 해당하는 게시글 정보와 게시글 테이블에서 FK로 설정한 회원 번호를 찾아 회원 이름을 찾아온다.
	@Select("select a1.name AS user_name, to_char(a2.create_date, 'yyyy-mm-dd') as create_date, "
			+ "a2.title, a2.contents "
			+ "from user_table a1, board a2 "
			+ "where a1.user_id = a2.user_id "
			+ "and board_id = #{board_id} and a2.state = 1")
	BoardBean getBoardInfo(int board_id);

	// 게시글 조회수 증가
	@Update("UPDATE board SET views = views + 1 WHERE board_id = #{board_id}")
	void increaseViewCount(int board_id);
	
	// 이전글 이동
	@Select("SELECT board_id, title  FROM (SELECT board_id, title FROM board "
			+ "WHERE board_id < #{board_id} "
			+ "ORDER BY board_id DESC) "
			+ "WHERE ROWNUM <= 1")
	BoardBean getPreviousBoard(int board_id);
	
	// 다음글 이동
	@Select("SELECT board_id, title FROM (SELECT board_id, title FROM board "
			+ "WHERE board_id > #{board_id} "
			+ "ORDER BY board_id ASC) "
			+ "WHERE ROWNUM <= 1")
	BoardBean getNextBoard(int board_id);
	
	// 게시글 수정
	@Update("UPDATE board "
			+ "SET title = #{title}, contents = #{contents}, update_date = TRUNC(TO_DATE(#{update_date}, 'YYYY-MM-DD')) "
			+ "WHERE board_id = #{board_id}")
	void modifyContentInfo(BoardBean modifyContentBean);

	// 게시글 삭제
	@Update("UPDATE board SET state = 0 WHERE board_id = #{board_id}")
	void deleteBoardInfo(int board_id);

	// 해당 게시판의 전체 글 수 가져오기
	@Select("select count(*) " 
			+ "from board "
			+ "where state = 1")
	int getContentCnt();
	
	// 댓글 추가
	@Insert("INSERT INTO comment_table (comment_id, board_id, user_id, contents, regdate, modify_date, state) " +
	        "VALUES (comment_id_seq.NEXTVAL, #{board_id}, #{user_id}, #{contents}, SYSDATE, SYSDATE, 1)")
	void addComment(CommentBean commentBean);
	
	// 댓글 조회
	@Select("SELECT  b.comment_id AS comment_id, a.name AS user_name, b.regdate, b.modify_date, b.board_id, "
			+ "b.contents AS contents, b.board_id AS board_id "
			+ "FROM user_table a JOIN comment_table b ON a.user_id = b.user_id "
			+ "WHERE b.board_id = #{board_id} AND b.state = 1 "
			+ "ORDER BY b.comment_id DESC")
	List<CommentBean> getComment_s(int board_id, RowBounds rowBounds);
	
	// 댓글 페이징처리
	@Select("SELECT COUNT(*) FROM comment_table WHERE board_id = #{board_id} AND state = 1")
	int countCommentsByBoardId(int board_id);

	// 댓글 수정
	@Update("UPDATE comment_table " +
	        "SET contents = #{contents}, " +
	        " modify_date = SYSDATE " +
	        "WHERE comment_id = #{comment_id}")
	void updateComment(CommentBean updateComment);
	
	// 댓글 삭제
	@Update("UPDATE comment_table "
			+ "SET state = 0, "
			+ "modify_date = SYSDATE "
			+ "WHERE comment_id = #{comment_id}")
	void deleteComment(int comment_id);
	
	/*
	@Select("SELECT * FROM board "
		       + "WHERE UPPER(title) LIKE '%' || UPPER(#{keyword}) || '%' "
		       + "OR UPPER(contents) LIKE '%' || UPPER(#{keyword}) || '%' "
		       + "ORDER BY board_id DESC")
	List<BoardBean> searchAll(@Param("keyword") String keyword);
	*/
	
	@Select("SELECT b.board_id, b.user_id, b.title, b.create_date, b.views, COUNT(c.comment_id) AS commentCnt "
	        + "FROM board b "
	        + "LEFT JOIN comment_table c ON b.board_id = c.board_id "
	        + "WHERE b.state = 1 AND ("
	        + "    #{searchType} IS NULL OR "
	        + "    (#{searchType} = 'total' AND (b.title LIKE '%' || #{searchText} || '%' OR b.contents LIKE '%' || #{searchText} || '%')) OR "
	        + "    (#{searchType} = 'title' AND b.title LIKE '%' || #{searchText} || '%') OR "
	        + "    (#{searchType} = 'contents' AND b.contents LIKE '%' || #{searchText} || '%')) "
	        + "GROUP BY b.board_id, b.user_id, b.title, b.create_date, b.views "
	        + "ORDER BY b.board_id DESC")
	List<BoardBean> getSearchBoards(@Param("searchType") String searchType, @Param("searchText") String searchText, RowBounds rowBounds);

	@Select("SELECT COUNT(*) AS commnet_cnt "
	        + "FROM board b "
	        + "LEFT JOIN comment_table c ON b.board_id = c.board_id "
	        + "WHERE b.state = 1 AND ("
	        + "    #{searchType} IS NULL OR "
	        + "    (#{searchType} = 'total' AND (b.title LIKE '%' || #{searchText} || '%' OR b.contents LIKE '%' || #{searchText} || '%')) OR "
	        + "    (#{searchType} = 'title' AND b.title LIKE '%' || #{searchText} || '%') OR "
	        + "    (#{searchType} = 'contents' AND b.contents LIKE '%' || #{searchText} || '%'))")
	int getSearchBoardsCnt(@Param("searchType") String searchType, @Param("searchText") String searchText);

}