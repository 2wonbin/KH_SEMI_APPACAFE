package memo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import memo.model.service.MemoService;
import memo.model.vo.MemoVo;


/**
 * Servlet implementation class CountUnreadMemoServlet
 */
@WebServlet("/memo/CountUnreadMemo")
public class CountUnreadMemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoService memoService = new MemoService();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int receiver = Integer.parseInt(request.getParameter("receiver"));
			
			int unreadMemo = memoService.countUnReadMemo(receiver); 
//			request.setAttribute("unreadMemo", unreadMemo);
			
//			request.getRequestDispatcher("/WEB-INF/views/memo/memoList.jsp")
//			   .forward(request, response);
//			response.getWriter().append("Served at: ").append(Integer.toString(unreadMemo));
			
			
			JSONObject obj = new JSONObject();
			obj.put("unreadMemo", unreadMemo);

			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(obj);
			  
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
