package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;

import kr.co.softsoldesk.Beans.PointDetailBean;

public interface PointDetailMapper {

	// 포인트 내역 찍힘
	@Insert("INSERT INTO point_detail (point_id, user_id, point, point_state_code, regdate) values (point_detail_seq.nextval, #{user_id}, #{point}, #{point_state_code}, sysdate)")
	void PointList(PointDetailBean pointdetailBean);
}
