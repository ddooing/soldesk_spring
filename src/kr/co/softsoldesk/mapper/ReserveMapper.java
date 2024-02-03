package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.Beans.ReserveBean;

public interface ReserveMapper {

	/*
	// 전시회 예매 테이블에 추가		 payment_state, order_id, paymentkey 는 일단 null로 삽입
	@Insert("INSERT INTO reserve (reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction, payment, ticket_count, reserve_time, state, payment_state, order_id, paymentkey)
	 VALUES (reserve_id_seq.NEXTVAL, #{user_id}, #{exhibition_id}, #{reserve_date, jdbcType=DATE}, #{total_price}, #{point_deduction}, #{payment}, #{ticket_count}, sysdate, 1,null,null,null)")
	void reserve_ing(ReserveBean ReserveBean);
	
	// 전시회 예매시 exhibition 테이블 ticket_count 값 올리기
	@Update("UPDATE exhibition SET ticket_cnt = ticket_cnt + #{ticket_count} WHERE exhibition_id = #{exhibition_id}")
	void reserveAfterExhibitionCntIncrease(@Param("ticket_count") int ticket_count, @Param("exhibition_id") int exhibition_id);
	 */
	
	// /checkout 예매 정보 저장 
	@Insert("INSERT INTO reserve (reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction,"
			+ "payment, ticket_count, order_id) "
			+ "VALUES (reserve_id_seq.NEXTVAL, #{user_id}, #{exhibition_id},#{reserve_date, jdbcType=DATE},"
			+ "#{total_price},#{point_deduction},#{payment},#{ticket_count},#{order_id})")
	void checkoutReserveInfo(ReserveBean checkoutReserveBean);
	
	@Select("select * from reserve where order_id=#{orderId}")
	boolean checkOrderId(String orderId);
	
	@Select("select payment from reserve where order_id=#{orderId}")
	int getPayment(String orderId);
}
