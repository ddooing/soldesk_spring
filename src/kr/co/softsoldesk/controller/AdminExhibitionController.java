package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Service.AdminExhibitionService;

@Controller
@RequestMapping("/admin")
public class AdminExhibitionController {
	
	@Autowired
	private AdminExhibitionService AdminExhibitionService;
	
	// ==============================전시회 관리 ====================================
	
		// 전시회 관리 매핑
		@GetMapping("/manager_exhibitionlist")
		public String manager_exhibitionlist(@RequestParam(value="exhibitioncombo", required=false) String exhibitioncombo, @RequestParam(value="exhibitionsearch", required=false) String exhibitionsearch, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
			
			if (exhibitioncombo == null || exhibitioncombo.isEmpty() || exhibitionsearch == null || exhibitionsearch.isEmpty()) {
				// 전시회 목록 가져가기
			 	List<ExhibitionBean> AdminExhibitionInfoBean = AdminExhibitionService.getAdminexhibitionmange(page);
				model.addAttribute("AdminExhibitionInfoBean", AdminExhibitionInfoBean);
				
				// 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
				ExhibitionBean ExhibitionCountBean = AdminExhibitionService.getExhibitionCount();
				model.addAttribute("ExhibitionCountBean",ExhibitionCountBean);
			 	
				// 전시회 페이징 처리
				PageBean pageBean = AdminExhibitionService.getExhibitionCnt(page);
				model.addAttribute("pageBean", pageBean);
				
				return "/admin/manager_exhibitionlist";
			}
			
			if("author".equals(exhibitioncombo)) {	// 작가 검색
				// 작가 검색
				List<ExhibitionBean> authorSearchBean = AdminExhibitionService.getauthorSearchExhibitionInfo(exhibitionsearch);
				model.addAttribute("AdminExhibitionInfoBean", authorSearchBean);
				
				// 작가 검색시 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
				ExhibitionBean AuthorSearchExhibitionCountBean = AdminExhibitionService.getauthorSearchExhibitionCount(exhibitionsearch);
				model.addAttribute("ExhibitionCountBean",AuthorSearchExhibitionCountBean);
				
				// 작가 검색시 페이징 처리
				PageBean pageBean1 = AdminExhibitionService.getauthorSearchExhibitionCnt(exhibitionsearch, page);
				model.addAttribute("pageBean1", pageBean1);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("exhibitionsearch",exhibitionsearch);
				
			} else if ("title".equals(exhibitioncombo)) {	// 제목 검색
				// 제목 검색
				List<ExhibitionBean> titleSearchBean = AdminExhibitionService.gettitleSearchExhibitionInfo(exhibitionsearch, page);
				model.addAttribute("AdminExhibitionInfoBean",titleSearchBean);
				
				// 제목 검색시 전시회 총개수, 전시예정, 종료, 진행중 전시 개수 반환
				ExhibitionBean TitleSearchExhibitionCountBean = AdminExhibitionService.gettitleSearchExhibitionCount(exhibitionsearch);
				model.addAttribute("ExhibitionCountBean",TitleSearchExhibitionCountBean);
				
				// 제목 검색시 페이징 처리
				PageBean pageBean2 = AdminExhibitionService.gettitleSearchExhibitionCnt(exhibitionsearch, page);
				model.addAttribute("pageBean2", pageBean2);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("exhibitionsearch",exhibitionsearch);
			} 
			
			return "/admin/manager_exhibitionlist";
		}
		
		// 전시회 수정 페이지 들어가기
		@GetMapping("/manager_exhibitionmodify")
		public String manager_exhibitionmodify(@RequestParam("exhibition_id") int exhibition_id, Model model) { 
			
			ExhibitionDetailBean DetailExhibitionBean = AdminExhibitionService.getAllDetailExhibitionBean(exhibition_id);
			DetailExhibitionBean.setExhibition_id(exhibition_id);
			
			model.addAttribute("DetailExhibitionBean",DetailExhibitionBean);
			
			return "/admin/manager_exhibitionmodify";
		}
		
		// 전시회 수정
		@PostMapping("/exhibition_exhibitionmodify_pro")
		public String exhibition_exhibitionmodify_pro(@ModelAttribute("DetailExhibitionBean") ExhibitionDetailBean DetailExhibitionBean, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
			
			// open 컬럼 set => open_time + " - " + close_time
			String open = (DetailExhibitionBean.getOpen_time() + " - " + DetailExhibitionBean.getClose_time());
			DetailExhibitionBean.setOpen(open);
			
			// 파일 저장하고 전시회 관련 업데이트
			AdminExhibitionService.UpdateExhibitionInfo2(DetailExhibitionBean);
				
			return "redirect:/admin/manager_exhibitionlist";
		}
		
		
		// 전시회 추가 페이지 매핑
		@GetMapping("/manager_exhibitionadd")
		public String manager_exhibitionadd(@ModelAttribute("AddDetailExhibitionBean") ExhibitionDetailBean AddDetailExhibitionBean) {
			
			return "/admin/manager_exhibitionadd";
		}
		
		// 전시회 추가
		@PostMapping("/exhibition_exhibitionadd_pro")
		public String exhibition_exhibitionadd_pro(@ModelAttribute("AddDetailExhibitionBean") ExhibitionDetailBean AddDetailExhibitionBean, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

			// 파일테이블 추가
			AdminExhibitionService.addfiletableExhibition(AddDetailExhibitionBean);
			
			// 전시회 테이블 추가
			AdminExhibitionService.addexhibitiontableExhibition(AddDetailExhibitionBean);
			
			return "redirect:/admin/manager_exhibitionlist";
		}
		
		
		// ========================== 전시회 등록 신청 ====================================
		
		// 관리자페이지 전시회 등록 신청 리스트 
		@GetMapping("/manager_exhibitionapplylist")
		public String manager_exhibitionapplylist(@RequestParam(value="exhibitioncombo", required=false) String exhibitioncombo, @RequestParam(value="exhibitionsearch", required=false) String exhibitionsearch, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
			
			if (exhibitioncombo == null || exhibitioncombo.isEmpty() || exhibitionsearch == null || exhibitionsearch.isEmpty()) {
				// 리스트 찍는 정보 가져가기
				List<ExhibitionDetailBean> enrollAllBean = AdminExhibitionService.getAllExhibitionEnroll(page);
				model.addAttribute("enrollAllBean", enrollAllBean);
				
				// 페이징 처리
				PageBean pageBean = AdminExhibitionService.getEnrollExhibitionCnt(page);
				model.addAttribute("pageBean", pageBean);
				
				// 뱃지에 넣을 개수 반환 Bean (total_exhibition_eroll_count,stay_exhibition_eroll_count,complete_exhibition_eroll_count)
				ExhibitionDetailBean countBean = AdminExhibitionService.getEnrollExhibitionbadgeCnt();
				model.addAttribute("countBean", countBean);
				
				return "/admin/manager_exhibitionapplylist";
			}
			
			
			if("title".equals(exhibitioncombo)) {	// 제목검색
				
				// 제목 검색 리스트
				List<ExhibitionDetailBean> titlesearchBean = AdminExhibitionService.getEnrollExhibitionSearchTitle(exhibitionsearch, page);
				model.addAttribute("enrollAllBean",titlesearchBean);
				
				// 제목 검색 중 배지 개수 반환
				ExhibitionDetailBean titlesearchCntBean = AdminExhibitionService.getEnrollExhibitionSearchTitleBadgeCnt(exhibitionsearch);
				model.addAttribute("countBean",titlesearchCntBean);
				
				// 제목 검색 페이징 처리
				PageBean pageBean = AdminExhibitionService.getEnrollExhibitionSearchTitletotalCnt(exhibitionsearch, page);
				model.addAttribute("pageBean1", pageBean);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("exhibitionsearch",exhibitionsearch);
				
			} else if("apply_person".equals(exhibitioncombo)) {	// 신청인검색
				
				// 신청인 검색 리스트
				List<ExhibitionDetailBean> apply_personsearchBean = AdminExhibitionService.getEnrollExhibitionSearchapply_person(exhibitionsearch, page);
				model.addAttribute("enrollAllBean",apply_personsearchBean);
				
				// 신청인 검색 중 배지 개수 반환
				ExhibitionDetailBean apply_personsearchCntBean = AdminExhibitionService.getEnrollExhibitionSearchapply_personBadgeCnt(exhibitionsearch);
				model.addAttribute("countBean",apply_personsearchCntBean);
				
				// 신청인 검색 페이징 처리
				PageBean pageBean = AdminExhibitionService.getEnrollExhibitionSearchapply_persontotalCnt(exhibitionsearch, page);
				model.addAttribute("pageBean2", pageBean);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("exhibitionsearch",exhibitionsearch);			
			} else if("author".equals(exhibitioncombo)) {	// 작가검색
				
				// 작가 검색 리스트
				List<ExhibitionDetailBean> getEnrollExhibitionSearchauthor = AdminExhibitionService.getEnrollExhibitionSearchauthor(exhibitionsearch, page);
				model.addAttribute("enrollAllBean", getEnrollExhibitionSearchauthor);
				
				// 작가 검색 중 배지 개수 반환
				ExhibitionDetailBean authorsearchCntBean = AdminExhibitionService.getEnrollExhibitionSearchauthorBadgeCnt(exhibitionsearch);
				model.addAttribute("countBean", authorsearchCntBean);
				
				// 작가 검색 페이징 처리
				PageBean pageBean = AdminExhibitionService.getEnrollExhibitionSearchauthortotalCnt(exhibitionsearch, page);
				model.addAttribute("pageBean3", pageBean);
				
				// 페이징 처리로 인한 검색조건 검색어 가져가기
				model.addAttribute("exhibitioncombo",exhibitioncombo);
				model.addAttribute("exhibitionsearch",exhibitionsearch);
				
			} else if("enroll_state".equals(exhibitioncombo)) {		// 상태검색
				
				// 상태 검색 매핑?
				if(exhibitionsearch.contains("대")||exhibitionsearch.contains("기")) {
					
					int searching = 1;
					// 상태 검색 리스트
					List<ExhibitionDetailBean> getEnrollExhibitionSearchstate = AdminExhibitionService.getEnrollExhibitionSearchstate(searching, page);
					model.addAttribute("enrollAllBean",getEnrollExhibitionSearchstate);
					
					// 상태 검색 중 배지 개수 반환
					ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt = AdminExhibitionService.getEnrollExhibitionSearchstateBadgeCnt(searching);
					model.addAttribute("countBean",getEnrollExhibitionSearchstateBadgeCnt);
					
					// 상태 검색 페이징 처리
					PageBean pageBean = AdminExhibitionService.getEnrollExhibitionSearchstatetotalCnt(searching, page);
					model.addAttribute("pageBean4", pageBean);
					
					// 페이징 처리로 인한 검색조건 검색어 가져가기
					model.addAttribute("exhibitioncombo",exhibitioncombo);
					model.addAttribute("searching",searching);
					model.addAttribute("exhibitionsearch",exhibitionsearch);
					
				} else if(exhibitionsearch.contains("완")||exhibitionsearch.contains("료")||exhibitionsearch.contains("등")||exhibitionsearch.contains("록")) {
					
					int searching = 2;
					// 상태 검색 리스트
					List<ExhibitionDetailBean> getEnrollExhibitionSearchstate = AdminExhibitionService.getEnrollExhibitionSearchstate(searching, page);
					model.addAttribute("enrollAllBean",getEnrollExhibitionSearchstate);
					
					// 상태 검색 중 배지 개수 반환
					ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt = AdminExhibitionService.getEnrollExhibitionSearchstateBadgeCnt(searching);
					model.addAttribute("countBean",getEnrollExhibitionSearchstateBadgeCnt);
					
					// 상태 검색 페이징 처리
					PageBean pageBean = AdminExhibitionService.getEnrollExhibitionSearchstatetotalCnt(searching, page);
					model.addAttribute("pageBean4", pageBean);
					
					// 페이징 처리로 인한 검색조건 검색어 가져가기
					model.addAttribute("exhibitioncombo",exhibitioncombo);
					model.addAttribute("searching",searching);
					model.addAttribute("exhibitionsearch",exhibitionsearch);
					
				} else if(exhibitionsearch.contains("거")||exhibitionsearch.contains("절")) {
					
					int searching = 3;
					// 상태 검색 리스트
					List<ExhibitionDetailBean> getEnrollExhibitionSearchstate = AdminExhibitionService.getEnrollExhibitionSearchstate(searching, page);
					model.addAttribute("enrollAllBean",getEnrollExhibitionSearchstate);
					
					// 상태 검색 중 배지 개수 반환
					ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt = AdminExhibitionService.getEnrollExhibitionSearchstateBadgeCnt(searching);
					model.addAttribute("countBean",getEnrollExhibitionSearchstateBadgeCnt);
					
					// 상태 검색 페이징 처리
					PageBean pageBean = AdminExhibitionService.getEnrollExhibitionSearchstatetotalCnt(searching, page);
					model.addAttribute("pageBean4", pageBean);
					
					// 페이징 처리로 인한 검색조건 검색어 가져가기
					model.addAttribute("exhibitioncombo",exhibitioncombo);
					model.addAttribute("searching",searching);
					model.addAttribute("exhibitionsearch",exhibitionsearch);
					
				}
				
			}
			
			return "/admin/manager_exhibitionapplylist";
		}
		
		// 관리자 페이지 전시회 등록 확인 페이지 매핑
		@GetMapping("/manager_exhibitionenrolladd")
		public String manager_exhibitionenrolladd(@RequestParam("exhibition_enroll_id") int exhibition_enroll_id ,Model model) {
			
			// 해당 전시회 등록 모든 정보 가져오기
			ExhibitionDetailBean AddDetailEnrollExhibitionBean = AdminExhibitionService.getOneEnrollExhitiion(exhibition_enroll_id);
			model.addAttribute("AddDetailEnrollExhibitionBean",AddDetailEnrollExhibitionBean);
			
			return "/admin/manager_exhibitionenrolladd";
		}
		
		// 관리자 페이지 전시회 등록 신청 -> 전시회 등록으로 넘어가는 메소드
		@PostMapping("manager_exhibitionenrolladd_pro")
		public String manager_exhibitionenrolladd_pro(@ModelAttribute("AddDetailEnrollExhibitionBean") ExhibitionDetailBean AddDetailEnrollExhibitionBean, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
			
			// 파일을 변경 할 수 있으므로 파일 변경을 할 경우 새로 파일 저장
			if(AddDetailEnrollExhibitionBean.getMain_poster_file().getSize()>0) {
				// 메인 포스터 파일 변경
				AdminExhibitionService.adddetailfiletableExhibition(AddDetailEnrollExhibitionBean);
			}
			
			if(AddDetailEnrollExhibitionBean.getDetail_poster_file().getSize()>0) {
				// 상세 포스터 파일 변경
				AdminExhibitionService.addexhibitiontableExhibition(AddDetailEnrollExhibitionBean);
			}
			
			// 전시회 테이블 추가
			AdminExhibitionService.addEnrollexhibitiontableExhibition(AddDetailEnrollExhibitionBean);	
			
			// 전시회 등록 신청 완료 후 상태값 2로 변경
			AdminExhibitionService.UpdateExhibitionEnrollState(2, AddDetailEnrollExhibitionBean.getExhibition_enroll_id());
			
			return "redirect:/admin/manager_exhibitionlist";
		}
		
		@GetMapping("/manager_enroll_reject")
		public String manager_enroll_reject(@RequestParam(value = "page", defaultValue = "1") int page,@RequestParam("exhibition_enroll_id") int exhibition_enroll_id, Model model) {
			
			// 상태값 거절(3) 으로 변경
			AdminExhibitionService.UpdateExhibitionEnrollState(3, exhibition_enroll_id);
			
			// 리스트 찍는 정보 가져가기
			List<ExhibitionDetailBean> enrollAllBean = AdminExhibitionService.getAllExhibitionEnroll(page);
			model.addAttribute("enrollAllBean", enrollAllBean);
						
			// 페이징 처리
			PageBean pageBean = AdminExhibitionService.getEnrollExhibitionCnt(page);
			model.addAttribute("pageBean", pageBean);
						
			// 뱃지에 넣을 개수 반환 Bean (total_exhibition_eroll_count,stay_exhibition_eroll_count,complete_exhibition_eroll_count)
			ExhibitionDetailBean countBean = AdminExhibitionService.getEnrollExhibitionbadgeCnt();
			model.addAttribute("countBean", countBean);
						
			return "/admin/manager_exhibitionapplylist";		
			
		}

}
