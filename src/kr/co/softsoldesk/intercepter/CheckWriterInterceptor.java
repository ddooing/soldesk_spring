package kr.co.softsoldesk.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.Beans.BoardBean;
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
       
    	String strBoardId = request.getParameter("board_id");
        int boardId = Integer.parseInt(strBoardId);
        System.out.println(loginUserBean.getUser_id());
        
        BoardBean currentBoardBean = boardService.getBoardInfo(boardId);
        
        if(currentBoardBean.getUser_id() != loginUserBean.getUser_id() && loginUserBean.getState() != 3) {
        	
        	System.out.println(currentBoardBean.getUser_id());
        	
            String contextPath = request.getContextPath();
            // 수정 또는 삭제 권한이 없는 경우에 대한 처리
            if(request.getRequestURI().contains("/modify")) {
                response.sendRedirect(contextPath + "/board/modify_not");
            } else if(request.getRequestURI().contains("/delete")) {
            	response.sendRedirect(contextPath + "/board/delete_not");
            } 
            return false;
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
        
    }
}
