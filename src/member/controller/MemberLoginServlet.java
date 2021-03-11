package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.util.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/login.jsp")
		   .forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		
		String memberId = request.getParameter("memberId");
		String password = MvcUtils.getEncryptedPassword(request.getParameter("password"));
		String saveId = request.getParameter("saveId");
		
		member = memberService.selectMember(memberId);
		
		String delFlag = member.getDelFlag();
		System.out.println(delFlag);
		
		if(member != null && password.equals(member.getPassword()) && delFlag.equals("N")) {
			HttpSession session = request.getSession(true);
			session.setAttribute("memberLoggedIn", member);
			
			//saveId쿠키설정
			Cookie c = new Cookie("saveId", memberId);
			
			c.setPath(request.getContextPath());

			//saveId체크한 경우
			if(saveId != null) {
				//유효기간설정(초단위)
				//client(브라우져)에서 쿠키를 보관한 시간설정
				c.setMaxAge(7 * 24 * 60 * 60);
			}
			//saveId체크안한 경우 : 브라우져의 쿠키를 삭제
			else {
				c.setMaxAge(0);//즉시 삭제
			}
			response.addCookie(c);
			
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
