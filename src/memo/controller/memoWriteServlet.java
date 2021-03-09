package memo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import memo.model.service.MemoService;
import memo.model.vo.MemoVo;

/**
 * Servlet implementation class memoWriteServlet
 */
@WebServlet("/memo/memoWrite")
public class memoWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoService memoService = new MemoService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int receiver = Integer.parseInt(request.getParameter("receiver"));
		
		String nickname = memoService.selectMemeberNickname(receiver);
		
		request.setAttribute("receiver", receiver);
		request.setAttribute("receiver_nickname", nickname);
		
		request.getRequestDispatcher("/WEB-INF/views/memo/memoWrite.jsp")
		   .forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int receiver = Integer.parseInt(request.getParameter("receiver"));
		int sender = Integer.parseInt(request.getParameter("sender"));
		String content = request.getParameter("content");
		
		String msg = null;
		MemoVo memo = new MemoVo(0, null, sender, null, receiver, null, content, null);
		int result = memoService.insertMemo(memo); 
		
		if(result > 0){
			msg = "성공적으로 쪽지를 보냈습니다.";
		}
		else {
			msg = "쪽지 발송에 실패했습니다.";	
		}
		
		request.setAttribute("msg", msg);
		
		
		response.sendRedirect(request.getContextPath() + "/memo/memoList?receiver=" + sender);
	}

}
