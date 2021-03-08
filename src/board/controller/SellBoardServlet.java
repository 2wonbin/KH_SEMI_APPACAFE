package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SellBoardServlet
 */
@WebServlet("/sellBoard")
public class SellBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SellBoardServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/WEB-INF/views/joojak/sellBoardEnroll.jsp")
		   .forward(request, response);
	}


}
