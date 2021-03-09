package board.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.SellBoard;
import common.MvcFileRenamePolicy;

/**
 * Servlet implementation class ImageUploadServelet
 */
@WebServlet("/sellBoardEnroll")
public class SellBoardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SellBoardEnrollServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 request.setCharacterEncoding("UTF-8");
		 String realFolder = "";
		 int maxSize = 20*1024*1024;
		 String encType = "utf-8";
		 
		 realFolder = getServletContext().getRealPath("img");
		 
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
			System.out.println(realFolder);
		 
		  MultipartRequest multipartReq=new MultipartRequest(request, realFolder, maxSize, encType, policy);
		  
		  //db 처리시 변경
		  
		
		String boardTitle = multipartReq.getParameter("boardTitle");
		String productName= multipartReq.getParameter("productName");
		String seller = multipartReq.getParameter("seller");
		String boardOriginalFileName = multipartReq.getOriginalFileName("filename");
		String boardRenamedFileName = multipartReq.getFilesystemName("filename");
		String sPrice = multipartReq.getParameter("price");
		String boardContent = multipartReq.getParameter("boardContent");
			
		 //필요데이터 형변환
		 int price =Integer.parseInt(sPrice);
		  
		 //vo 저장
		 SellBoard sellBoard = new SellBoard( 0, boardTitle, productName, seller, boardOriginalFileName, 
				 boardRenamedFileName, price, boardContent, null);
		 
		 
		 //서비스 호출
		 BoardService boardService = new BoardService();
		 int result = boardService.enrollSellBoard(sellBoard);
		 //
//		 String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!"; 
			//board.getBoardNo()를 통해서 새로 등록된 게시글 번호 가져오기
			String location = request.getContextPath() + "/joojakList";
									
			
								
//			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(location);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
