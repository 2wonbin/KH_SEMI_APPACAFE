package memo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.ParseConversionEvent;

import board.model.vo.BoardVo;
import common.util.CommonUtil;
import memo.model.service.MemoService;
import memo.model.vo.MemoVo;
import board.model.service.BoardService;

/**
 * Servlet implementation class memoListServlet
 */
@WebServlet("/memo/memoList")
public class memoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoService memoService = new MemoService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			final int numPerPage = 5;
			int cpage = 1;
			int receiver = Integer.parseInt(request.getParameter("receiver"));
			
			try {
				cpage = Integer.parseInt(request.getParameter("cpage"));
			}catch(NumberFormatException e) {

			}
			
			List<MemoVo> list = memoService.selectMemoList(cpage, numPerPage, receiver); 
			//int totalContents = boardService.selectBoardCount(receiver);
			
			String url = request.getRequestURI();
			//String pageBar = CommonUtil.getPageBar(totalContents, cpage, numPerPage, url);
			
			//request.setAttribute("boardType", boardType);
			request.setAttribute("list",list);
			//request.setAttribute("pageBar",pageBar);
			request.getRequestDispatcher("/WEB-INF/views/memo/memoList.jsp")
			   .forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
