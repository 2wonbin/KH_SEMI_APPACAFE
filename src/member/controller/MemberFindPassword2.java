package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.util.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPassword2
 */
@WebServlet("/member/findPassword2")
public class MemberFindPassword2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String newPassword = MvcUtils.getEncryptedPassword(request.getParameter("newPassword"));
		String view = "/index.jsp";
		
//		System.out.println(memberId);
//		System.out.println(newPassword);
		
		Member member = memberService.selectMember(memberId);
		
//		System.out.println(member.toString());
		
		String msg = "";
		String loc = request.getContextPath();
		
		if(member != null){
			
			member.setPassword(newPassword);
			
			int result = memberService.passwordChange(member);
			
			if(result > 0)
				msg = "패스워드 변경 성공!";
			else 
				msg = "패스워드 변경 실패!";
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		
	}

}
