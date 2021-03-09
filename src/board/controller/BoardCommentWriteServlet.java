package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.exception.BoardException;
import board.model.service.BoardService;
import board.model.vo.BoardComment;

@WebServlet("/boardCommentWrite")
public class BoardCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
       
    public BoardCommentWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int boardNo = 0;
		try {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		} catch (NumberFormatException e) {
			throw new BoardException("유효한 게시글 번호가 아닙니다 : \"" + request.getParameter("boardNo") + "\"", e);
		}
		String boardType = request.getParameter("boardType");
		int boardCommentLevel = Integer.parseInt(request.getParameter("boardCommentLevel"));
		String boardCommentContent = request.getParameter("boardCommentContent");
		int boardCommentRef = request.getParameter("boardCommentRef") != null ? Integer.parseInt(request.getParameter("boardCommentRef")) : 0;
		String boardCommentWriter = request.getParameter("boardWriter");
		
		BoardComment boardComment = new BoardComment();
		boardComment.setBoardCommentLevel(boardCommentLevel);
		boardComment.setBoardCommentContent(boardCommentContent);
		boardComment.setBoardRef(boardNo);
		boardComment.setBoardCommentRef(boardCommentRef);
		boardComment.setBoardCommentWriter(boardCommentWriter);
		
		int result = boardService.insertBoardComment(boardComment);
		String msg = result > 0 ? "댓글 등록 성공!" : "댓글 등록 실패!";
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/boardDetail?boardType=" + boardType + "&boardNo=" + boardNo);
	}

}
