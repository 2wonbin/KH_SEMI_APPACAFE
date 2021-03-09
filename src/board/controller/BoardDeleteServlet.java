package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

@WebServlet("/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
       
    public BoardDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardType = request.getParameter("boardType");
		
		int result = boardService.deleteBoard(boardNo,boardType);
		
		String msg = result > 0 ? "게시물 삭제 성공!" : "게시물 삭제 실패!";
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/boardList?boardType=" + boardType);
	}

}
