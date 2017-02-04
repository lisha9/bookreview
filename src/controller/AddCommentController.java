package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AddCommentDao;
import model.AddComment;
import model.BookDetail;

/**
 * Servlet implementation class AddCommentController
 */
@WebServlet("/addComment")
public class AddCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private HttpSession session;

   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		connection = (Connection) getServletContext().getAttribute("connection");
		BookDetail bookDetail =(BookDetail)session.getAttribute("bookDetail");
		session = request.getSession(false);
		AddComment addComment=new AddComment();
		addComment.setIsbn(bookDetail.getIsbn());
		addComment.setUsername((String) session.getAttribute("username"));
		addComment.setComment(request.getParameter("review"));
		addComment.setRating(request.getParameter("rating"));
		
		int result = 0;
		try {
			result = new AddCommentDao(connection, addComment).addComment();
		} catch (SQLException e) {
			session.setAttribute("message", "You already added comment for this book");
			e.printStackTrace();
		}
		if(result > 0){
			session.setAttribute("message", "Thank you for your review");
		}
		
		response.sendRedirect("viewBook.jsp");
	}

}
