package kr.co.softsoldesk.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.dao.PointDetailDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class PointDetailService {

	@Autowired
	private PointDetailDao pointDetailDao;
	
	@Value("${Mypagepoint.listcnt}")
	private int point_listcnt;
	
	@Value("${Mypagepoint.paginationcnt}")
	private int point_paginationcnt;
	
	// 포인트 적립 or 사용 메소드
	public void PointList (PointDetailBean pointDetailBean) {
		pointDetailDao.PointList(pointDetailBean);
	}
	
	//마이페이지 포인트 리스트 불러올때 사용
	public List<PointDetailBean> GetMypagePointList(int user_id, int page) {
		
		int start = (page - 1) * point_listcnt;
		
		RowBounds rowBounds = new RowBounds(start, point_listcnt);
		
		return pointDetailDao.GetMypagePointList(user_id,rowBounds);
	}
	
	// 페이징처리
	public PageBean getPointDetailCnt(int user_id, int currentPage) {
		
		int point_cnt = pointDetailDao.getPointDetailCnt(user_id);
		
		PageBean pageBean = new PageBean(point_cnt, currentPage, point_listcnt, point_paginationcnt);
		
		return pageBean;
	}
	
}
