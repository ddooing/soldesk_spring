package kr.co.softsoldesk.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.dao.PointDetailDao;

@Service
public class PointDetailService {

	@Autowired
	private PointDetailDao pointDetailDao;
	
	public void PointList (PointDetailBean pointDetailBean) {
		pointDetailDao.PointList(pointDetailBean);
	}
	
}
