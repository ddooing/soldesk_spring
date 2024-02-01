package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.mapper.PointDetailMapper;

@Repository
public class PointDetailDao {

	@Autowired
	private PointDetailMapper pointdetailmapper;
	
	public void PointList(PointDetailBean pointdetailBean) {
		pointdetailmapper.PointList(pointdetailBean);
		
	}
}
