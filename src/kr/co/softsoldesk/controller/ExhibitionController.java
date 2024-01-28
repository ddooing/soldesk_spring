package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.ReserveService;

@Controller
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	@Autowired
    private ExhibitionService exhibitionService;
	
	@Autowired
	private ReserveService reserveService;
	
	@GetMapping("/exhibition")
	public String exhibition(Model model) {
		
		List<ExhibitionBean> exhibition = exhibitionService.getExhibitionInfo();
		
        model.addAttribute("getExhibitionInfo", exhibition);
		
		return "exhibition/exhibition";
	}
	
	
	@GetMapping("/exhibition_click")
	public String exhibition_detail(@RequestParam("exhibition_idx") int exhibition_idx, @ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, Model model) {
	    ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_idx);
	    model.addAttribute("exhibitionBean", exhibitionBean);
	    
	    return "exhibition/exhibition_click";
	}
	
	
	@PostMapping("/payment")
	public String exhibition_reserve(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, @RequestParam("exhibition_idx") int exhibition_idx, Model model) {
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_idx);	
	    model.addAttribute("exhibitionBean", exhibitionBean);		// 전시회 정보 객체
		
		ReserveBean ReserveBean = reserveService.reservebtn_click(tempReserveBean);
		model.addAttribute("ReserveBean",ReserveBean);				// 전시회 상세조회 페이지에서 선택한 티켓수와 날짜 객체에 담아서 payment로 보낼 객체
		
		return "exhibition/payment";
	}
	

	

}
