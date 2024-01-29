package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;

public interface ReserveMapper {

	/*
	@Insert("INSERT INTO reserve (reserve_idx, user_idx, exhibition_idx, reserve_date, total_price, point_use, cash_use, ticket_count, regdate) VALUES (reserve_idx_seq.NEXTVAL, #{loginUserBean.user_idx}, #{exhibitioninfoBean.exhibition_idx},  #{reserveBean.reserve_date}, #{reserveBean.total_price}, #{reserveBean.point_use}, #{reserveBean.cash_use}, #{reserveBean.ticket_count}, SYSDATE)")
	ReserveBean reserveTicket(@Param("reserveBean") ReserveBean tempReserveBean, @Param("loginUserBean") UserBean loginUserBean, @Param("exhibitioninfoBean") ExhibitionBean exhibitioninfoBean);
	*/
	
	@Insert("INSERT INTO reserve (reserve_idx, user_idx, exhibition_idx, reserve_date, total_price, point_use, cash_use, ticket_count, reserve_time, state) " +
	        "VALUES (reserve_idx_seq.NEXTVAL, #{user_idx}, #{exhibition_idx}, #{reserve_date, jdbcType=DATE}, #{total_price}, #{point_use}, #{cash_use}, #{ticket_count}, sysdate, 1)")
	void reserve_ing(ReserveBean ReserveBean);
	
}
