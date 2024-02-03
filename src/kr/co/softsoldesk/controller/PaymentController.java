package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.softsoldesk.Beans.ReserveBean;
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
	/*
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
		reserveService.reserveAfterExhibitionCntIncrease(reserveBean.getTicket_count(), reserveBean.getExhibition_id());
		
		// 실제 결제 금액 = 총 티켓 가격 - 포인트 사용
		int payment = (reserveBean.getTotal_price() - reserveBean.getPoint_deduction());	// 
		
		// bean의 payment(결제 금액) 에 set 
		reserveBean.setPayment(payment); 
		
		reserveService.reserve_ing(reserveBean);
		
		ExhibitionBean ExhibitionBean = exhibitionService.getExhibitionDetailInfo(reserveBean.getExhibition_id());
		UserBean loginUserDetailBean = UserService.getLoginUserAllInfo(reserveBean.getUser_id());
		
		model.addAttribute("loginUserDetailBean",loginUserDetailBean);
		
		model.addAttribute("ExhibitionBean", ExhibitionBean);
		
		model.addAttribute("reserveBean", reserveBean);
		
		return "exhibition/payment_complete";
	}
	
	*/
	@GetMapping("/exhibition/payment_complete")
	public String showPaymentComplete(@ModelAttribute("ReserveBean") ReserveBean checkReserveBean,
	                                  @ModelAttribute("exhibition_id") int exhibitionId,
	                                  Model model) {
	    // 데이터 출력
	    System.out.println("ReserveBean: " + checkReserveBean);
	    System.out.println("Exhibition ID: " + exhibitionId);

	    // 뷰에 데이터 추가
	    model.addAttribute("ReserveBean", checkReserveBean);
	    model.addAttribute("exhibition_id", exhibitionId);

	    return "exhibition/payment_complete";
	}
	@GetMapping("/exhibition/test_payment_complete")
	public String testshowPaymentComplete() {
		return "exhibition/test_payment_complete";
	}
	
}
