package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class KaKaoEnrollServlet
 */
@WebServlet("/member/kaKaoEnroll")
public class KaKaoEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public KaKaoEnrollServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sKakaoID = request.getParameter("kakaoID");
		String memberID = request.getParameter("memberID");
		
		
		//형변환
		int kakaoID = Integer.parseInt(sKakaoID);
		System.out.println(kakaoID);
		System.out.println(memberID);
		
			MemberService memberService = new MemberService();
			
			int result = memberService.kakaoEnroll(kakaoID,memberID);
			
			
			String loc = request.getContextPath() + "/member/memberView?memberId=" + memberID;
			response.sendRedirect(loc);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
