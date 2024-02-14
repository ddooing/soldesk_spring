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

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminService;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/banner")
public class BannerApplyController {

	@Autowired
	private AdminService AdminService;
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private ExhibitionService ExhibitionService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	
	// 인덱스 -> 배너 등록 페이지 매핑
	@GetMapping("/bannerapply")
	public String bannerapply() {
		return "/admin/bannerapply";
	}
	
	
	// 배너 견적 신청
	@GetMapping("/mainbannerapplyform")
	public String mainbannerapplyform(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = AdminService.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/banner/mainbannerapplyform";
	}
	
	// 서브 배너 매핑
	@GetMapping("/subbannerapplyform")
	public String estimate2(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = AdminService.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/admin/subbannerapplyform";
	}
	
	
		// 메인 배너 신청 폼 제출
	@PostMapping("/mainbannerapplyform_pro")
	public String mainbannerapplyform_pro(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// 파일저장 및 banner_file_id set
		if(applybannerBean.getBanner_file().getSize()>0) {
			AdminService.addfiletableBannerBannerApplyFormBean(applybannerBean);
		} 
		
		// 상태 1 로 등록대기 상태 set
		applybannerBean.setState(1);
		// banner_type(메인배너1) set
		applybannerBean.setBanner_type(1);
		
		// 배너신청폼 테이블 insert
		AdminService.insertbanner_apply_form(applybannerBean);
		
		
		// index 필요한 것들
		// 메인 캐러셀
		List<MainBannerBean> AllMainBannerInfo = AdminService.IndexMainBannerBeanList();
		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
				
		// 인기 전시 캐러셀
		List<ExhibitionBean> popularExhibitionInfo = ExhibitionService.getIndexPagePopularExhibitionInfo();
		model.addAttribute("popularExhibitionInfo", popularExhibitionInfo);
				
		// 곧전시 캐러셀
		List<ExhibitionBean> SoonExhibitionInfo = ExhibitionService.getIndexPageSoonExhibitionInfo();
		model.addAttribute("SoonExhibitionInfo", SoonExhibitionInfo);
		
		return "/banner/index"; /// 수정 
	}
	
	
	
	// 서브 배너 신청 폼 제출
	@PostMapping("/subbannerapplyform_pro")
	public String subbannerapplyform_pro(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
				
		// 파일저장 및 banner_file_id set
		if(applybannerBean.getBanner_file().getSize()>0) {
			AdminService.addfiletableBannerSubBannerApplyFormBean(applybannerBean);
		} 
				
		// 상태 1 로 등록대기 상태 set
		applybannerBean.setState(1);
		// banner_type(서브배너2) set
		applybannerBean.setBanner_type(2);
				
		// 배너신청폼 테이블 insert
		AdminService.insertbanner_apply_form(applybannerBean);
				
		// index 필요한 것들
		// 메인 캐러셀
		List<MainBannerBean> AllMainBannerInfo = AdminService.IndexMainBannerBeanList();
		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
						
		// 인기 전시 캐러셀
		List<ExhibitionBean> popularExhibitionInfo = ExhibitionService.getIndexPagePopularExhibitionInfo();
		model.addAttribute("popularExhibitionInfo", popularExhibitionInfo);
						
		// 곧전시 캐러셀
		List<ExhibitionBean> SoonExhibitionInfo = ExhibitionService.getIndexPageSoonExhibitionInfo();
		model.addAttribute("SoonExhibitionInfo", SoonExhibitionInfo);
				
		return "/view/index";
	}
		
}
