package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.ReserveBean;

public interface ReserveMapper {


	// /checkout 예매 정보 저장 
	@Insert("INSERT INTO reserve (reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction,"
			+ "payment, ticket_count, order_id,pay_state,pay_approval_state) "
			+ "VALUES (reserve_id_seq.NEXTVAL, #{user_id}, #{exhibition_id},#{reserve_date, jdbcType=DATE},"
			+ "#{total_price},#{point_deduction},#{payment},#{ticket_count},#{order_id},0,0)")
	void checkoutReserveInfo(ReserveBean checkoutReserveBean);
	
	///success - 1
	@Select("select order_id from reserve where order_id=#{orderId}")
	String  checkOrderId(String orderId);
	///success - 2
	@Select("select * from reserve where order_id=#{orderId}")
	ReserveBean validcheckOrderId(String orderId);
	
	///success - 3
	@Update("update reserve set paymentkey=#{paymentKey} ,pay_approval_state=1 "
			+ "where order_id= #{orderId}")
	void approvalBefore(@Param("orderId") String orderId, @Param("paymentKey") String paymentKey);
	
	///success - 4
	@Update("UPDATE reserve " +
	        "SET pay_state = 1, " +
	        "state = 1, " +
	        "requested_at = TO_TIMESTAMP_TZ(#{requested_at}, 'YYYY-MM-DD\"T\"HH24:MI:SS.FF TZH:TZM'), " +
	        "approved_at = TO_TIMESTAMP_TZ(#{approved_at}, 'YYYY-MM-DD\"T\"HH24:MI:SS.FF TZH:TZM') " +
	        "WHERE order_id = #{orderId}")
	void realReserveState(@Param("orderId") String orderId, 
	                      @Param("requested_at") String requested_at, 
	                      @Param("approved_at") String approved_at);

	
	// 결제 금액이 0 일 경우에 저장하는 
	@Insert("INSERT INTO reserve (reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction,"
			+ "payment, ticket_count, order_id,pay_state,pay_approval_state,requested_at,state) "
			+ "VALUES (reserve_id_seq.NEXTVAL, #{user_id}, #{exhibition_id},#{reserve_date, jdbcType=DATE},"
			+ "#{total_price},#{point_deduction},#{payment},#{ticket_count},#{order_id},0,0,"
			+ " TO_TIMESTAMP(TO_CHAR(SYSTIMESTAMP, 'YY/MM/DD HH24:MI:SS.FF9'), 'YY/MM/DD HH24:MI:SS.FF9'), 1)")
	public void paymentZeroReserveInfo(ReserveBean reserveInfo );
	
	
}
