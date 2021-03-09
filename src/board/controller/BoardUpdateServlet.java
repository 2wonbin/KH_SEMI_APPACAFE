package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.exception.BoardException;
import board.model.service.BoardService;
import board.model.vo.BoardVo;

@WebServlet("/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
       
    public BoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		int boardNo;
		try{
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}catch(NumberFormatException e){
			throw new BoardException("유효하지 않은 게시글입니다.");
		}
		
		BoardVo b = boardService.selectBoard(boardNo, boardType);
		
		request.setAttribute("board", b);
		request.getRequestDispatcher("/WEB-INF/views/board/boardUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardType = request.getParameter("boardType");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent= request.getParameter("boardContent");
		
		BoardVo board = new BoardVo();
		board.setBoardType(boardType);
		board.setBoardNo(boardNo);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent.replaceAll("(\r\n|\r|\n|\n\r)", " "));
		
		int result = boardService.updateBoard(board);
		String location = request.getContextPath() + "/boardDetail?boardType=" + boardType + "&boardNo=" + boardNo;
		
		String msg = result > 0 ? "게시글 수정 성공!" : "게시글 수정 실패!";
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(location);
	}

}
