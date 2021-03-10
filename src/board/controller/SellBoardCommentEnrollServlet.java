package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.BoardComment;
import board.model.vo.SellBoardComment;


@WebServlet("/board/sellBoardCommentInsert")
public class SellBoardCommentEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//1.파라미터 처리
		int boardRef = Integer.parseInt(request.getParameter("boardRef"));
		int boardCommentLevel = Integer.parseInt(request.getParameter("boardCommentLevel"));
		int boardCommentRef = Integer.parseInt(request.getParameter("boardCommentRef"));
		String boardCommentWriter = request.getParameter("boardCommentWriter");
		String boardCommentContent = request.getParameter("boardCommentContent");
		
		SellBoardComment bc = new SellBoardComment(0, boardCommentLevel, boardCommentWriter, boardCommentContent, boardRef, boardCommentRef, null);
		System.out.println("bc@BoardCommentInsertServlet = " + bc);
		
		//2. 업무로직 : 댓글 등록
		int result = boardService.insertSellBoardComment(bc);
		
		//3. 메세지 session속성 저장 및  리다이렉트처리
	
		response.sendRedirect(request.getContextPath() + "/sellBoardView?boardNo=" + boardRef);
	}

}
