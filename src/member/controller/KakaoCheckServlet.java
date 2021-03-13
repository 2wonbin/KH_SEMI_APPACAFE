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
 * Servlet implementation class KakaocheckServlet
 */
@WebServlet("/member/kakaoCheck")
public class KakaoCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			 String sKakaoID = request.getParameter("kakaoID");
			  System.out.println(sKakaoID);
			
			  //여기서 kakoId가져가서 db에서 맴버아이디 가져와야됨
			 
			  Member member = null;
			  Member membercheck = memberService.findPeristalsis(sKakaoID);
			  
			   
			  if (membercheck != null) {
				  String memberId = membercheck.getMemberId();
				  member  = memberService.selectMember(memberId); 
				  HttpSession session = request.getSession(true);
			     session.setAttribute("memberLoggedIn", member);
				   response.sendRedirect(request.getContextPath());
			  } else {
				  	Boolean check = true;
				  	
				  	HttpSession session = request.getSession(true);
					session.setAttribute("msg", "먼저 연동해주세요");
					session.setAttribute("kakaoLogout", check);	
					response.sendRedirect(request.getContextPath());
			  }				
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
