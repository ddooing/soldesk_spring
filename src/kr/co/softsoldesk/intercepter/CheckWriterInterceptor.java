package kr.co.softsoldesk.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor{

	private UserBean loginUserBean; //@Autowired�� �Ұ���
	private BoardService boardService; //Service�ܿ� �� ���� �ҷ����� �Լ� ����
	
	public CheckWriterInterceptor(UserBean longinUserBean, BoardService boardService){
		this.loginUserBean = longinUserBean;
		this.boardService = boardService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String str1 = request.getParameter("board_id");
		int board_id = Integer.parseInt(str1); 
		
		// 로그인 되면 해제
		BoardBean currentContentBean = boardService.getBoardInfo(board_id);
		
		if(currentContentBean.getUser_id() != loginUserBean.getUser_id()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/board/not_writer");
			
			return false;
		}
	
		return true;
	}
	
	
}
