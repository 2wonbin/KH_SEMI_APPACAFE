package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.*;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin/userInfoList")
public class userInfoList extends HttpServlet {
//	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub   
		//1. 응답을 위임할 이동경로
		
		// TEST CODE
		String comboVal = request.getParameter("searchType");
		String content  = request.getParameter("searchKeyword");
		String radio    = request.getParameter("radio");
		System.out.println("combo : " + comboVal + "  content : " + content + "  radio :" + radio);
		
		if(comboVal.equals("") || comboVal.equals(null)) {
			comboVal = "1";
			content  = "";
			radio    = "asc";
		}
		adminVo searchVal = new adminVo();
		searchVal.setViewCombo(comboVal);
		searchVal.setViewContent(content);
		searchVal.setViewAlign(radio);
		
		List<adminVo> list = adminService.selectList(searchVal);
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp").forward(request, response);
	}
}
