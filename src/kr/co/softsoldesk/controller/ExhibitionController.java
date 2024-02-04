package kr.co.softsoldesk.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.BookMarkBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BookMarkService;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	@Autowired
    private ExhibitionService exhibitionService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private BookMarkService bookMarkService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("/exhibition_popular")
	public String exhibition_popular(Model model) {
		
		// 인기 카테고리
		List<ExhibitionBean> getPopularExhibitionInfo = exhibitionService.getPopularExhibitionInfo();
        model.addAttribute("getPopularExhibitionInfo", getPopularExhibitionInfo);
        
		return "exhibition/exhibition_popular";
	}
	
	@GetMapping("/exhibition_soon_end")
	public String exhibition_soon_end(Model model) {
		
		// 곧종료 카테고리
        List<ExhibitionBean> getSoonEndExhibitionInfo = exhibitionService.getSoonEndExhibitionInfo();
        model.addAttribute("getSoonEndExhibitionInfo", getSoonEndExhibitionInfo);
        
		return "exhibition/exhibition_soon_end";
	}
	
	@GetMapping("/exhibition_recent")
	public String exhibition_recent(Model model) {
		
		// 최신 카테고리
        List<ExhibitionBean> getRecentExhibitionInfo = exhibitionService.getRecentExhibitionInfo();
        model.addAttribute("getRecentExhibitionInfo", getRecentExhibitionInfo);
        
		return "exhibition/exhibition_recent";
	}
	
	@GetMapping("/exhibition_free")
	public String exhibition_free(Model model) {
		
		// 무료 카테고리
        List<ExhibitionBean> getFreeExhibitionInfo = exhibitionService.getFreeExhibitionInfo();
        model.addAttribute("getFreeExhibitionInfo", getFreeExhibitionInfo);
        
		return "exhibition/exhibition_free";
	}
	
	
	@GetMapping("/exhibition_click")
	public String exhibition_detail(@RequestParam("exhibition_id") int exhibition_id,@RequestParam("user_id") int user_id ,@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, Model model) {
	    // 전시회 클릭시 조회수 1증가
		exhibitionService.increaseViewsExhibition(exhibition_id);
		
		// 로그인 되어있을때만 북마크 여부 확인
		if(user_id != 0) {
			int bookmarksure = bookMarkService.BookMarkSure(user_id, exhibition_id);
			System.out.println("bookmarksure : " + bookmarksure);
			model.addAttribute("bookmarksure",bookmarksure);
		}
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_id);
	    model.addAttribute("exhibitionBean", exhibitionBean);
	    
	    
	    return "exhibition/exhibition_click";
	}
	
	@GetMapping("/bookmark")	// 북마크 추가 삭제
	public String bookmark(@RequestParam("exhibition_id") int exhibition_id, @RequestParam("user_id") int user_id,Model model) {
		// 현재 북마크라면 1 아니라면 0 반환
		int bookmarksure = bookMarkService.BookMarkSure(user_id, exhibition_id);
		
		if(bookmarksure == 0) {
			//북마크 추가 메소드
			BookMarkBean bookmarkbean = new BookMarkBean();
			bookmarkbean.setExhibition_id(exhibition_id);
			bookmarkbean.setUser_id(user_id);
			
			bookMarkService.addBookMark(bookmarkbean);
			model.addAttribute("exhibition_id",exhibition_id);
			model.addAttribute("user_id",user_id);
			
			return "exhibition/bookmark_add";
			
		} else {
			//북마크 삭제 메소드
			BookMarkBean bookmarkbean = new BookMarkBean();
			bookmarkbean.setExhibition_id(exhibition_id);
			bookmarkbean.setUser_id(user_id);
			
			bookMarkService.deleteBookMark(bookmarkbean);
			model.addAttribute("exhibition_id",exhibition_id);
			model.addAttribute("user_id",user_id);
			
			return "exhibition/bookmark_delete";
		} 
	}
	
	
	@PostMapping("/payment")
	public String exhibition_reserve(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, @RequestParam("exhibition_id") int exhibition_id, Model model) {
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_id);	
	    model.addAttribute("exhibitionBean", exhibitionBean);		// 전시회 정보 객체
		
		ReserveBean ReserveBean = reserveService.reservebtn_click(tempReserveBean);
		model.addAttribute("ReserveBean",ReserveBean);				// 전시회 상세조회 페이지에서 선택한 티켓수와 날짜 객체에 담아서 payment로 보낼 객체
		
		UserBean LoginAllInfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("LoginAllInfoBean",LoginAllInfoBean);
		
		// 로그인 된 유저 객체에 추가해도 되는데 조인 어려워서 유저 grade만 받아오는 객체 따로 생성 (grade에만 값있고 다른거 다 null)
		UserBean UserGradeBean = UserService.getUserGrade(tempReserveBean.getUser_id());
		System.out.println(tempReserveBean.getUser_id());
		model.addAttribute("UserGradeBean", UserGradeBean);
		
		// 임시로 order_id에 랜덤값 넣으려고 보내는값 order_id(결제번호) 값 처리시 꼭 삭제
		String randomValue = UUID.randomUUID().toString();
        model.addAttribute("randomValue", randomValue);
		
		
		return "exhibition/payment";
	}
	
	@GetMapping("bookmark_not_login")
	public String bookmark_not_login() {
		return "exhibition/bookmark_not_login";
	}
	

	

}
