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
 * Servlet implementation class MemberFindIdServlet
 */
@WebServlet("/member/findId")
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request
		.getRequestDispatcher("/WEB-INF/views/member/findId.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberName = request.getParameter("inputName");
		String ssn = request.getParameter("inputSsn");
		
		String msg = "";
		Member member = memberService.findId(memberName, ssn);
		
		if(member != null) {
			
			String memberId = member.getMemberId();
//			System.out.println(memberId);
			
			request.setAttribute("memberId", memberId);
			request.getRequestDispatcher("/WEB-INF/views/Find/findIdResult.jsp")
			.forward(request, response);
			
		} else {
			
			msg = "올바른 정보를 입력해주세요.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/views/member/findId.jsp")
			.forward(request, response);
			
		}
		
			
	}

}
