package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.BoardVo;
import common.MvcFileRenamePolicy;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boardWrite")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardService();
       
    public BoardWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/boardWrite.jsp")
		   .forward(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = getServletContext().getRealPath("/upload/board");
		
		int maxPostSize = 10 * 1024 * 1024;
		
		String encoding = "utf-8";
		
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
		MultipartRequest multipartReq = 
				new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		

		String boardTitle = multipartReq.getParameter("boardTitle");
		String boardWriter= multipartReq.getParameter("boardWriter");
		String boardContent = multipartReq.getParameter("boardContent");
		String boardOriginalFileName = multipartReq.getOriginalFileName("upFile");
		String boardRenamedFileName = multipartReq.getFilesystemName("upFile");
		
		BoardVo board = 
				new BoardVo(0, boardTitle, boardWriter, 
						boardContent, boardOriginalFileName, boardRenamedFileName, 
						null, 0);
		System.out.println("board-before@servlet = " + board);
		
		int result = boardService.insertBoard(board);
		System.out.println("board-after@servlet = " + board);
		
		String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!"; 
		String location = result > 0 ?
							request.getContextPath() + "/boardDetail?boardNo=" + board.getBoardNo() : 
								request.getContextPath() + "/board";
							
				
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(location);
	}

}
