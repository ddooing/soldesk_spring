package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.UserService;

@Controller
public class PaymentController {

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
    private ExhibitionService exhibitionService;
	
	@Autowired
	private UserService UserService;
	
	@PostMapping("/exhibition/point_use")		// 포인트 사용 메서드 아직 사용안함 수정예정
	public String point_use(@RequestParam("current_point") int current_point, @RequestParam("use_point") int use_point, @RequestParam("exhibition_idx") int exhibition_idx, @ModelAttribute("ReserveBean") ReserveBean ReserveBean ,Model model) {
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_idx);
		model.addAttribute("exhibitionBean",exhibitionBean);
		
		model.addAttribute("ReserveBean",ReserveBean);
		
		boolean point_possible = reserveService.point_use(current_point, use_point);
		
		String impossible = "보유한 포인트를 초과하여 사용하려고 합니다. 현재 보유한 포인트는 " + current_point + "입니다.";
		
		if (point_possible == true) {
			return "exhibition/payment";
		} else {
			model.addAttribute("impossible",impossible);
			return "exhibition/payment";
		}
	}
	
	
	@PostMapping("/exhibition/reserve")
	public String reserve_ing(@ModelAttribute("ReserveBean") ReserveBean reserveBean, Model model) {
		System.out.println(reserveBean.getTicket_count());
		// 전시회 테이블에 cnt 값 예매 수만큼 증가
		reserveService.reserveAfterExhibitionCntIncrease(reserveBean.getTicket_count(), reserveBean.getExhibition_idx());
		
		int cash_use = (reserveBean.getTotal_price() - reserveBean.getPoint_use());
		
		reserveBean.setCash_use(cash_use);
		
		reserveService.reserve_ing(reserveBean);
		
		ExhibitionBean ExhibitionBean = exhibitionService.getExhibitionDetailInfo(reserveBean.getExhibition_idx());
		UserBean loginUserDetailBean = UserService.getLoginUserAllInfo(reserveBean.getUser_idx());
		
		model.addAttribute("loginUserDetailBean",loginUserDetailBean);
		
		model.addAttribute("ExhibitionBean", ExhibitionBean);
		
		model.addAttribute("reserveBean", reserveBean);
		
		return "exhibition/payment_complete";
	}
}
