package com.download.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import com.notes.model.SearchAllFile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notes.model.SearchAllFile;

/**
 * Servlet implementation class sourceDeal
 */
@WebServlet("/sourceDeal")
public class sourceDeal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sourceDeal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=getServletContext().getRealPath("/");
		SearchAllFile searchFile=new SearchAllFile();
		String[] sourceName=searchFile.searchSourceFlie(path);
		request.setAttribute("sourcename", sourceName);
		RequestDispatcher view=request.getRequestDispatcher("./ShowIndex.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedInputStream fileIn=new BufferedInputStream(request.getInputStream());
		String fileName=request.getParameter("filename");
		fileName = new String(fileName.getBytes("ISO-8859-1"),"UTF-8"); 
		byte[] buf = new byte[1024];
		String path=getServletContext().getRealPath("/");
		File file = new File(path +"Download/Source/"+ fileName);
		//System.out.println(file);
		if(file.exists()) response.getWriter().append("exit");
		else response.getWriter().append("not exit");
		BufferedOutputStream fileOut = new BufferedOutputStream(new FileOutputStream(file)); 
		while (true) { 
		      int bytesIn = fileIn.read(buf, 0, 1024); 
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
