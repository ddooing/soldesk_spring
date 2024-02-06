package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.Beans.CartBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Service.ExhibitionService;


@Controller
@RequestMapping("/user")
public class CartController {
	
	@Autowired
    private ExhibitionService exhibitionService;
	
	@PostMapping("/cart_insert") // /board/main
	public String cart_insert(@ModelAttribute("tempReserveBean") ReserveBean tempReserveBean,
			HttpSession session,Model model, RedirectAttributes redirectAttributes) {
		
		System.out.println("cart insert 컨트롤러 실행됨");
		
		
	 List < CartBean > list = (List < CartBean > ) session.getAttribute("cart");
	  //처음 이후에는 세션에 저장된 데이터를 불러옴 -> 맨 처음에만 메모리 할당을 하도록 한다.
	  if (list == null) {
	    list = new ArrayList < CartBean > ();
	  }
	  
	  
	  System.out.println("cart insert 컨트롤러 - ");
	  System.out.println("cart insert 컨트롤러 실행됨"+tempReserveBean.getReserve_date());
	System.out.println("cart insert 컨트롤러 실행됨"+tempReserveBean.getOrder_id());
	System.out.println("cart insert 컨트롤러 실행됨"+tempReserveBean.getTicket_count());

	  CartBean cvo = new CartBean();
	  cvo.setExhibition_id(tempReserveBean.getExhibition_id());
	 // cvo.setUser_id(tempReserveBean.getUser_id());
	  cvo.setReserve_date(tempReserveBean.getReserve_date());
	  cvo.setTicket_count(tempReserveBean.getTicket_count());
	  
	  boolean bCheck = false;
	  for (CartBean avo: list) {
	    //이미 장바구니에 들어가 있는 전시회 , 날짜, 티켓수가 똑같으면 추가안함
		 
		  
	    if (	(avo.getExhibition_id()== cvo.getExhibition_id()) 
	    		&& (avo.getReserve_date().equals(cvo.getReserve_date()))
	    		&& (avo.getTicket_count()== cvo.getTicket_count())  				
	    ){
		      bCheck = true;
		      break;
	    }
	  }
	  
	  
	  //새로운 상품을 담은 경우
	 
	  ExhibitionBean exhibitionBean = exhibitionService.getExhibitionDetailInfo(tempReserveBean.getExhibition_id());
	  
	  cvo.setTitle(exhibitionBean.getTitle());
	  cvo.setMain_poster_name(exhibitionBean.getMain_poster_name());
	  cvo.setMain_poster_path(exhibitionBean.getMain_poster_path());
	  cvo.setTotal_price(tempReserveBean.getTicket_count()*exhibitionBean.getPrice()); // 총 티켓 가격
	  System.out.println("cart insert 컨트롤러 실행됨 title : "+exhibitionBean.getTitle());
	  System.out.println("cart insert 컨트롤러 실행됨 main-poster-name : "+exhibitionBean.getMain_poster_name());
		System.out.println("cart insert 컨트롤러 실행됨 main-poster-path"+exhibitionBean.getMain_poster_path());
	  
	  if (bCheck == false) {
	    list.add(cvo);
	    session.setAttribute("cart", list);
	  }
		System.out.println("cart insert 컨트롤러 - tempReserveBean.getExhibition_id "+tempReserveBean.getExhibition_id());
		
		redirectAttributes.addAttribute("exhibition_id", tempReserveBean.getExhibition_id());
	    redirectAttributes.addFlashAttribute("cartMessage", "장바구니에 추가되었습니다.");

	    return "redirect:/exhibition/exhibition_click";
		
		//return "user/cart_insert";
		 //return "redirect:/user/cart_list";
		// 리다이렉트할 URL 구성
	   // String redirectUrl = "/exhibition/exhibition_click?exhibition_id=" + tempReserveBean.getExhibition_id();

	    //return "redirect:" + redirectUrl;
		//return "/exhibition/exhibition_click";
	}
	
	
	@GetMapping("/cart_list")
	public String goods_cart_list(HttpSession session, Model model) {
	  //세션 속에 저장된 장바구니 리스트를 불러 와야 함
	  List < CartBean > list = (List < CartBean > ) session.getAttribute("cart");
	  //데이터 전송
	  model.addAttribute("list", list);
	  return "user/basket";
	}
}
