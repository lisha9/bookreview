package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDeleteDao {

	private Connection connection;
	private PreparedStatement statement;

	public BookDeleteDao(Connection connection) {
		if (connection != null) {
			this.connection = connection;
		} else {

		}
	}

	public int deleteBook(String[] selectedBooks) {
		System.out.println(selectedBooks);
		int result = 0;
		try {
			statement = connection.prepareStatement("delete from bookdetails where isbn=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		for (int i = 0; i < selectedBooks.length; i++) {
			System.out.println(selectedBooks[i]);
			try {
				statement.setString(1, selectedBooks[i]);
				result = statement.executeUpdate();
				System.out.println("In try");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("In catch");
			}
		}
		return result;
	}
}
