package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.BoardVo;

@WebServlet("/boardWrite")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService boardService = new BoardService();
	
    public BoardWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		
		request.setAttribute("boardType", boardType);
		request.getRequestDispatcher("/WEB-INF/views/board/boardWrite.jsp")
		   .forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardType = request.getParameter("boardType");
		String boardWriter = request.getParameter("boardWriter");
		
		BoardVo board = new BoardVo();
		board.setBoardType(boardType);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent.replaceAll("(\r\n|\r|\n|\n\r)", " "));
		board.setBoardWriter(boardWriter);
		
		int result = boardService.insertBoard(board);
		System.out.println(board.getBoardNo());
		String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!"; 
		String location = result > 0 ?
							request.getContextPath() + "/boardDetail?boardType=" + boardType + "&boardNo=" + board.getBoardNo() : 
								request.getContextPath() + "/boardList?boardType=" + boardType;
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(location);
	}

}
