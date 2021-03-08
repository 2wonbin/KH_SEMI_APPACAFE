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
 * Servlet implementation class CheckNickNameDuplicateServlet
 */
@WebServlet("/member/checkNickNameDuplicate")
public class CheckNickNameDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String nickName = request.getParameter("nickName");
		Member member = memberService.checkNickName(nickName);
		boolean available = (member == null);
		
		System.out.println(nickName);
		
		request.setAttribute("available", available);
		request.getRequestDispatcher("/WEB-INF/views/member/checkNickNameDuplicate.jsp")
			   .forward(request, response);
	}

}
