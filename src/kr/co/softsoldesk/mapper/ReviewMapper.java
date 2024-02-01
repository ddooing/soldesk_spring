package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectKey;

public interface ReviewMapper {

	// 예약시 소감문 생성
		@Insert("insert into review (review_id, reserve_id, regdate) values (review_id_seq.nextval,#{reserve_id}, sysdate)")
		void reserve_review_create(@Param("reserve_id") int reserve_id);
		
	
}
