package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.CartBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.ExhibitionService;
import kr.co.softsoldesk.Service.UserService;


@Controller
@RequestMapping("/user")
public class CartController {
	
	@Autowired
    private ExhibitionService exhibitionService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Autowired
	private UserService UserService;
	
	@PostMapping("/cart_insert") // /board/main
	public String cart_insert(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean,
			HttpSession session,Model model,RedirectAttributes redirectAttributes) {
		
		//System.out.println("cart insert 컨트롤러 실행됨");
		
		
	 ArrayList< CartBean > list = (ArrayList < CartBean > ) session.getAttribute("cart");
	  //처음 이후에는 세션에 저장된 데이터를 불러옴 -> 맨 처음에만 메모리 할당을 하도록 한다.
	  if (list == null) {
	    list = new ArrayList < CartBean > ();
	  }
	  
	  
		/*
		 * System.out.println("cart insert 컨트롤러 - ");
		 * System.out.println("cart insert 컨트롤러 실행됨"+tempReserveBean.getReserve_date());
		 * System.out.println("cart insert 컨트롤러 실행됨"+tempReserveBean.getOrder_id());
		 * System.out.println("cart insert 컨트롤러 실행됨"+tempReserveBean.getTicket_count());
		 * System.out.println("cart insert 컨트롤러 실행됨"+tempReserveBean.getUser_id());
		 */
	  CartBean cvo = new CartBean();
	  //System.out.println("cart insert 컨트롤러 실행됨 title : "+tempReserveBean.getExhibition_id());
	  cvo.setExhibition_id(tempReserveBean.getExhibition_id());
	 // cvo.setUser_id(tempReserveBean.getUser_id());
	  cvo.setReserve_date(tempReserveBean.getReserve_date());
	  cvo.setTicket_count(tempReserveBean.getTicket_count());
		/*
		 * System.out.println("cart insert 예매 전시회 : "+ cvo.getTitle());
		 * System.out.println("cart insert 예매 날짜 : "+ cvo.getReserve_date());
		 * System.out.println("cart insert 티켓 수량 : "+ cvo.getTicket_count());
		 */
	  
	  redirectAttributes.addAttribute("exhibition_id", tempReserveBean.getExhibition_id());
	  
	  boolean bCheck = false;
	  for (CartBean avo: list) {
	    //이미 장바구니에 들어가 있는 전시회 , 날짜, 티켓수가 똑같으면 추가안함
		 
		  
		if ((avo.getExhibition_id()== cvo.getExhibition_id()) 
    		&& (avo.getReserve_date().equals(cvo.getReserve_date()))
    		&& (avo.getTicket_count()== cvo.getTicket_count())  				
	    ){
		    redirectAttributes.addFlashAttribute("cartMessage", "장바구니에 존재합니다");
		    redirectAttributes.addFlashAttribute("icon", "warning");
		    bCheck = true;
	        break;
	    }
	  }
	  

	  if (bCheck == false) {// 같은 상품 없음 추가하기 

		  ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(tempReserveBean.getExhibition_id());
		  
			/*
			 * System.out.println("cart insert 컨트롤러 실행됨 title : "+exhibitionBean.getTitle())
			 * ;
			 * System.out.println("cart insert 컨트롤러 실행됨 main-poster-name : "+exhibitionBean.
			 * getMain_poster_name());
			 * System.out.println("cart insert 컨트롤러 실행됨 main-poster-path"+exhibitionBean.
			 * getMain_poster_path());
			 */
			
		  cvo.setTitle(exhibitionBean.getTitle());
		  cvo.setMain_poster_name(exhibitionBean.getMain_poster_name());
		  cvo.setMain_poster_path(exhibitionBean.getMain_poster_path());
		  cvo.setTotal_price(tempReserveBean.getTicket_count()*exhibitionBean.getPrice()); // 총 티켓 가격
		 
	    list.add(cvo);
	    session.setAttribute("cart", list);
	    redirectAttributes.addFlashAttribute("cartMessage", "장바구니에 추가되었습니다");
	    redirectAttributes.addFlashAttribute("icon", "success");
	  }
	  

		//System.out.println("cart insert 컨트롤러 - tempReserveBean.getExhibition_id "+tempReserveBean.getExhibition_id());

	    return "redirect:/exhibition/exhibition_click?user_id="+tempReserveBean.getUser_id();

	}

	@GetMapping("/cart_list")
	public String goods_cart_list(HttpSession session, Model model) {
	  //세션 속에 저장된 장바구니 리스트를 불러 와야 함
	  List < CartBean > list = (List < CartBean > ) session.getAttribute("cart");

		// 장바구니 리스트가 null이거나 비어 있는지 확인
	    if (list == null || list.isEmpty()) {
	        // 장바구니가 비어있는 경우, 빈 리스트를 생성하여 모델에 추가
	        list = new ArrayList<>();
	    } else {
	        // 장바구니에 항목이 있는 경우, 각 항목의 정보를 출력
	        for (CartBean avo : list) {
	            System.out.println("cart select 예매 날짜 : " + avo.getReserve_date());
	            System.out.println("cart select 티켓 수량 : " + avo.getTicket_count());
	            System.out.println("cart select 티켓 가격 : " + avo.getTotal_price());
	        }
	    }
	   //Collections.reverse(list); // 리스트를 역순으로 정렬
	  //데이터 전송
	  model.addAttribute("list", list);
	
			 
	  return "user/cart_list";
	}
	
	@GetMapping("/cart_cancel")
	public String cart_cancel(@RequestParam("no") int no, HttpSession session) {
	    List<CartBean> list = (List<CartBean>) session.getAttribute("cart");
	    if (list != null && no >= 0 && no < list.size()) {
	        list.remove(no);
	    }
	    return "redirect:/user/cart_list";
	}

	
}
