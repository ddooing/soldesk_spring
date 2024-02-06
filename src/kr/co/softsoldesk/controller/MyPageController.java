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

import kr.co.softsoldesk.Beans.ArchiveBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.PointDetailBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.ReviewBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.MyPageService;
import kr.co.softsoldesk.Service.PointDetailService;
import kr.co.softsoldesk.Service.ReserveService;
import kr.co.softsoldesk.Service.ReviewService;
import kr.co.softsoldesk.Service.UserService;


@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private UserService UserService;
	
	@Autowired
	private PointDetailService pointDetailService;
	
	@Autowired
	private ReviewService ReviewService;
	
	@Autowired
	private MyPageService MyPageService;
	
	@GetMapping("/archive")	// 아카이브 매핑
	public String archive(@ModelAttribute("reviewBean") ReviewBean reviewBean, @RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		// 해당 유저 아카이브 모든 정보 가져오기
		List<ArchiveBean> ArchiveAllInfoBean = MyPageService.getArciveAllInfo(user_id, page);
		model.addAttribute("ArchiveAllInfoBean",ArchiveAllInfoBean);
		
		// 마이페이지 아카이브 페이징 처리용
		PageBean pageBean = MyPageService.getarchivelistCnt(user_id, page);
		model.addAttribute("pageBean", pageBean);
		
		
		return "/mypage/archive";
	}
	
	@PostMapping("/archive_pro") 	// 아카이브(review 테이블) 글 등록
	public String archive_pro(@ModelAttribute("reviewBean") ReviewBean reviewBean, @RequestParam("user_id") int user_id,@RequestParam("checkboxValue") int checkboxValue , Model model) {
		
		model.addAttribute("user_id", user_id);
		
		// 체크박스 토글 버튼 스타일 유지를 위해 form:checkbox로 안넘기고 input type="checkbox"로 넘겨서 requestParam으로 받아와 set해줌
		reviewBean.setExpose(checkboxValue);
		
		// 마이페이지 아카이브 글등록 메소드
		MyPageService.enrollArchive(reviewBean);
		
		// 아카이브 작성시 경험치 공개 시 100 증가 아닐시 50증가
		if(reviewBean.getExpose() == 1) {
			UserService.IncreaseExp(100, user_id);
		} else {
			UserService.IncreaseExp(50, user_id);
		}
		
		return "/mypage/archive_enroll_complete";
	}
	

	@GetMapping("/archive_write")	// 아카이브 작성페이지 이동
	public String archive_write(@ModelAttribute("reviewBean") ReviewBean reviewBean ,@RequestParam("reserve_id") int reserve_id , @RequestParam("user_id") int user_id, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		// 해당 reserve_id로 아카이브 1개 모든 정보 가져오기
		ArchiveBean ArchiveOneInfoBean = MyPageService.getArchiveOneInfo(reserve_id);
		model.addAttribute("ArchiveOneInfoBean",ArchiveOneInfoBean);
		
		return "/mypage/archive_write";
	}
	
	@PostMapping("/archive_modify")	// 아카이브 수정후 다시 아카이브 리턴
	public String review_modify(@RequestParam("expose") int expose,  @RequestParam("contents") String contents, @RequestParam("reserve_id") int reserve_id, @RequestParam("rating") int rating ,@RequestParam("user_id") int user_id, Model model) {
		
		model.addAttribute("user_id",user_id);
		
		ReviewBean r1 = new ReviewBean();
		r1.setReserve_id(reserve_id);
		r1.setRating(rating);
		r1.setContents(contents);
		r1.setExpose(expose);
		
		// 리뷰수정
		MyPageService.modifyArchive(r1);
		
		return "/mypage/archive_modify_complete";
	}
	
	
	@GetMapping("/boardwritelist")	// 작성글 매핑
	public String boardwritelist(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		return "/mypage/boardwritelist";
	}
	
	@GetMapping("/bookmark")	// 북마크 매핑
	public String bookmark(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		// 마이페이지 북마크 리스트 가져오는 메소드
		List<ExhibitionBean> UserBookmarkBean = MyPageService.getMyPageBookmarkList(user_id, page);
		model.addAttribute("UserBookmarkBean",UserBookmarkBean);
		
		// 마이페이지 북마크 페이징 처리용
		PageBean pageBean = MyPageService.getbookmarklistCnt(user_id, page);
		model.addAttribute("pageBean", pageBean);
		
		return "/mypage/bookmark";
	}
		
	@GetMapping("/FAQ")			// FAQ 매핑
	public String FAQ(@RequestParam("user_id") int user_id, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		return "/mypage/FAQ";
	}
	
	@GetMapping("/pointlist")	// 포인트 내역 매핑
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
		
		// 마이페이지 포인트 리스트 페이징 처리용
		PageBean pageBean = pointDetailService.getPointDetailCnt(user_id, page);
		model.addAttribute("pageBean", pageBean);
		
		return "/mypage/pointlist";
	}
	
	@GetMapping("/QnA")			//QnA 매핑
	public String QnA(@ModelAttribute("qnaBean") QnABean qnaBean ,@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);
		
		// 해당 유저 QnA 리스트 가져오기
		List<QnABean> UserQnAInfoBean = MyPageService.getUserQnAList(user_id, page);
		model.addAttribute("UserQnAInfoBean",UserQnAInfoBean);
		
		// 마이페이지 qna 페이징 처리용
		PageBean pageBean = MyPageService.getQnAlistCnt(user_id, page);
		model.addAttribute("pageBean", pageBean);
		
		return "/mypage/QnA";
	}
	
	@PostMapping("/QnA_add")			//QnA 매핑
	public String QnA_add(@ModelAttribute("qnaBean") QnABean qnaBean, Model model) {
		
		MyPageService.addUserQnA(qnaBean);
		
		// 마이페이지 다시 가는 용도 user_id 넘김
		model.addAttribute("user_id",qnaBean.getUser_id());
		
		return "/mypage/QnA_complete";
	}
	
	@GetMapping("/reservelist")		// 예약내역 매핑
	public String reservelist(@RequestParam("user_id") int user_id, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 모든 유저 인포 내용
		UserBean UserAllInfoBean = UserService.getLoginUserAllInfo(user_id);
		model.addAttribute("UserAllInfoBean", UserAllInfoBean);
				
		// 마이페이지 상단 인포
		UserBean UserTopInfoBean = MyPageService.getMyPageTopInfo(user_id);
		model.addAttribute("UserTopInfoBean",UserTopInfoBean);

		// 마이페이지 예약 내역 bean객체 담은 리스트
		List<ReserveBean> UserReserveListBean = MyPageService.getMyPageReserveList(user_id, page);
		model.addAttribute("UserReserveListBean", UserReserveListBean);
		
		PageBean pageBean = MyPageService.getreservelistCnt(user_id, page);
		model.addAttribute("pageBean", pageBean);
		
		return "/mypage/reservelist";
	}
	

	
	
	
}
