package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;

public interface ReserveMapper {

	// 전시회 예매 테이블에 추가		 payment_state, order_id, paymentkey 는 일단 null로 삽입
	@Insert("INSERT INTO reserve (reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction, payment, ticket_count, reserve_time, state, payment_state, order_id, paymentkey) VALUES (reserve_id_seq.nextval, #{user_id}, #{exhibition_id}, #{reserve_date, jdbcType=DATE}, #{total_price}, #{point_deduction}, #{payment}, #{ticket_count}, sysdate, #{state},null,#{order_id},null)")
	void reserve_ing(ReserveBean ReserveBean);
	
	// 전시회 예매시 exhibition 테이블 ticket_count 값 올리기
	@Update("UPDATE exhibition SET ticket_cnt = ticket_cnt + #{ticket_count} WHERE exhibition_id = #{exhibition_id}")
	void reserveAfterExhibitionCntIncrease(@Param("ticket_count") int ticket_count, @Param("exhibition_id") int exhibition_id);

	@Select("SELECT reserve_id, order_id from reserve where order_id = #{order_id}")
	ReserveBean getReserve_idForMakeReview(String order_id);
	
	
}
