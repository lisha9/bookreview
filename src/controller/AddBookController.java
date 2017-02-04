package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AddBookDao;
import model.Book;

/**
 * Servlet implementation class AddBookController
 */
@WebServlet("/addbook")
public class AddBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PrintWriter out;
	private HttpSession session;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		connection = (Connection) getServletContext().getAttribute("connection");
		session = request.getSession(false);
		out = response.getWriter();
		Book book = new Book();
		book.setName(request.getParameter("bookName"));
		book.setIsbn(request.getParameter("isbn"));
		book.setAuthor(request.getParameter("author"));
		book.setDescription(request.getParameter("description"));
		book.setImage(request.getParameter("image"));
		int result = new AddBookDao(connection, book).add();
		RequestDispatcher dispatcher = request.getRequestDispatcher("./AddBook.jsp");
		if (result > 0) {
			session.setAttribute("message", "Book added successfully");
			dispatcher.include(request, response);
		} else {
			session.setAttribute("message", "Failed to add book.\n Book may already exist");
			dispatcher.include(request, response);
		}
	}

}
