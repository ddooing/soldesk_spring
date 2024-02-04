package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.PointDetailBean;

public interface PointDetailMapper {

	// 포인트 내역 찍힘 // 날짜 sys
	@Insert("INSERT INTO point_detail (point_id, user_id, point, point_state_code, point_type_code ,regdate) values (point_id_seq.nextval, #{user_id}, #{point}, #{point_state_code}, #{point_type_code}, sysdate)")
	void PointList(PointDetailBean pointdetailBean);
	
	@Select("select point_id, user_id, point, point_state_code, point_type_code, TO_CHAR(regdate, 'yyyy-mm-dd') as regdate from point_detail where user_id = #{user_id}")
	List<PointDetailBean> GetMypagePointList(int user_id,  RowBounds rowBounds);
	
}
