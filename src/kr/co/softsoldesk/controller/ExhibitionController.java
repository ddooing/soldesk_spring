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
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.BookMarkBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.ReviewBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.AdminExhibitionService;
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
	
	@Autowired
	private AdminExhibitionService adminExhibitionService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("/exhibition_popular")
	public String exhibition_popular(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 인기 카테고리
		List<ExhibitionBean> getPopularExhibitionInfo = exhibitionService.getPopularExhibitionInfo(page);
        model.addAttribute("getPopularExhibitionInfo", getPopularExhibitionInfo);
     
        // 인기 카테고리 페이징 처리
     	PageBean pageBean = exhibitionService.getPopularExhibitionCnt(page);
     	model.addAttribute("pageBean", pageBean);
        
		return "exhibition/exhibition_popular";
	}
	
	@GetMapping("/exhibition_soon_end")
	public String exhibition_soon_end(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 곧종료 카테고리
        List<ExhibitionBean> getSoonEndExhibitionInfo = exhibitionService.getSoonEndExhibitionInfo(page);
        model.addAttribute("getSoonEndExhibitionInfo", getSoonEndExhibitionInfo);
        
        // 곧종료 카테고리 페이징 처리
     	PageBean pageBean = exhibitionService.getsoonEndExhibitionCnt(page);
     	model.addAttribute("pageBean", pageBean);
        
		return "exhibition/exhibition_soon_end";
	}
	
	@GetMapping("/exhibition_recent")
	public String exhibition_recent(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 최신 카테고리
        List<ExhibitionBean> getRecentExhibitionInfo = exhibitionService.getRecentExhibitionInfo(page);
        model.addAttribute("getRecentExhibitionInfo", getRecentExhibitionInfo);

        // 최근 카테고리 페이징 처리
     	PageBean pageBean = exhibitionService.getRecentExhibitionCnt(page);
     	model.addAttribute("pageBean", pageBean);
        
		return "exhibition/exhibition_recent";
	}
	
	@GetMapping("/exhibition_free")
	public String exhibition_free(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 무료 카테고리
        List<ExhibitionBean> getFreeExhibitionInfo = exhibitionService.getFreeExhibitionInfo(page);
        model.addAttribute("getFreeExhibitionInfo", getFreeExhibitionInfo);
        
        // 무료 카테고리 페이징 처리
     	PageBean pageBean = exhibitionService.getFreeExhibitionCnt(page);
     	model.addAttribute("pageBean", pageBean);
        
		return "exhibition/exhibition_free";
	}
	
	
	@GetMapping("/exhibition_click")
	public String exhibition_detail(@RequestParam("exhibition_id") int exhibition_id,@RequestParam(value = "user_id", defaultValue = "0") int user_id ,@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
	    // 전시회 클릭시 조회수 1증가
		exhibitionService.increaseViewsExhibition(exhibition_id);
		
		// 로그인 되어있을때만 북마크 여부 확인
		if(user_id != 0) {
			int bookmarksure = bookMarkService.BookMarkSure(user_id, exhibition_id);
			model.addAttribute("bookmarksure",bookmarksure);
		}
		
		// 리뷰 정보 가져가기
		List<ReviewBean> exhibitionreviewBean = exhibitionService.getExhibition_clickReviewAllInfo(exhibition_id, page);
		model.addAttribute("exhibitionreviewBean", exhibitionreviewBean);
		
		// 전시회 상세정보 가져가기
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_id);
	    model.addAttribute("exhibitionBean", exhibitionBean);
	    
	    // 리뷰 페이징 처리
     	PageBean pageBean = exhibitionService.getExhibitionReviewCnt(exhibition_id, page);
     	model.addAttribute("pageBean", pageBean);
     	
     	// 리뷰 평균 점수 반환
     	double reviewAVG = exhibitionService.getExhibitionReviewAVG(exhibition_id);
     	model.addAttribute("reviewAVG", reviewAVG);
	    
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
			
			return "redirect:/exhibition/exhibition_click?exhibition_id=" + exhibition_id + "&user_id=" + user_id;
			
		} else {
			//북마크 삭제 메소드
			BookMarkBean bookmarkbean = new BookMarkBean();
			bookmarkbean.setExhibition_id(exhibition_id);
			bookmarkbean.setUser_id(user_id);
			
			bookMarkService.deleteBookMark(bookmarkbean);
			model.addAttribute("exhibition_id",exhibition_id);
			model.addAttribute("user_id",user_id);
			
			return "redirect:/exhibition/exhibition_click?exhibition_id=" + exhibition_id + "&user_id=" + user_id;
		} 
	}
	
	
	@PostMapping("/payment")
	public String exhibition_reserve(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean, 
			@RequestParam("exhibition_id") int exhibition_id, Model model) {
		
		ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(exhibition_id);	
	    model.addAttribute("exhibitionBean", exhibitionBean);		// 전시회 정보 객체
		
	    System.out.println("tempReserveBean 티켓 날짜 처리 전  : "+tempReserveBean.getReserve_date());
	    String replace_reserve_date = removeCommasFromReserveDate(tempReserveBean.getReserve_date());
	    tempReserveBean.setReserve_date(replace_reserve_date);
	    
	    
		//ReserveBean ReserveBean = reserveService.reservebtn_click(tempReserveBean);
		model.addAttribute("tempReserveBean",tempReserveBean);// 전시회 상세조회 페이지에서 선택한 티켓수와 날짜 객체에 담아서 payment로 보낼 객체
		
		//로그인 한 유저의 정보를 예매 폼의 예매자 정보에 넣기 위함
		UserBean LoginAllInfoBean = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("LoginAllInfoBean",LoginAllInfoBean);
		
		int totalprice = tempReserveBean.getTicket_count()*exhibitionBean.getPrice();
		tempReserveBean.setTotal_price(totalprice);
		
		int plus_point = getPlusePoint(loginUserBean.getUser_id(),tempReserveBean.getTotal_price()); 
		tempReserveBean.setPoint_plus(plus_point);
		
		// 확인용 
		System.out.println("exhibition_id : "+exhibitionBean.getExhibition_id());
		System.out.println("tempReserveBean 티켓 : "+tempReserveBean.getTicket_count());
		System.out.println("tempReserveBean 티켓 날짜 처리 휴: "+tempReserveBean.getReserve_date());
		System.out.println("tempReserveBean 포인트 : "+tempReserveBean.getPoint_plus());
		System.out.println("LoginAllInfoBean : "+LoginAllInfoBean.getName());
		return "exhibition/payment";
	}
	
	
	@GetMapping("/payment_complete")
	public String showPaymentComplete(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean,
	                                  @ModelAttribute("exhibitionBean") ExhibitionBean exhibitionBean, 
	                                  Model model) {
	    // 데이터 출력
	    System.out.println("ReserveBean: " + tempReserveBean);
	    System.out.println("exhibitionBean : " + exhibitionBean);

	    // 뷰에 데이터 추가
	    model.addAttribute("tempReserveBean", tempReserveBean);
	    model.addAttribute("exhibitionBean", exhibitionBean);
	    return "exhibition/payment_complete";
	}
	// 장바구니 ~ 예매 reserve_date 쉼표 이슈  처리
	public String removeCommasFromReserveDate(String reserveDate) {
	    if (reserveDate == null) {
	        return null;
	    }
	    return reserveDate.replace(",", "");
	}
	
	//예매 시 얻을 포인트 
	public int getPlusePoint(int userid,int totalPrice) {
		String level = UserService.getLevel(userid);
        int reservePulsPoint=0;// 예매 시 적립되는 포인트
        
        
        if(level.equals("level1")) // 레벨 1 일때 5%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.05);
        }
        else if(level.equals("level2")) // 레벨 2 일때 10%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.1);
        }
        else if(level.equals("level3")) // 레벨 3 일때 15%만큼 포인트 지급
        {
        	reservePulsPoint = (int)(totalPrice*0.15);
        }
        
        return reservePulsPoint; 
        
	}
	
	// 전시회 등록 페이지 매핑
	@GetMapping("/Exhibition_Enroll")
	public String Exhibition_Enroll(@ModelAttribute("addExhibitionDetailBean") ExhibitionDetailBean exhibitionDetailBean, Model model) {
		
		// 로그인된 모든 정보 가져옴 (이름, 이메일, 전화번호) readonly용
		UserBean getLoginUserAllInfo = UserService.getLoginUserAllInfo(loginUserBean.getUser_id());
		model.addAttribute("getLoginUserAllInfo", getLoginUserAllInfo);
		
		return "exhibition/Exhibition_Enroll";
	}
	
	// 전시회 등록 폼 제출
	@PostMapping("/Exhibition_Enroll_pro")
	public String Exhibition_Enroll_pro(@ModelAttribute("addExhibitionDetailBean") ExhibitionDetailBean exhibitionDetailBean, Model model) {
		
		// 파일 테이블에 추가 및 파일 저장 (관리자 전시회 직접추가때 사용한 메소드 재사용)
		adminExhibitionService.addfiletableExhibition(exhibitionDetailBean);
		
		// exhibition_enroll 테이블에 저장
		exhibitionService.AddExhibition_Enroll(exhibitionDetailBean);
		
		return "/exhibition/exhibition_enroll_complete";
	}
	

	

}
