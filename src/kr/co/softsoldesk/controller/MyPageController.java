package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.MyPageService;
import kr.co.softsoldesk.Service.PointDetailService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.UserService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private UserService UserService;
	
	@Autowired
	private PointDetailService pointDetailService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MyPageService MyPageService;
	
	@GetMapping("/archive")
	public String archive(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		return "/mypage/archive";
	}
	
	@GetMapping("/boardwritelist")
	public String boardwritelist(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		return "/mypage/boardwritelist";
	}
	
	@GetMapping("/bookmark")
	public String bookmark(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		// 마이페이지 북마크 리스트 가져오는 메소드
		List<ExhibitionBean> UserBookmarkBean = MyPageService.getMyPageBookmarkList(user_id);
		model.addAttribute("UserBookmarkBean",UserBookmarkBean);
		
		return "/mypage/bookmark";
	}
	
	@GetMapping("/FAQ")
	public String FAQ(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		return "/mypage/FAQ";
	}
	
	@GetMapping("/pointlist")
	public String pointlist(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		// 마이페이지 포인트 내역 bean객체 담은 리스트
		List<PointDetailBean> UserPointListBean = pointDetailService.GetMypagePointList(user_id,page);
		model.addAttribute("UserPointListBean", UserPointListBean);
		
		return "/mypage/pointlist";
	}
	
	@GetMapping("/QnA")
	public String QnA(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		return "/mypage/QnA";
	}
	
	@GetMapping("/reservelist")
	public String reservelist(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);

		// 마이페이지 예약 내역 bean객체 담은 리스트
		List<ReserveBean> UserReserveListBean = MyPageService.getMyPageReserveList(user_id);
		model.addAttribute("UserReserveListBean", UserReserveListBean);
		
		return "/mypage/reservelist";
	}
	

	
	
}
