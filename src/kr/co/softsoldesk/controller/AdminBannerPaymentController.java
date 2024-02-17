package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Service.BannerService;
@Controller
@RequestMapping("/adminPayment")
public class AdminBannerPaymentController {
	

	@Autowired
	private BannerService bannerSerivce;
	
	@GetMapping("/manager_bannerPaymentList")
	public String manager_bannerPaymentList(Model model,
			@RequestParam(value = "startDate", required = false) String startDate,
		    @RequestParam(value = "endDate", required = false) String endDate,
		    @RequestParam(value = "payment_method", required = false) String payment_method,
		    @RequestParam(value = "banner_type", required = false) Integer banner_type,
		    @RequestParam(value = "user", required = false) String user_name
		    , @RequestParam(value = "page", defaultValue = "1") int page) {
		
		System.out.println("endDate : "+endDate);
		System.out.println("startDate : "+startDate);
		System.out.println("payment_method : "+payment_method);
		System.out.println("banner_type : "+banner_type);
		System.out.println("user_name : "+user_name);
		
		//첫 결제 내역 날짜 받기
		String firstPayDate = bannerSerivce.getFirstPayDate();
		System.out.println("firstPayDate : "+firstPayDate);
		model.addAttribute("firstPayDate", firstPayDate);
		
		
		if(endDate !=null)
		{
			endDate = endDate +" 23:59:59";
		}
		if(banner_type == null)
		{
			System.out.println("타입 null");
			banner_type=3;
		}
		
	    List<BannerApplyFormBean> bannerApplyFormBean = bannerSerivce.getBannerPaymentInfoList(startDate, endDate, payment_method,banner_type, user_name,page );
	 // 리스트 개수 가져오기
 		PageBean pageBean = bannerSerivce.getBannerPaymentInfoListCnt(startDate, endDate, payment_method,banner_type, user_name,page );
 		model.addAttribute("pageBean", pageBean);
	    

		model.addAttribute("bannerApplyFormBean", bannerApplyFormBean);
		return "adminPayment/manager_bannerPaymentList";
	}
	
	
	
	@GetMapping("/bannerPayment_cancel")
	public String bannerPayment_cancel(Model model,@RequestParam("banner_form_id") int banner_apply_form_id,RedirectAttributes redirectAttributes ) {

		//취소 처리하기

		//pay 상태 변경 
		bannerSerivce.getCancelBanner(banner_apply_form_id);
		

		redirectAttributes.addFlashAttribute("canceled", true);
		
		
		return "redirect:/adminPayment/bannerPayment_cancel";
	}
	
	
	
}
