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
import board.model.vo.SellBoard;

/**
 * Servlet implementation class JoojakList
 */
@WebServlet("/joojakList")
public class JoojakListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BoardService boardService = new BoardService();

	
    public JoojakListServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			final int numPerPage = 5;
			int cPage = 1;
			
			try {
				cPage = Integer.parseInt(request.getParameter("cpage"));			
			}catch(NumberFormatException e) {
				
			}
			
			//리스트 들고오기
			List<SellBoard> list = boardService.selectSellBoardList(cPage, numPerPage); 
			System.out.println("list@servlet="+list);
			
			int totalContents = boardService.selectSellBoardCount();
			
			String url = request.getRequestURI();
			String pageBar = CommonUtil.getPageBarSell(totalContents, cPage, numPerPage, url);
			
			request.setAttribute("list",list);
			request.setAttribute("pageBar",pageBar);
			request.getRequestDispatcher("/WEB-INF/views/joojak/joojakList.jsp")
			   .forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		}
	}


