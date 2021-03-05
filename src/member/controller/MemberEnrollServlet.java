package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request
			.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Post타입 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String memberName = request.getParameter("memberName");
		String nickName = request.getParameter("nickName");
		String ssn = request.getParameter("ssn");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		Member member = new Member(0, memberId, password, memberName, nickName, ssn, email, phone, address, null, null, null, null, null);
		
		int result = memberService.addMember(member);
		
		String view = "/index.jsp";
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
	}

}
