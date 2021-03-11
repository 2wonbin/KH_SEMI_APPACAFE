package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class KakaoDeleteServlet
 */
@WebServlet("/member/kakaoDelete")
public class KakaoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String sKakaoID = request.getParameter("kakaoID");
		String memberID = request.getParameter("memberID");
		
		
		//형변환
//		int kakaoID = Integer.parseInt(sKakaoID);
//		System.out.println("delete" + kakaoID);
		System.out.println("delete" + memberID);
		
		MemberService memberService = new MemberService();
		
		int result = memberService.kakaoDelete(memberID);
		
//		System.out.println("deleteafter" + kakaoID);
		System.out.println("deleteafter" + memberID);
		
		String loc = request.getContextPath() + "/member/memberView?memberId=" + memberID;
		response.sendRedirect(loc);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
