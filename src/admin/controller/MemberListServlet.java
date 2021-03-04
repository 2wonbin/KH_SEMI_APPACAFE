package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.vo.Member;
import common.util.CommonUtil;



@WebServlet("/admin/memberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminService adminService = new AdminService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력값
				int cPage = 1; 
				try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
				} catch(NumberFormatException e) {
					//예외가 발생한 경우, cPage는 1로 유지한다.
				}
				int numPerPage = 10;	//페이지당 보여질 컨텐츠 개수
				
				//2. 업무로직
				List<Member> list = adminService.selectList(cPage, numPerPage);	//의도: 회원가입일 내림차순 정렬 // 210215 : 페이징을 위해 페이지 관련 변수 인자로 설정
			//	System.out.println(list);
					
				// 페이지 바 처리
				int totalContents = adminService.selectTotalMembers();
//				System.out.println(totalContents);
				String url = request.getRequestURI();
				String pageBar = CommonUtil.getPageBar(totalContents, cPage, numPerPage, url);
//				System.out.println(pageBar);
				//3. view단 처리: forwarding
				request.setAttribute("list", list);
				request.setAttribute("pageBar", pageBar);
				request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
