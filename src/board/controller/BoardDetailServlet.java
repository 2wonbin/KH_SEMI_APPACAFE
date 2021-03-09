package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.exception.BoardException;
import board.model.service.BoardService;
import board.model.vo.BoardComment;
import board.model.vo.BoardVo;

@WebServlet("/boardDetail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

    public BoardDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		int boardNo = 0;
		try {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		} catch (NumberFormatException e) {
			throw new BoardException("유효한 게시글 번호가 아닙니다 : \"" + request.getParameter("boardNo") + "\"", e);
		}
		
		int result = boardService.updateBoardReadCount(boardNo);// +1
		BoardVo board = boardService.selectBoard(boardNo, boardType);
		if(board == null) {
			throw new BoardException("해당 게시글이 존재하지 않습니다. : " + boardNo);			
		}
		
		
		List<BoardComment> commentList = boardService.selectCommentList(boardNo);
		
		request.setAttribute("commentList", commentList);
		request.setAttribute("board", board);
		request.setAttribute("boardType", boardType);
		request.getRequestDispatcher("/WEB-INF/views/board/boardDetail.jsp")
		   .forward(request, response);
	}

}
