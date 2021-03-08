package member.controller;

import java.io.IOException;
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
 * Servlet implementation class MemberPasswordChangeServlet
 */
@WebServlet("/member/passwordChange")
public class MemberPasswordChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/passwordChange.jsp")
		   	   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String password = MvcUtils.getEncryptedPassword(request.getParameter("password"));
		String newPassword = MvcUtils.getEncryptedPassword(request.getParameter("newPassword"));
		
		Member member = memberService.selectMember(memberId);
		
		String msg = "";
		String loc = request.getContextPath();
		
		if(member != null && password.equals(member.getPassword())){
			
			member.setPassword(newPassword);
			
			int result = memberService.passwordChange(member);
			
			if(result > 0)
				msg = "패스워드 변경 성공!";
			else 
				msg = "패스워드 변경 실패!";
			
		}
		else {
			
			msg = "패스워드를 잘못 입력하셨습니다.";
			loc += "/member/updatePassword?memberId=" + memberId;
			
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		response.sendRedirect(loc);
	}

}
