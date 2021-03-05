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
 * Servlet implementation class MemberViewServlet
 */
@WebServlet("/member/memberView")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memberId = request.getParameter("memberId");
		
		Member member = memberService.selectMember(memberId);
		
		request.setAttribute("member", member);
		request.getRequestDispatcher("/WEB-INF/views/member/memberView.jsp")
			   .forward(request, response);
	}

}
