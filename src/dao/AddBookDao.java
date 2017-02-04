package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Book;

public class AddBookDao {
	private Connection connection;
	private Book book;
	private PreparedStatement statement;
	private static final String QUERY = "insert into bookdetails(isbn, bookname, author, description, image) values(?,?,?,?,?)";

	public AddBookDao(Connection connection, Book book) {
		if (connection != null && book != null) {
			this.connection = connection;
			this.book = book;

			try {
				statement = connection.prepareStatement(QUERY);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public int add() {
		File file = new File(book.getImage());
		
		try {
			FileInputStream inputStream = new FileInputStream(file);
			statement.setString(1, book.getIsbn());
			statement.setString(2, book.getName());
			statement.setString(3, book.getAuthor());
			statement.setString(4, book.getDescription());
			statement.setBinaryStream(5, inputStream, (int)file.length());
			return statement.executeUpdate();
		} catch (SQLException | FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("in catch");
		}
		return 0;
	}

}
