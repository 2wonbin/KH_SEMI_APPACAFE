package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;

/**
 * Servlet implementation class AdminUpdateMemberRoleServlet
 */
@WebServlet("/admin/updateMemberRole")
public class AdminUpdateMemberRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력값	memberId | memberRole
		String memberId = request.getParameter("memberId");
		String memberRole = request.getParameter("memberRole");
		
		//2. 업무로직	service단에 updateMemberRole(memberId,MemberRole) >> int(처리 결과)를 리턴
		int result = adminService.updateMemberRole(memberId, memberRole);
//		System.out.println(result);
		//3. view단 처리: DML ? sendRedirect! (/mvc/admin/memberList")
		//4. 메시지 처리 : "정상적으로 변경되었습니다." | "변경에 실패했습니다."
		String msg = result > 0? "정상적으로 변경되었습니다" : "변경에 실패했습니다.";
		HttpSession session = request.getSession();

		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/admin/memberList");
	}

}
