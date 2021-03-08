package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.BoardVo;
import common.util.CommonUtil;


@WebServlet("/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
       
    public BoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		try {
			final int numPerPage = 5;
			int cpage = 1;
			String boardType = request.getParameter("boardType");
			
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			}catch(NumberFormatException e) {

			}
			
			List<BoardVo> list = boardService.selectBoardList(cpage, numPerPage, boardType); 
			int totalContents = boardService.selectBoardCount(boardType);
			
			String url = request.getRequestURI();
			String pageBar = CommonUtil.getPageBar(totalContents, cpage, numPerPage, url);
			
			request.setAttribute("boardType", boardType);
			request.setAttribute("list",list);
			request.setAttribute("pageBar",pageBar);
			request.getRequestDispatcher("/WEB-INF/views/board/boardList.jsp")
			   .forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
