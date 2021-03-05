package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/memberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/login.jsp")
		   .forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		
		Member member = memberService.selectMember(memberId);
		
		if(member != null && password.equals(member.getPassword())) {
			HttpSession session = request.getSession(true);
			session.setAttribute("memberLoggedIn", member);
			
//			String location = request.getHeader("referer"); //http://localhost:9090/father/
			String location = request.getContextPath(); //http://localhost:9090/father/
			response.sendRedirect(location); 
		} else {
			
			HttpSession session = request.getSession(true);
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			response.sendRedirect(request.getContextPath());
		}
		
	}

}
