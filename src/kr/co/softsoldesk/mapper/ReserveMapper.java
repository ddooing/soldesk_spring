package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;

public interface ReserveMapper {

	// 전시회 예매 테이블에 추가
	@Insert("INSERT INTO reserve (reserve_idx, user_idx, exhibition_idx, reserve_date, total_price, point_use, cash_use, ticket_count, reserve_time, state) " +
	        "VALUES (reserve_idx_seq.NEXTVAL, #{user_idx}, #{exhibition_idx}, #{reserve_date, jdbcType=DATE}, #{total_price}, #{point_use}, #{cash_use}, #{ticket_count}, sysdate, 1)")
	void reserve_ing(ReserveBean ReserveBean);
	
	// 전시회 예매시 exhibition 테이블 ticket_count 값 올리기
	@Update("UPDATE exhibition SET ticket_cnt = ticket_cnt + #{ticket_count} WHERE exhibition_idx = #{exhibition_idx}")
	void reserveAfterExhibitionCntIncrease(@Param("ticket_count") int ticket_count, @Param("exhibition_idx") int exhibition_idx);

}
