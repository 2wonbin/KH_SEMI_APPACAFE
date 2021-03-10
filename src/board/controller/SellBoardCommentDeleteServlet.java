package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class SellBoardCommentDeleteServlet
 */
@WebServlet("/board/SellBoardCommentDelete")
public class SellBoardCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
    public SellBoardCommentDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		request.setCharacterEncoding("UTF-8");
		int boardCommentNo = Integer.parseInt(request.getParameter("boardCommentNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		int result = boardService.deleteSellBoardComment(boardCommentNo);
		String msg = result > 0 ? "댓글 삭제 성공!" : "댓글 삭제 실패!";
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/sellBoardView?boardNo=" + boardNo);
	
	}
}
