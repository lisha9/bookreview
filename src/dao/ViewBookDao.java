package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.BookDetail;

public class ViewBookDao {
	private Connection connection;
	private BookDetail bookDetail;
	private PreparedStatement statement;
	private PreparedStatement avgRatingstatement;
	private ResultSet resultSet;
	private ResultSet ratingResultSet;
	private final static String QUERY = "select * from bookdetails left join reviewdetails on bookdetails.isbn where bookdetails.bookname= ? ";
	private final static String AVG_RATING_QUERY = "select avg(rating) from reviewDetails where isbn = ?";
	public ViewBookDao(Connection connection, BookDetail bookDetail) {
		if (connection != null && bookDetail != null) {
			this.connection = connection;
			this.bookDetail = bookDetail;

			try {
				statement = connection.prepareStatement(QUERY, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				avgRatingstatement = connection.prepareStatement(AVG_RATING_QUERY, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean viewBook() {
		try {
			statement.setString(1, bookDetail.getBookName());
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				bookDetail.setAuthor(resultSet.getString("author"));
				bookDetail.setDescription(resultSet.getString("description"));
				bookDetail.setImage(resultSet.getString("image"));
				bookDetail.setIsbn(resultSet.getString("isbn"));
				bookDetail.setResultSet(resultSet);
				
				//
				avgRatingstatement.setString(1, bookDetail.getIsbn());
				ratingResultSet = avgRatingstatement.executeQuery();
				ratingResultSet.next();
				bookDetail.setRating(ratingResultSet.getInt("avg(rating)"));
				System.out.println(bookDetail.getRating());
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
