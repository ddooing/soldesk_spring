package kr.co.softsoldesk.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.CommentBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor {

    private UserBean loginUserBean;
    private BoardService boardService;

    @Autowired
    public CheckWriterInterceptor(UserBean loginUserBean, BoardService boardService) {
        this.loginUserBean = loginUserBean;
        this.boardService = boardService;
    }
   

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
       
    	 String contextPath = request.getContextPath();
    	    try {
    	        String strBoardId = request.getParameter("board_id");
    	        if (strBoardId != null && !strBoardId.isEmpty()) {
    	            int boardId = Integer.parseInt(strBoardId);
    	            BoardBean currentBoardBean = boardService.getBoardInfo(boardId);
    	            if (currentBoardBean != null && currentBoardBean.getUser_id() != loginUserBean.getUser_id() && loginUserBean.getState() != 3) {
    	                response.sendRedirect(contextPath + "/not_authorized");
    	                return false;
    	            }
    	        }

    	        
    	    } catch (NumberFormatException e) {
    	        // log error or handle exception
    	        response.sendRedirect(contextPath + "/error");
    	        return false;
    	    }
        
        return HandlerInterceptor.super.preHandle(request, response, handler);
        
    }
}
