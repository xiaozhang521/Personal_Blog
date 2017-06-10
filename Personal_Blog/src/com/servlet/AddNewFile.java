package com.servlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewFile
 */
@WebServlet("/AddNewFile")
public class AddNewFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BufferedInputStream fileIn=new BufferedInputStream(request.getInputStream());
		String fileName=request.getParameter("filename");
		byte[] buf = new byte[1024];
		String path=getServletContext().getRealPath("/");
		File file = new File(path +"Notes/p/"+ fileName);
		if(file.exists()) response.getWriter().append("exit");
		else response.getWriter().append("not exit");
		BufferedOutputStream fileOut = new BufferedOutputStream(new FileOutputStream(file)); 
		while (true) { 
		      int bytesIn = fileIn.read(buf, 0, 1024); 
		      System.out.println(bytesIn); 
		      if (bytesIn == -1) 
		      { 
		    	  	break; 
		      } 
		      else 
		      { 
		         fileOut.write(buf, 0, bytesIn); 
		      }
		} 
		fileOut.flush(); 
		fileOut.close();
	}

}
