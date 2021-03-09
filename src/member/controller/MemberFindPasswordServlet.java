package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPasswordServlet
 */
@WebServlet("/member/findPassword")
public class MemberFindPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request
		.getRequestDispatcher("/WEB-INF/views/member/findPassword.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String ssn = request.getParameter("inputSsn");
		String answer = request.getParameter("answer");
		
		String msg = "";
		Member member = memberService.findPassword(memberId, ssn, answer);
		
//		System.out.println(memberId);
//		System.out.println(ssn);
//		System.out.println(answer);
		
		if(member != null) {
			
			memberId = member.getMemberId();
			System.out.println(memberId);
			
			request.setAttribute("memberId", memberId);
			request.getRequestDispatcher("/WEB-INF/views/Find/findPasswordResult.jsp")
			.forward(request, response);
			
		} else {
			
			msg = "올바른정보를 입력해주세요.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/views/member/findPassword.jsp")
			.forward(request, response);
			
		}
		
	}

}
