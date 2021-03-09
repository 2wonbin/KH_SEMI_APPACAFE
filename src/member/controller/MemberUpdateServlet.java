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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zoneCode = request.getParameter("zoneCode");
		String roadAddress = request.getParameter("roadAddress");
		String detail = request.getParameter("detail");
		
		Member member = new Member(0, memberId, null, null, nickName, null, email, phone, zoneCode, roadAddress, detail, null, null, null, null, null, null);
		
		int result = memberService.updateMember(member);  
		
		System.out.println("member@memberUpdate" + member.toString());
		
		String msg = null;
		String loc = request.getContextPath() + "/member/memberView?memberId=" + member.getMemberId();
		HttpSession session = request.getSession();
		if(result > 0){
			msg = "성공적으로 회원정보를 수정했습니다.";
			
			//세션의 memberLoggedIn객체도 최신화
			session.setAttribute("memberLoggedIn", memberService.selectMember(memberId));
		}
		else {
			msg = "회원정보수정에 실패했습니다.";	
		}
		
		session.setAttribute("msg", msg);
		
		response.sendRedirect(loc);
	}

}
