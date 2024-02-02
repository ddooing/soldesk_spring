package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	@Autowired
    private ExhibitionService exhibitionService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private UserService UserService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("/exhibition")
	public String exhibition(Model model) {
		
		List<ExhibitionBean> exhibition = exhibitionService.getPopularExhibitionInfo();
	
        model.addAttribute("getPopularExhibitionInfo", exhibition);
        
		
		return "exhibition/exhibition";
	}
	
	
	@GetMapping("/exhibition_click")
	public String exhibition_detail(@RequestParam("exhibition_id") int exhibition_id, @ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, Model model) {
	    
		exhibitionService.increaseViewsExhibition(exhibition_id);
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_id);
	    model.addAttribute("exhibitionBean", exhibitionBean);
	    
	    return "exhibition/exhibition_click";
	}
	
	
	@PostMapping("/payment")
	public String exhibition_reserve(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, 
			@RequestParam("exhibition_id") int exhibition_id, Model model) {
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_id);	
	    model.addAttribute("exhibitionBean", exhibitionBean);		// 전시회 정보 객체
		
		//ReserveBean ReserveBean = reserveService.reservebtn_click(tempReserveBean);//  포인트 사용 저장하기 때문에 주석
		model.addAttribute("tempReserveBean",tempReserveBean);// 전시회 상세조회 페이지에서 선택한 티켓수와 날짜 객체에 담아서 payment로 보낼 객체
		
		UserBean LoginAllInfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("LoginAllInfoBean",LoginAllInfoBean);
		
		
		System.out.println("exhibition_id : "+exhibitionBean.getExhibition_id());
		System.out.println("tempReserveBean 티켓 : "+tempReserveBean.getTicket_count());
		System.out.println("tempReserveBean 티켓 : "+tempReserveBean.getReserve_date());
		return "exhibition/payment";
	}
	

	

}
