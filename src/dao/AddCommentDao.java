package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.AddComment;

public class AddCommentDao {
	private Connection connection;
	private PreparedStatement statement;
	private AddComment addComment;
	private static final String QUERY = "insert into reviewdetails(username,isbn,comment,date,rating) values(?,?,?,CURDATE(),?)";

	public AddCommentDao(Connection connection, AddComment addComment) {
		if (connection != null && addComment != null) {
			this.connection = connection;
			this.addComment = addComment;

			try {
				statement = connection.prepareStatement(QUERY);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public int addComment() throws SQLException {
		statement.setString(1, addComment.getUsername());
		statement.setString(2, addComment.getIsbn());
		statement.setString(3, addComment.getComment());
		statement.setInt(5, addComment.getRating());
		return statement.executeUpdate();
	}
}
