package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.ReviewBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.ReviewService;
import kr.co.softsoldesk.Service.UserService;

@Controller
public class PaymentController {

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
    private ExhibitionService exhibitionService;
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private ReviewService reviewService;
	
	
	@PostMapping("/exhibition/reserve")
	public String reserve_ing(@ModelAttribute("ReserveBean") ReserveBean reserveBean, Model model) {
		
		// 전시회 테이블에 cnt 값 예매 수만큼 증가
		reserveService.reserveAfterExhibitionCntIncrease(reserveBean.getTicket_count(), reserveBean.getExhibition_id());
		
		int payment = (reserveBean.getTotal_price() - reserveBean.getPoint_deduction());	// 
		
		reserveBean.setPayment(payment);
		// 예약 열 추가
		reserveService.reserve_ing(reserveBean);
		
		ExhibitionBean ExhibitionBean = exhibitionService.getExhibitionDetailInfo(reserveBean.getExhibition_id());
		UserBean loginUserDetailBean = UserService.getLoginUserAllInfo(reserveBean.getUser_id());
		
		// 로그인 된 유저 객체
		model.addAttribute("loginUserDetailBean",loginUserDetailBean);
		
		// 전시회 정보 객체
		model.addAttribute("ExhibitionBean", ExhibitionBean);
		
		//예약 객체
		model.addAttribute("reserveBean", reserveBean);
		
		// 소감문 생성을 위한 reserveBean객체 postid값 가져옴
		ReserveBean r1 = reserveService.getReserve_idForMakeReview(reserveBean.getOrder_id());
		
		int reserrved_id = r1.getReserve_id();
		
		// 소감문 생성
		reviewService.reserve_review_create(reserrved_id);
		
		
		return "exhibition/payment_complete";
	}

}
