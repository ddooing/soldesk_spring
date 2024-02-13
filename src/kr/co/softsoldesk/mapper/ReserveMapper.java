package kr.co.softsoldesk.mapper;

import java.util.List;

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
	@Select("SELECT reserve_id,user_id, exhibition_id, To_char(reserve_date,'yyyy-mm-dd') as reserve_date,"
			+ "total_price,point_deduction,payment,state,ticket_count,order_id,"
			+ "pay_state,pay_approval_state,"
			+ " TO_CHAR(approved_at, 'YYYY-MM-DD HH24:MI') as requested_at,"
			+ " TO_CHAR(approved_at, 'YYYY-MM-DD HH24:MI') as approved_at, "
			+ "paymentkey"
			+ " FROM reserve where order_id=#{orderId}")
	public ReserveBean validcheckOrderId(String orderId);
	
	///success - 2
	@Update("update reserve set paymentkey=#{paymentKey} ,pay_approval_state=1 "
			+ "where order_id= #{orderId}")
	void approvalBefore(@Param("orderId") String orderId, @Param("paymentKey") String paymentKey);
	
	///success - 3
	@Update("UPDATE reserve " +
	        "SET pay_state = 1, " +
	        "state = 1, " +
	        "requested_at = TO_TIMESTAMP_TZ(#{requested_at}, 'YYYY-MM-DD\"T\"HH24:MI:SS.FF TZH:TZM'), " +
	        "approved_at = TO_TIMESTAMP_TZ(#{approved_at}, 'YYYY-MM-DD\"T\"HH24:MI:SS.FF TZH:TZM'),"
	        + " payment_method=#{method} WHERE order_id = #{orderId}")
	void realReserveState(@Param("orderId") String orderId, 
	                      @Param("requested_at") String requested_at, 
	                      @Param("approved_at") String approved_at,
	                      @Param("method") String method);

	
	// 결제 금액이 0 일 경우에 저장하는 
	@Insert("INSERT INTO reserve (reserve_id, user_id, exhibition_id, reserve_date, total_price, point_deduction,"
			+ "payment, ticket_count, order_id,pay_state,pay_approval_state,requested_at,state,payment_method) "
			+ "VALUES (reserve_id_seq.NEXTVAL, #{user_id}, #{exhibition_id},#{reserve_date, jdbcType=DATE},"
			+ "#{total_price},#{point_deduction},#{payment},#{ticket_count},#{order_id},0,0,"
			+ " TO_TIMESTAMP(TO_CHAR(SYSTIMESTAMP, 'YY/MM/DD HH24:MI:SS.FF9'), 'YY/MM/DD HH24:MI:SS.FF9'), 1,'포인트결제')")
	public void paymentZeroReserveInfo(ReserveBean reserveInfo );
	
	
	@Select("SELECT r.reserve_id, e.exhibition_id, TO_CHAR(r.reserve_date, 'yyyy-mm-dd') AS reserve_date, " +
	        "r.total_price, r.point_deduction, r.payment, r.ticket_count, " +
	        "TO_CHAR(requested_at, 'YYYY-MM-DD HH24:MI') as requested_at, " +
	        "TO_CHAR(approved_at, 'YYYY-MM-DD HH24:MI') as approved_at, " +
	        "r.state, r.pay_state, r.pay_approval_state, r.order_id, r.payment_method, r.paymentkey, u.name, e.title " +
	        "FROM reserve r " +
	        "INNER JOIN user_table u ON r.user_id = u.user_id " +
	        "INNER JOIN exhibition e ON r.exhibition_id = e.exhibition_id")
	public List<ReserveBean> getReserveList();
	
	
}