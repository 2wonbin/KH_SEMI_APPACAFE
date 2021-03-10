package memo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.service.MemoService;
import memo.model.vo.MemoVo;

/**
 * Servlet implementation class memoContentServlet
 */
@WebServlet("/memo/memoContent")
public class memoContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoService memoService = new MemoService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// get 으로 메모 번호 받아다가
			int memoNo = Integer.parseInt(request.getParameter("memoNo"));
			
			// 그 메모 번호의 쪽지를 읽음 상태로 바꾼다.
			int result = memoService.readMemo(memoNo);
			
			// 그 메모 번호에 맞는걸 가져온다
			MemoVo memo = memoService.selectMemo(memoNo);
			
			request.setAttribute("memo",memo);
			
			request.getRequestDispatcher("/WEB-INF/views/memo/memoContent.jsp")
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
