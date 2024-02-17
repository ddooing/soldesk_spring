package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Service.PointDetailService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.ReviewService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/adminPayment")
public class AdminReserveController {
	
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private PointDetailService pointDetailService;
	
	@GetMapping("/manager_reservelist")
	public String exhibition(Model model,
			@RequestParam(value = "startDate", required = false) String startDate,
		    @RequestParam(value = "endDate", required = false) String endDate,
		    @RequestParam(value = "payment_method", required = false) String payment_method,
		    @RequestParam(value = "exhibition_title", required = false) String exhibition_title,
		    @RequestParam(value = "user_name", required = false) String user_name
		    , @RequestParam(value = "page", defaultValue = "1") int page) {
		
		System.out.println("endDate : "+endDate);
		System.out.println("startDate : "+startDate);
		System.out.println("payment_method : "+payment_method);
		System.out.println("exhibition_title : "+exhibition_title);
		System.out.println("user_name : "+user_name);
		
		//첫 결제 내역 날짜 받기
		String firstPayDate = reserveService.getFirstPayDate();
		model.addAttribute("firstPayDate", firstPayDate);
		
		
		if(endDate !=null)
		{
			endDate = endDate +" 23:59:59";
		}
		//리스트 가져오고 
		List<ReserveBean> reserveBean = reserveService.getReserveList(startDate,endDate,payment_method,exhibition_title,user_name,page);
		model.addAttribute("reserveBean", reserveBean);
		// 리스트 개수 가져오기
		PageBean pageBean = reserveService.getReserveListCnt(startDate, endDate, payment_method, exhibition_title, user_name, page);
		model.addAttribute("pageBean", pageBean);
		
		
		return "adminPayment/manager_reservelist";
	}
	//0216
	@GetMapping("/reserve_cancel")
	public String reserve_cancel(Model model,@RequestParam("reserve_id") int reserve_id,RedirectAttributes redirectAttributes ) {

		//취소 처리하기
		// user_id , point_deduction ,point_plus  
		ReserveBean reserveBean = reserveService.getCancelList(reserve_id);  
		
		//1. 포인트 회수  관리자이기때문에 회수하기 
		int pointMinus = reserveBean.getPoint_plus()-reserveBean.getPoint_deduction();
		userService.getPointMinus(pointMinus,reserveBean.getUser_id());
		PointDetailBean pointDetailBean =new PointDetailBean(); 
        pointDetailBean.setPoint(pointMinus);
        pointDetailBean.setUser_id(reserveBean.getUser_id());
        pointDetailBean.setPoint_state_code(2);	// 포인트 2:-
        pointDetailBean.setPoint_type_code(4);	// 예매 취소
        
        
		// 포인트 이용 내역 추가
		pointDetailService.PointList(pointDetailBean);
		//3. 소감문 회수 
		reviewService.getReviewDelete(reserve_id);
		
		//4. pay 상태 변경 
		reserveService.updatePaymentCancle(reserve_id);
		

		redirectAttributes.addFlashAttribute("canceled", true);
		
		
		return "redirect:/adminPayment/manager_reservelist";
	}
}
