package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.Beans.ReviewBean;

public interface ReviewMapper {

	// 예약시 소감문 생성
		@Insert("insert into review (review_id, reserve_id, create_date) values (review_id_seq.nextval,#{reserve_id}, sysdate)")
		void reserve_review_create(@Param("reserve_id") int reserve_id);
		
	// 리뷰 테이블 정보 다 가져오기
	@Select("select review_id, reserve_id, contents, rating, expose, regdate, modify_date, create_date from review")
	ReviewBean getAllReviewInfo();
	
	
	//0216
	@Delete("DELETE FROM review WHERE reserve_id = #{reserve_id}")
	public void getReviewDelete(int reserve_id);
		
}
