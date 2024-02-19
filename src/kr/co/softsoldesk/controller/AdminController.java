package kr.co.softsoldesk.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminService;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private ExhibitionService ExhibitionService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	// 재호 부분
	
	
	
	// ====================================== 예매 관리 ================================
	@GetMapping("/manager_reservelist")
	public String manager_reservelist() {
	      
	   return "admin/manager_reservelist";
	}

	
	// ============================== 관리자 페이지 배너관리 ================================
	// 메인 배너 관리 관리자 페이지
	@GetMapping("/manager_mainbannershowlist")
	public String manager_mainbannershowlist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 메인 배너 모든 정보 가져가기
			List<MainBannerBean> AllMainBannerInfo = adminService.getAllShowMainbannerInfo();
			model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
			
			// 메인 배너 뱃지 관련
			MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
			
			return "/admin/manager_mainbannershowlist";
		}
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 메인 배너 제목 검색 모든 정보 가져가기
			List<MainBannerBean> TitleSearchBannerInfo = adminService.titleSearchMainbannerInfo(bannersearch);
			model.addAttribute("AllMainBannerInfo",TitleSearchBannerInfo);
			
			// 메인 배너 제목 검색 뱃지 관련
			MainBannerBean TitleSearchBadgeCnt = adminService.getTitleSearchMainBannerBadgeCnt(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
		}
		
		
		return "/admin/manager_mainbannershowlist";
	}
	
	// 배너 순서 변경 (드래그앤 드롭)
	@PostMapping("/saveRowOrder")	
	public ResponseEntity<?> saveRowOrder(@RequestParam("order") String order) {
	    String[] ids = order.split(",");
	    adminService.updateExposeOrder(ids);
	    return ResponseEntity.ok("Row order saved");
	}
	
	// 메인 배너 수정 페이지 매핑
	@GetMapping("/manager_mainbannermodify")
	public String manager_mainbannermodify(@RequestParam("main_banner_id") int main_banner_id, Model model) {
		
		// 메인 배너 한개 모든 정보 가져오기
		MainBannerBean getOneMainBannerInfo = adminService.getOneMainBannerInfo(main_banner_id);
		model.addAttribute("getOneMainBannerInfoBean",getOneMainBannerInfo);
		
		// 메인 배너 뱃지 관련
		MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
		model.addAttribute("BadgeCnt", BadgeCnt);
		
		return "admin/manager_mainbannermodify";
	}
	
	// 메인 배너 삭제
	@GetMapping("/DeleteMainBanner")
	public String DeleteMainBanner(@RequestParam("main_banner_id") int main_banner_id, @RequestParam("expose_order") int expose_order ,@RequestParam("state") int state, Model model) {

		// 배너 삭제
		adminService.DeleteMainBanner(main_banner_id);
		
		// 노출 순서 높은것들 노출순서 낮추기 state 가 1일때만
		if(state == 1) {
			adminService.UpdateDeleteAndExpose_order(expose_order);
		}


		// 메인 배너 모든 정보 가져가기
		List<MainBannerBean> AllMainBannerInfo = adminService.getAllShowMainbannerInfo();
		model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
					
		// 메인 배너 뱃지 관련
		MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
		model.addAttribute("BadgeCnt", BadgeCnt);
					
		return "/admin/manager_mainbannershowlist";
	}
	
	// 숨김 만 보이는 메인 배너 관리 페이지
	@GetMapping("/manager_mainbannerhidelist")
	public String manager_mainbannerhidelist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 메인 배너 모든 정보 가져가기 state 2 (숨김)
			List<MainBannerBean> AllMainBannerInfo = adminService.getAllHideMainbannerInfo();
			model.addAttribute("AllMainBannerInfo", AllMainBannerInfo);
			
			// 메인 배너 뱃지 관련
			MainBannerBean BadgeCnt = adminService.getMainBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			return "/admin/manager_mainbannerhidelist";
		}

		return "/admin/manager_mainbannerhidelist";
	}
	
	// 메인 배너 수정 페이지 업데이트수행
	@PostMapping("/manager_mainbannermodify_pro")
	public String manager_mainbannerUpdate(@ModelAttribute("getOneMainBannerInfoBean") MainBannerBean mainBannerBean ,Model model) {
		
		// state 값 비교해서 expose_order 값 재정렬
		int originalState = adminService.getMainBannerState(mainBannerBean.getMain_banner_id());
				
		// 파일 변경시 파일 변경
		if(mainBannerBean.getMain_banner_file().getSize()>0) {
			adminService.addfiletableBanner(mainBannerBean);
		}
		
		
		// expose_order 값 재정렬
	    if (originalState != mainBannerBean.getState()) {
	        if (mainBannerBean.getState() == 1) { // 숨김에서 노출로 변경
	        	int maxExposeOrder = adminService.getMaxExposeOrder() + 1;
	            mainBannerBean.setExpose_order(maxExposeOrder);
	        } else if (originalState == 1 && mainBannerBean.getState() == 2) { // 노출에서 숨김으로 변경
	        	adminService.UpdateExpose_order(mainBannerBean.getExpose_order());
	            mainBannerBean.setExpose_order(0);
	        }
	    }
	    
	    // 업데이트
	    adminService.UpdateMainBanner(mainBannerBean);
		
		return "redirect:/admin/manager_mainbannershowlist";
	}
	
	// 메인 배너 추가
	@GetMapping("/manager_mainbanneradd")
	public String manager_mainbanneradd(@ModelAttribute("AddBannerBean") MainBannerBean AddBannerBean, Model model) {
		
		//모든 전시회 콤보박스 활용 가져가기
		List<ExhibitionBean> exhibitiontitleAndid = ExhibitionService.getexhibitionallTitle();
		model.addAttribute("exhibitiontitleAndid",exhibitiontitleAndid);
		
		return "/admin/manager_mainbanneradd";
	}
	
	// 메인 배너 관리자 직접 추가
	@PostMapping("/manager_mainbanneradd_pro")
	public String manager_mainbanneradd_pro(@ModelAttribute("AddBannerBean") MainBannerBean AddBannerBean, Model model) {
		
		// 파일 저장
		if(AddBannerBean.getMain_banner_file().getSize()>0) {
			adminService.addfiletableBanner(AddBannerBean);
		}
		
		// expose_order 최대값으로 set해주기
		int maxExposeOrder = adminService.getMaxExposeOrder() + 1;
		AddBannerBean.setExpose_order(maxExposeOrder);
		
		// 메인 배너 main_banner 테이블 추가
		adminService.AddmanagerMainBanner(AddBannerBean);
		
		return "redirect:/admin/manager_mainbannershowlist";
	}
	
	
	// 배너 견적 신청
	@GetMapping("/mainbannerapplyform")
	public String mainbannerapplyform(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = adminService.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/admin/mainbannerapplyform";
	}
	
	// 메인 배너 신청 폼 제출
	@PostMapping("/mainbannerapplyform_pro")
	public String mainbannerapplyform_pro(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// 파일저장 및 banner_file_id set
		if(applybannerBean.getBanner_file().getSize()>0) {
			adminService.addfiletableBannerBannerApplyFormBean(applybannerBean);
		} 
		
		// 상태 1 로 등록대기 상태 set
		applybannerBean.setState(1);
		// banner_type(메인배너1) set
		applybannerBean.setBanner_type(1);
		
		// 배너신청폼 테이블 insert
		adminService.insertbanner_apply_form(applybannerBean);
	
		
		return "redirect:/view/index";
	}
	
	// 서브 배너 매핑
	@GetMapping("/subbannerapplyform")
	public String estimate2(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
		
		// user 모든 정보 가져가기
		UserBean userinfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("userinfoBean",userinfoBean);
		
		// 해당 유저가 신청한 전시회 목록 가져가기
		List<ExhibitionBean> apply_personexhibitionlist = adminService.getApply_personExhibitionlist(loginUserBean.getUser_id());
		model.addAttribute("apply_personexhibitionlist",apply_personexhibitionlist);
		
		return "/admin/subbannerapplyform";
	}
	
	// 서브 배너 신청 폼 제출
	@PostMapping("/subbannerapplyform_pro")
	public String subbannerapplyform_pro(@ModelAttribute("applybannerBean") BannerApplyFormBean applybannerBean ,Model model) {
				
		// 파일저장 및 banner_file_id set
		if(applybannerBean.getBanner_file().getSize()>0) {
			adminService.addfiletableBannerSubBannerApplyFormBean(applybannerBean);
		} 
				
		// 상태 1 로 등록대기 상태 set
		applybannerBean.setState(1);
		// banner_type(서브배너2) set
		applybannerBean.setBanner_type(2);
				
		// 배너신청폼 테이블 insert
		adminService.insertbanner_apply_form(applybannerBean);
		
		return "redirect:/view/index";
	}
	
	// 인덱스 -> 배너 등록 페이지 매핑
	@GetMapping("/bannerapply")
	public String bannerapply() {
		return "/admin/bannerapply";
	}
	
	// 서브배너 showlist 매핑
	@GetMapping("/manager_subbannershowlist")
	public String manager_subbannershowlist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 서브 배너 모든 정보 가져가기
			List<SubBannerBean> AllSubBannerInfo = adminService.getAllShowSubbannerInfo();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			// 서브 배너 뱃지 관련
			SubBannerBean BadgeCnt = adminService.getSubBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
			
			return "/admin/manager_subbannershowlist";
		}
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 서브 배너 제목 검색 모든 정보 가져가기
			List<SubBannerBean> TitleSearchBannerInfo = adminService.titleSearchSubbannerInfo(bannersearch);
			model.addAttribute("AllSubBannerInfo",TitleSearchBannerInfo);
			
			// 서브 배너 제목 검색 뱃지 관련
			SubBannerBean TitleSearchBadgeCnt = adminService.getTitleSearchSubBannerBadgeCnt(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
			// 현재 날짜 반환
			model.addAttribute("now", new Date());
		}
		
		
		return "/admin/manager_subbannershowlist";
	}
		
	
	
	// 서브배너 hidelist 매핑
	@GetMapping("/manager_subbannerhidelist")
	public String manager_subbannerhidelist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 서브 배너 모든 정보 가져가기
			List<SubBannerBean> AllSubBannerInfo = adminService.getAllHideSubbannerInfo();
			model.addAttribute("AllSubBannerInfo", AllSubBannerInfo);
			
			// 서브 배너 뱃지 관련
			SubBannerBean BadgeCnt = adminService.getSubBannerBadgeCnt();
			model.addAttribute("BadgeCnt", BadgeCnt);
			
			return "/admin/manager_subbannerhidelist";
		}
	
		return "/admin/manager_subbannerhidelist";
	}
	
	// 서브 배너 삭제
	@GetMapping("/DeleteSubBanner")
	public String DeleteSubBanner(@RequestParam("sub_banner_id") int sub_banner_id, @RequestParam("expose_order") int expose_order ,@RequestParam("state") int state ,Model model) {

		// 배너 삭제
		adminService.DeleteSubBanner(sub_banner_id);
		
		// 노출 순서 높은것들 노출순서 낮추기
		if(state == 1) {
			adminService.UpdateDeleteAndExpose_orderSub(expose_order);			
		}
					
		return "redirect:/admin/manager_subbannershowlist";
	}		
	
	
	// 서브 배너 수정 페이지 매핑
	@GetMapping("/manager_subbannermodify")
	public String manager_subbannermodify(@RequestParam("sub_banner_id") int sub_banner_id, Model model) {
		
		// 서브 배너 한개 모든 정보 가져오기
		SubBannerBean getOneSubBannerInfo = adminService.getOneSubBannerInfo(sub_banner_id);
		model.addAttribute("getOneSubBannerInfoBean",getOneSubBannerInfo);
		
		// 서브 배너 뱃지 관련
		SubBannerBean BadgeCnt = adminService.getSubBannerBadgeCnt();
		model.addAttribute("BadgeCnt", BadgeCnt);
		
		return "admin/manager_subbannermodify";
	}			
	
	// 서브 배너 수정 페이지 업데이트수행
	@PostMapping("/manager_subbannermodify_pro")
	public String manager_subbannermodify_pro(@ModelAttribute("getOneSubBannerInfoBean") SubBannerBean subBannerBean ,Model model) {
		
		// state 값 비교해서 expose_order 값 재정렬
		int originalState = adminService.getSubBannerState(subBannerBean.getSub_banner_id());
		
		// 파일 변경시 파일 변경
		if(subBannerBean.getSub_banner_file().getSize()>0) {
			adminService.addfiletableBanner2(subBannerBean);
		}
		
		// expose_order 값 재정렬
	    if (originalState != subBannerBean.getState()) {
	        if (subBannerBean.getState() == 1) { // 숨김에서 노출로 변경
	        	int maxExposeOrder = adminService.getSubMaxExposeOrder() + 1;
	        	subBannerBean.setExpose_order(maxExposeOrder);
	        } else if (originalState == 1 && subBannerBean.getState() == 2) { // 노출에서 숨김으로 변경
	        	adminService.UpdateSubBannerExpose_order(subBannerBean.getExpose_order());
	            subBannerBean.setExpose_order(0);
	        }
	    }
	    
	    // 업데이트
	    adminService.UpdateSubBanner(subBannerBean);
				
		return "redirect:/admin/manager_subbannershowlist";
	}
	
	// 메인 배너 추가
	@GetMapping("/manager_subbanneradd")
	public String manager_subbanneradd(@ModelAttribute("AddBannerBean") SubBannerBean AddBannerBean, Model model) {
			
		//모든 전시회 콤보박스 활용 가져가기
		List<ExhibitionBean> exhibitiontitleAndid = ExhibitionService.getexhibitionallTitle();
		model.addAttribute("exhibitiontitleAndid",exhibitiontitleAndid);
			
		return "/admin/manager_subbanneradd";
	}
	
	@PostMapping("/manager_subbanneradd_pro")
	public String manager_subbanneradd_pro(@ModelAttribute("AddBannerBean") SubBannerBean AddBannerBean, Model model) {
		
		// 파일 저장
		if(AddBannerBean.getSub_banner_file().getSize()>0) {
			adminService.addfiletableBanner2(AddBannerBean);
		}
		
		// expose_order 최대값으로 set해주기
		int maxExposeOrder = adminService.getSubMaxExposeOrder() + 1;
		AddBannerBean.setExpose_order(maxExposeOrder);
					
		// 메인 배너 main_banner 테이블 추가
		adminService.AddmanagerSubBanner(AddBannerBean);
		
		return "redirect:/admin/manager_subbannershowlist";
	}
	
	
	// 서브 배너 드래그 앤 드롭 순서 변경 오류오류 수정 필요
		@PostMapping("/saveRowOrder1")	
		public ResponseEntity<?> saveRowOrder1(@RequestParam("order") String order) {
		    String[] ids = order.split(",");
		    adminService.updateSubExposeOrder(ids);
		    return ResponseEntity.ok("Row order saved");
		}
	
	// 관리자 페이지 메인 배너 신청 리스트 매핑
	@GetMapping("/manager_mainbannerapplylist")
	public String manager_bannerapplylist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
			
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 메인 배너 신청내역 리스트 가져가기
			List<BannerApplyFormBean> mainBannerApplylistBean = adminService.getAllApplyMainbanner(page);
			model.addAttribute("BannerApplylistBean", mainBannerApplylistBean);
			
			// 메인 배너 신청내역 뱃지 관련
			BannerApplyFormBean BadgeBean = adminService.getMainBannerBadge();
			model.addAttribute("BadgeCnt", BadgeBean);		
			
			// 메인 배너 페이징 처리
			PageBean pageBean = adminService.getAllApplyMainbannerCnt(page);
			model.addAttribute("pageBean", pageBean);
		}
		
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 메인 배너 제목 검색 모든 정보 가져가기
			List<BannerApplyFormBean> TitleSearchapplyMainBannerInfo = adminService.getMainBannerapplytitleSearch(bannersearch, page);
			model.addAttribute("BannerApplylistBean",TitleSearchapplyMainBannerInfo);
			
			// 메인 배너 제목 검색 뱃지 관련
			BannerApplyFormBean TitleSearchBadgeCnt = adminService.getMainBannerapplytitlesearchBadge(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			// 메인 배너 제목 검색 페이징 처리
			PageBean pageBean1 = adminService.getMainBannerapplytitleSearchCnt(bannersearch, page);
			model.addAttribute("pageBean1", pageBean1);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
		}
		
		
		
		return "/admin/manager_mainbannerapplylist";
	}
		
	// 관리자 페이지 서브 배너 신청 리스트 매핑
	@GetMapping("/manager_subbannerapplylist")
	public String manager_subbannerapplylist(@RequestParam(value="bannercombo", required=false) String bannercombo, @RequestParam(value="bannersearch", required=false) String bannersearch,@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		
		if (bannercombo == null || bannercombo.isEmpty() || bannersearch == null || bannersearch.isEmpty()) {
			
			// 서브 배너 신청내역 리스트 가져가기
			List<BannerApplyFormBean> subBannerApplylistBean = adminService.getAllApplySubbanner(page);
			model.addAttribute("BannerApplylistBean", subBannerApplylistBean);
			
			// 서브 배너 신청내역 뱃지 관련
			BannerApplyFormBean BadgeBean = adminService.getSubBannerBadge();
			model.addAttribute("BadgeCnt", BadgeBean);

			// 메인 배너 페이징 처리
			PageBean pageBean = adminService.getAllApplySubbannerCnt(page);
			model.addAttribute("pageBean", pageBean);
			
		}
		
		if("title".equals(bannercombo)) {	// 제목검색
			
			// 서브 배너 제목 검색 모든 정보 가져가기
			List<BannerApplyFormBean> TitleSearchapplySubBannerInfo = adminService.getSubBannerapplytitleSearch(bannersearch, page);
			model.addAttribute("BannerApplylistBean",TitleSearchapplySubBannerInfo);
			
			// 서브 배너 제목 검색 뱃지 관련
			BannerApplyFormBean TitleSearchBadgeCnt = adminService.getSubBannerapplytitlesearchBadge(bannersearch);
			model.addAttribute("BadgeCnt",TitleSearchBadgeCnt);
			
			// 메인 배너 제목 검색 페이징 처리
			PageBean pageBean1 = adminService.getSubBannerapplytitleSearchCnt(bannersearch, page);
			model.addAttribute("pageBean1", pageBean1);
			
			model.addAttribute("bannercombo",bannercombo);
			model.addAttribute("bannersearch",bannersearch);
		}
		
		return "/admin/manager_subbannerapplylist";
	}
	
	// 배너 신청 취소 처리
	@GetMapping("/BannerApplyCancel")
	public String BannerApplyCancel(@RequestParam("banner_apply_form_id") Integer banner_apply_form_id,
											@RequestParam("banner_type")Integer banner_type,
											RedirectAttributes redirectAttributes)
	{
		adminService.UpdateApplyBannerCancle(banner_apply_form_id);
		
		String bannerUrl="";
		// 메인베너 취소시 메인배너로 리다이렉트
		if(banner_type == 1) {
			bannerUrl="manager_mainbannerapplylist";
		} else if(banner_type == 2){ // 메인베너 취소시 서브배너로 리다이렉트
			
			bannerUrl="manager_subbannerapplylist";
		}
		redirectAttributes.addFlashAttribute("canceled", true);
		return "redirect:/admin/"+bannerUrl;
	}
	
	
	
	// 배너 신청 추가/상세 페이지 매핑 (신청1개 모든 정보 가져가기)
	@GetMapping("/manager_bannerapplyadd")
	public String manager_bannerapplyadd(@RequestParam("banner_apply_form_id") int banner_apply_form_id, Model model) {

		// 배너 신청 1개 모든 정보 가져가기
		BannerApplyFormBean applyinfo = adminService.getBannerapplyDetail(banner_apply_form_id);
		model.addAttribute("AllBannerApplyInfo",applyinfo);
		
		
		return "/admin/manager_bannerapplyadd";
	}

	
	// 신청된 배너 추가
	@PostMapping("/manager_bannerapplyadd_pro")
	public String manager_bannerapplyadd_pro(@ModelAttribute("AllBannerApplyInfo") BannerApplyFormBean AllBannerApplyInfo, Model model) {
		
		// 배너타입이 1일때 (메인베너 리다이렉트)
		if(AllBannerApplyInfo.getBanner_type() == 1) {
			
			MainBannerBean addmainBannerBean = new MainBannerBean();
			
			//파일 변경시
			if(AllBannerApplyInfo.getBanner_file().getSize()>0) {
				// 새파일 저장 및 file_id set
				addmainBannerBean.setMain_banner_file(AllBannerApplyInfo.getBanner_file());
				adminService.addfiletableBanner(addmainBannerBean);
			} else {
				addmainBannerBean.setBanner_file_id(AllBannerApplyInfo.getBanner_file_id());				
			}
			
			addmainBannerBean.setExhibition_id(AllBannerApplyInfo.getExhibition_id());
			addmainBannerBean.setApply_person_id(AllBannerApplyInfo.getApply_person_id());
			addmainBannerBean.setStart_date(AllBannerApplyInfo.getStart_date());
			addmainBannerBean.setEnd_date(AllBannerApplyInfo.getEnd_date());
			
			// 숨김 안숨김 변경
			if(AllBannerApplyInfo.getState1() == 1) {
				addmainBannerBean.setState(1);
			} else {
				addmainBannerBean.setState(2);
			}
			addmainBannerBean.setPay_money(AllBannerApplyInfo.getPayment());
			// expose_order max값 가져와서 +1
			addmainBannerBean.setExpose_order(adminService.getMaxExposeOrder() + 1);
			
			// sub_banner 테이블에 insert
			adminService.addApplyMainBanner(addmainBannerBean);
			
			// banner_apply_form 에서 state 값 2로(등록완료) 변경
			adminService.updatebanner_apply_formState(AllBannerApplyInfo.getBanner_apply_form_id());
			
			return "redirect:/admin/manager_mainbannershowlist";
			
		} else if(AllBannerApplyInfo.getBanner_type() == 2) {	// 2일때 (서브배너 리다이렉트)
			
			SubBannerBean addsubBannerBean = new SubBannerBean();
			
			//파일 변경시
			if(AllBannerApplyInfo.getBanner_file().getSize()>0) {
				// 새파일 저장 및 file_id set
				addsubBannerBean.setSub_banner_file(AllBannerApplyInfo.getBanner_file());
				adminService.addfiletableBanner2(addsubBannerBean);
				
			} else {
				addsubBannerBean.setBanner_file_id(AllBannerApplyInfo.getBanner_file_id());				
			}
			
			addsubBannerBean.setExhibition_id(AllBannerApplyInfo.getExhibition_id());
			addsubBannerBean.setApply_person_id(AllBannerApplyInfo.getApply_person_id());
			addsubBannerBean.setStart_date(AllBannerApplyInfo.getStart_date());
			addsubBannerBean.setEnd_date(AllBannerApplyInfo.getEnd_date());
			
			// 숨김 안숨김 변경
			if(AllBannerApplyInfo.getState1() == 1) {
				addsubBannerBean.setState(1);
			} else {
				addsubBannerBean.setState(2);
			}
			
			addsubBannerBean.setPay_money(AllBannerApplyInfo.getPayment());
			// expose_order max값 가져와서 +1
			addsubBannerBean.setExpose_order(adminService.getSubMaxExposeOrder() + 1);
			
			// sub_banner 테이블에 insert
			adminService.addApplySubBanner(addsubBannerBean);
			
			// banner_apply_form 에서 state 값 2로(등록완료) 변경
			adminService.updatebanner_apply_formState(AllBannerApplyInfo.getBanner_apply_form_id());
			
			return "redirect:/admin/manager_subbannershowlist";
		}
		
		return "redirect:/admin/manager_subbannershowlist";

	}
		
}
