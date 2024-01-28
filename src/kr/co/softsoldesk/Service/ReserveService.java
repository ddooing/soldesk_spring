package kr.co.softsoldesk.Service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.ReserveDao;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao reserveDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	public ReserveBean reserveTicket(ReserveBean tempReserveBean, UserBean loginUserBean, ExhibitionBean exhibitioninfoBean) {
		
		return reserveDao.reserveTicket(tempReserveBean, loginUserBean, exhibitioninfoBean);
	}
	
	public ReserveBean reservebtn_click(ReserveBean tempReserveBean) {
		
		 return tempReserveBean;
	}
}
