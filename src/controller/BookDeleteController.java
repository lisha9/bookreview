package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDeleteDao;
import util.MyConnection;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/delete")
public class BookDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private HttpSession session;
       
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(false);
		connection = (Connection) getServletContext().getAttribute("connection");
		String[] books=request.getParameterValues("selected");
		int result=new BookDeleteDao(connection).deleteBook(books);
		if(result>0){
			System.out.println("in dopost");
			session.setAttribute("message", result + "books are deleted" );
			System.out.println("before redirect");
			response.sendRedirect("deleteBook.jsp");
		}
	}
}
