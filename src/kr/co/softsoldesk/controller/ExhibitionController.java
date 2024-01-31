package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
>>>>>>> ef4afa8659c23aa2dc46115798ad0aa1fdd4ebbc
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
	
<<<<<<< HEAD
	@GetMapping("/payment")
	public String payment() {
		return "exhibition/payment";
	}
	
	@PostMapping("/payment_pro")
	public String payment_pro() {
		return "exhibition/payment_pro";
	}
=======
	
	@PostMapping("/payment")
	public String exhibition_reserve(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, @RequestParam("exhibition_id") int exhibition_id, Model model) {
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_id);	
	    model.addAttribute("exhibitionBean", exhibitionBean);		// 전시회 정보 객체
		
		ReserveBean ReserveBean = reserveService.reservebtn_click(tempReserveBean);
		model.addAttribute("ReserveBean",ReserveBean);				// 전시회 상세조회 페이지에서 선택한 티켓수와 날짜 객체에 담아서 payment로 보낼 객체
		
		UserBean LoginAllInfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("LoginAllInfoBean",LoginAllInfoBean);
		
		return "exhibition/payment";
	}
	

	

>>>>>>> ef4afa8659c23aa2dc46115798ad0aa1fdd4ebbc
}
