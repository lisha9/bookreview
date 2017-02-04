package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ViewBookDao;
import model.BookDetail;

/**
 * Servlet implementation class ViewBookController
 */
@WebServlet("/viewBook")
public class ViewBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Connection connection;   
    private HttpSession session;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(false);
		connection = (Connection) getServletContext().getAttribute("connection");
		BookDetail bookDetail = new BookDetail();
		bookDetail.setBookName(request.getParameter("bookName"));
		boolean isAvail = new ViewBookDao(connection, bookDetail).viewBook();
		if(isAvail){
			session.setAttribute("bookDetail", bookDetail);
			System.out.println("In if :" + bookDetail.getBookName());
		}else{
			session.setAttribute("message", "Book is not available");
		}
		response.sendRedirect("viewBook.jsp");
	}

}
