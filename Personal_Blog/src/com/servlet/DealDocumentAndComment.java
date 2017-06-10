package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.notes.model.ArticleComment;
/**
 * Servlet implementation class DealComment
 */
@WebServlet("/DealDocumentAndComment")
public class DealDocumentAndComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealDocumentAndComment() {
        super();
        // TODO Auto-generated constructor stub
    }
    String webPath;
    public void init()throws ServletException
    {
    	webPath=getServletContext().getRealPath("/");
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName=request.getParameter("filename");
		String fileType=request.getParameter("filetype");
		ArticleComment articleComment=new ArticleComment(fileType,fileName);
		ArrayList<String> commentList=articleComment.getAllComment(webPath);
		//System.out.println(commentList);
		request.setAttribute("filename", fileName);
		request.setAttribute("filetype", fileType);
		request.setAttribute("filecomment", commentList);
		RequestDispatcher view=request.getRequestDispatcher("./ArticleDisplayTemplate.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//**************************************************
		request.setCharacterEncoding("utf-8");
		
		String comment=request.getParameter("comments");
		String type=request.getParameter("filetype");
		String fileName=request.getParameter("filename");
		ArticleComment articleComment=new ArticleComment(type,fileName);
		request.setAttribute("filename", fileName);
		request.setAttribute("filetype", type);
		//System.out.println("filename");
		if(!comment.equals(""))
		{
			articleComment.addNewComment(webPath, comment);
			/*for(int i=0;i<commentList.size();++i)
			{
				System.out.println(commentList.get(i));
			}*/
		}
		ArrayList<String> commentList=articleComment.getAllComment(webPath);
		request.setAttribute("filecomment", commentList);
		RequestDispatcher view=request.getRequestDispatcher("./ArticleDisplayTemplate.jsp");
		view.forward(request, response);
	}
}
