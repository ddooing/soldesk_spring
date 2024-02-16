package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;

public interface BannerMapper {

	// 승연 ```````````````````````````````````````````````
	@Insert("insert into banner_apply_form "
			+ "(apply_person_id, exhibition_id, start_date, end_date, command, payment, banner_type, banner_file_id,order_id,pay_state,pay_approval_state) "
			+ "values "	//#{banner_file_id} 임시 지정 
			+ "(#{apply_person_id}, #{exhibition_id}, #{start_date}, #{end_date}, #{command},#{payment} , #{banner_type},#{banner_file_id},#{order_id},0,0)")
	void insertbanner_apply(BannerApplyFormBean bannerApplyFormBean);
	
	// 배너 신청 할때 파일테이블에 저장
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name, jdbcType=VARCHAR}, #{path, jdbcType=VARCHAR}, sysdate)")
	void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean);
	
	// 전시회 관리자가 직접 추가 3번 file_table에 저장한 값들의 file_id 가져오기
	@Select("SELECT file_id from file_table where name=#{name}")
	int getFileId(String name);
	
	// 배너 신청 페이지 신청한 apply_person이 신청한 전시회 목록 가져가기
	@Select("SELECT\r\n"
			+ "    e.exhibition_id,\r\n"
			+ "    e.title\r\n"
			+ "FROM\r\n"
			+ "    exhibition e\r\n"
			+ "INNER JOIN\r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    u.user_id = #{user_id}")
	List<ExhibitionBean> getApply_personExhibitionlist(@Param("user_id") int user_id);
	
	
	// 1.success 검증 1- orderid 를 통해 체크하기 
	@Select("SELECT order_id,payment,banner_type"
			+ " FROM banner_apply_form where order_id=#{orderId}")
	public BannerApplyFormBean validcheckOrderId(String orderId);
	
	
	
	// 2. 승인 성공 후, 모두 저장 
	 	// tosscontroller 의 approvalBefore 와 realReserveState 를 한번에 처리함

	@Update("UPDATE banner_apply_form " +
	        "SET pay_state = 1, paymentkey=#{paymentKey} ,pay_approval_state=1, " +
	        "state = 1, " +
	        "requested_at = TO_TIMESTAMP_TZ(#{requested_at}, 'YYYY-MM-DD\"T\"HH24:MI:SS.FF TZH:TZM'), " +
	        "approved_at = TO_TIMESTAMP_TZ(#{approved_at}, 'YYYY-MM-DD\"T\"HH24:MI:SS.FF TZH:TZM'),"
	        + " payment_method=#{method} WHERE order_id = #{orderId}")
	void realPaymentState(@Param("orderId") String orderId, 
	                      @Param("requested_at") String requested_at, 
	                      @Param("approved_at") String approved_at,
	                      @Param("method") String method,
	                      @Param("paymentKey") String paymentKey);
	
	//배너 결제 정보 가져오기 
	@Select("SELECT banner_apply_form_id, apply_person_id,exhibition_id,"
			+ "TO_CHAR(start_date, 'YYYY-MM-DD') as start_date, "
			+ "TO_CHAR(end_date, 'YYYY-MM-DD') as end_date, "
			+ "command,payment,state,banner_type,banner_file_id,\r\n"
			+"TO_CHAR(requested_at, 'YYYY-MM-DD HH24:MI:SS') as requested_at, "
	        +"TO_CHAR(approved_at, 'YYYY-MM-DD HH24:MI:SS') as approved_at, "
			+ "pay_state,pay_approval_state, "
			+ "order_id,payment_method,paymentkey"
			+ " FROM banner_apply_form where order_id=#{orderId}")
	public BannerApplyFormBean getBannerPaymentInfo(String orderId);
	
	
	
	
	//0216 
	//처음으로 결제한 날짜 받기 
	@Select("SELECT requested_at "
			+ "FROM (SELECT requested_at FROM banner_apply_form where state IS NOT NULL ORDER BY banner_apply_form_id asc)\r\n"
			+ "WHERE ROWNUM = 1")
	public String getFirstPayDate();
	
	/*
	//관리자 - 배너 결제 정보 가져오기 
	@Select("<script>" +
	        "SELECT b.banner_apply_form_id, b.payment, " +
	        "TO_CHAR(b.requested_at, 'YYYY-MM-DD HH24:MI:SS') as requested_at, " +
	        "TO_CHAR(b.approved_at, 'YYYY-MM-DD HH24:MI:SS') as approved_at, " +
	        "b.state, b.pay_state, b.pay_approval_state, b.order_id, b.payment_method, b.paymentkey, u.name, b.banner_type " +
	        "FROM banner_apply_form b " +
	        "INNER JOIN user_table u ON b.apply_person_id = u.user_id " +
	        "WHERE b.state IS NOT NULL " +
	        "<if test='startDate != null and startDate != \"\" and endDate != null and endDate != \"\"'> " +
	        "AND b.requested_at BETWEEN #{startDate} AND #{endDate} </if> " +
	        "<if test='payment_method != null and payment_method != \"\"'> AND b.payment_method = #{payment_method} </if> " +
	        "<if test='user_name != null and user_name != \"\"'> AND u.name LIKE '%' || #{user_name} || '%' </if> " +
	        "<if test='banner_type != null'> AND b.banner_type = #{banner_type} </if> " +
	        "ORDER BY b.banner_apply_form_id DESC" +
	        "</script>")
	public List<BannerApplyFormBean> getBannerPaymentInfoList(@Param("startDate") String startDate, 
	                                                         @Param("endDate") String endDate, 
	                                                         @Param("payment_method") String payment_method,  
	                                                         @Param("user_name") String user_name,
	                                                         @Param("banner_type") int banner_type);

	
		*/
	/*
	@Select(
	        "SELECT b.banner_apply_form_id, b.payment, " +
	        "TO_CHAR(b.requested_at, 'YYYY-MM-DD HH24:MI:SS') as requested_at, " +
	        "TO_CHAR(b.approved_at, 'YYYY-MM-DD HH24:MI:SS') as approved_at, " +
	        "b.state, b.pay_state, b.pay_approval_state, b.order_id, b.payment_method, b.paymentkey, u.name, b.banner_type " +
	        "FROM banner_apply_form b " +
	        "INNER JOIN user_table u ON b.apply_person_id = u.user_id " +
	        "WHERE b.state IS NOT NULL " +
	       
	        "ORDER BY b.banner_apply_form_id DESC" )
	public List<BannerApplyFormBean> getBannerPaymentInfoList();
	*/
	@Select("<script>" +
	        "SELECT b.banner_apply_form_id, b.payment, " +
	        "TO_CHAR(b.requested_at, 'YYYY-MM-DD HH24:MI:SS') as requested_at, " +
	        "TO_CHAR(b.approved_at, 'YYYY-MM-DD HH24:MI:SS') as approved_at, " +
	        "b.state, b.pay_state, b.pay_approval_state, b.order_id, b.payment_method, b.paymentkey, u.name, b.banner_type " +
	        "FROM banner_apply_form b " +
	        "INNER JOIN user_table u ON b.apply_person_id = u.user_id " +
	        "WHERE b.state IS NOT NULL " +
	        "<if test='startDate != null and endDate != null'>" +
	        "AND b.requested_at BETWEEN #{startDate} AND #{endDate} </if> " +
	        "<if test='payment_method != null'>AND b.payment_method = #{payment_method}</if> " +
	        "<if test='banner_type != null '>AND b.banner_type = 2</if> " +
	        "<if test='user_name != null'>AND u.name = #{user_name}</if> " +
	        "ORDER BY b.banner_apply_form_id DESC" +
	        "</script>")
	public List<BannerApplyFormBean> getBannerPaymentInfoList(@Param("startDate") String startDate, 
	                                                          @Param("endDate") String endDate, 
	                                                          @Param("payment_method") String paymentMethod, 
	                                                          @Param("banner_type") Integer bannerType, 
	                                                          @Param("user_name") String userName);


	//관리자 취소
	@Update("update banner_apply_form set state=3 where banner_apply_form_id=#{banner_apply_form_id}")
	public void getCancelBanner(int banner_apply_form_id );
   
	

	
	
}
