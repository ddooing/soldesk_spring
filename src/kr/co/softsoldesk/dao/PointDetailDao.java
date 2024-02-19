package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.mapper.PointDetailMapper;

@Repository
public class PointDetailDao {

	@Autowired
	private PointDetailMapper pointdetailmapper;
	
	// 적립 or 사용 메소드
	public void PointList(PointDetailBean pointdetailBean) {
		pointdetailmapper.PointList(pointdetailBean);
		
	}
	
	// 마이페이지 포인트 리스트 불러올때 사용 
	public List<PointDetailBean> GetMypagePointList(int user_id,  RowBounds rowBounds) {
		return pointdetailmapper.GetMypagePointList(user_id, rowBounds);
	}
	
	// 페이징 처리
	public int getPointDetailCnt(int user_id) {
		return pointdetailmapper.getPointDetailCnt(user_id);
	}
}
