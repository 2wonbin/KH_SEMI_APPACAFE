package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.adminVo;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin/memberlist")
public class AdminServlet extends HttpServlet {

	private AdminService adminService = new AdminService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub   
		System.out.println("AdminServlet doGet : " + getServletContext().getRequestDispatcher("/views/admin/memberList.jsp"));
		request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp")
		.forward(request, response);//forward()[전달하기]는 클라이언트가 요청하면서 전송한 데이터를 그대로 유지한다
	}///WEB-INF/views/member/login.jsp
}