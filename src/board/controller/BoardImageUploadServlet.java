package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.MvcFileRenamePolicy;

import java.util.Enumeration;
import java.util.UUID;

@WebServlet("/boardImageUpload")
public class BoardImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardImageUploadServlet() {
        super();
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String saveDirectory = getServletContext().getRealPath("/upload/board");
		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		PrintWriter printWriter = null;
		response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=utf-8");
    	
		try {
			MultipartRequest multipartReq = 
					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			String fileName = multipartReq.getFilesystemName("upload");
	
			printWriter = response.getWriter();
			String fileUrl = "boardImageBrowse?filename=" + fileName;
			printWriter.println("{\"filename\" : \"" + fileName+"\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(printWriter != null) {
					printWriter.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
