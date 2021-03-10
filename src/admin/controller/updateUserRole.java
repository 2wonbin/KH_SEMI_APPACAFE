package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import admin.controller.userInfoList;
import admin.model.service.AdminService;
import admin.model.vo.adminVo;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/admin/updateUserRole")
public class updateUserRole extends HttpServlet {
//	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("do GET");
		//		//1.parameterHandling
//		String auth = request.getParameter("member_role");
//		adminVo adminVo = new adminVo();
//		adminVo.setMember_role(auth);
//		//2.businessLogic
//		int result = adminService.updateUserRole(adminVo);
//		
//		//3.view
//		request.setAttribute("board", b);
//		request.getRequestDispatcher("/WEB-INF/views/board/boardUpdate.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		String auth = request.getParameter("memberRole1");
		System.out.println("auth : " + auth);
		String memberId = request.getParameter("memberId1");
		System.out.println("no : " + memberId);
		String del_flag = request.getParameter("delFlag1");
		System.out.println("del_flag : " + del_flag);
		
		adminVo adminVo = new adminVo();
		adminVo.setMemberRole(auth);
		adminVo.setMemberId(memberId);
		adminVo.setDelFlag(del_flag);
		
		//2.businessLogic
		int result = adminService.updateUserRole(adminVo);
		System.out.println("result : " + result);
		//String location = request.getContextPath() + "/admin/memberlist.jsp";
							
				
		//3.사용자 피드백(msg) 및 redirect처리
		//DML이후 반드시 요청url을 변경할 것
		//response.sendRedirect(location);
		//request.getRequestDispatcher("/WEB-INF/views/admin/memberlist.jsp").forward(request, response);
		
		
		//다시 조회
		adminVo searchVal = new adminVo();
		searchVal.setViewCombo("1");
		searchVal.setViewContent("");
		searchVal.setViewAlign("");
		
		List<adminVo> list = adminService.selectList(searchVal);
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.parameterHandling
//		System.out.println("asdgasdgasdgasdgaewrgaerwgarwegaergawergawergargaergawrg");
//		String auth = request.getParameter("member_role");
//		String member_no = request.getParameter("member_no");
//		adminVo adminVo = new adminVo();
//		adminVo.setMember_role(auth);
//		adminVo.setMember_no(member_no);
//		
//		//2.businessLogic
//		int result = adminService.updateUserRole(adminVo);
//		System.out.println("result : " + result);
//		String location = request.getContextPath() + "/admin/memberlist.jsp";
//							
//				
//		//3.사용자 피드백(msg) 및 redirect처리
//		//DML이후 반드시 요청url을 변경할 것
//		response.sendRedirect(location);
		
		String auth = request.getParameter("memberRole1");
		System.out.println("auth : " + auth);
		String memberId = request.getParameter("memberId1");
		System.out.println("no : " + memberId);
		String del_flag = request.getParameter("delFlag1");
		System.out.println("del_flag : " + del_flag);
		
		adminVo adminVo = new adminVo();
		adminVo.setMemberRole(auth);
		adminVo.setMemberId(memberId);
		adminVo.setDelFlag(del_flag);
		
		//2.businessLogic
		int result = adminService.updateUserRole(adminVo);
		System.out.println("result : " + result);
		//String location = request.getContextPath() + "/admin/memberlist.jsp";
							
				
		//3.사용자 피드백(msg) 및 redirect처리
		//DML이후 반드시 요청url을 변경할 것
		//response.sendRedirect(location);
		//request.getRequestDispatcher("/WEB-INF/views/admin/memberlist.jsp").forward(request, response);
		
		
		//다시 조회
		adminVo searchVal = new adminVo();
		searchVal.setViewCombo("1");
		searchVal.setViewContent("");
		searchVal.setViewAlign("");
		
		List<adminVo> list = adminService.selectList(searchVal);
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp").forward(request, response);
	
	}

}
