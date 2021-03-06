package test;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ImageUploadServelet
 */
@WebServlet("/ImageUpload")
public class ImageUploadServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ImageUploadServelet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 10*1024*1024;
		 String encType = "utf-8";
		 String savefile = "img";
		 ServletContext scontext = getServletContext();
		 realFolder = scontext.getRealPath(savefile);
		 
		 
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		  
		  //db 처리시 변경
		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		
		 
		 String fullpath = "../../.."+request.getContextPath()+"/img/" + filename1;
		 request.setAttribute("fullpath", fullpath);
		 System.out.println();
		 request.getRequestDispatcher("/WEB-INF/views/test/imgup.jsp")
		   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
