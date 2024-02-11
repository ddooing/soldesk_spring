package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Service.AdminService;
import kr.co.softsoldesk.Service.ExhibitionService;


//Mapper->DAO->service->controller

@Controller
@RequestMapping("/view")
public class MainController {
	
	@Autowired
	private AdminService AdminService;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	@GetMapping("/index")
	public String index(Model model) {

		// 메인 캐러셀
		List<MainBannerBean> AllMainBannerInfo = AdminService.IndexMainBannerBeanList();
		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
		
		// 인기 전시 캐러셀
		List<ExhibitionBean> popularExhibitionInfo = exhibitionService.getIndexPagePopularExhibitionInfo();
		model.addAttribute("popularExhibitionInfo", popularExhibitionInfo);
		
		// 곧전시 캐러셀
		List<ExhibitionBean> SoonExhibitionInfo = exhibitionService.getIndexPageSoonExhibitionInfo();
		model.addAttribute("SoonExhibitionInfo", SoonExhibitionInfo);
		
		return "view/index";
	}
	
	
}
