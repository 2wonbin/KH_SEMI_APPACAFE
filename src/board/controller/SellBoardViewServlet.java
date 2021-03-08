package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.SellBoard;



@WebServlet("/sellBoardView")
public class SellBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
    
   
    public SellBoardViewServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//1. 사용자 입력값 처리
			int boardNo = 0;
			
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
			
			
			//2. 업무로직 : 게시글 조회
			
			//조회수 증가
//			int result = boardService.updateSellBoardReadCount(boardNo);// +1
			SellBoard board = boardService.selectSellBoard(boardNo);
			
	
			
			//content 추가처리 
			//XSS공격대비
			String boardContent = board.getBoardContent()
									   .replaceAll("<", "&lt;")
									   .replaceAll(">", "&gt;");
			//개행문자
			boardContent = boardContent.replaceAll("\\n", "<br>");
			
			board.setBoardContent(boardContent);
			
			System.out.println("board@BoardViewServlet = " + board);
			
			//댓글목록 
//			List<BoardComment> commentList = boardService.selectCommentList(boardNo);
			
			
			//3. view단처리 : jsp forwarding
			request.setAttribute("board", board);

//			request.setAttribute("commentList", commentList);
			
			request.getRequestDispatcher("/WEB-INF/views/joojak/SellBoardView.jsp")
				   .forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
