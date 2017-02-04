/**
 * this bean is used by ViewBookController & ViewBookDao
 */

package model;

import java.sql.ResultSet;

public class BookDetail {
	private String isbn;
	private String bookName;
	private String author;
	private String description;
	private String image;
	private int rating;

	// this resultSet is to fetch username , comment and date on viewBook.jsp
	// page
	private ResultSet resultSet;

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ResultSet getResultSet() {
		return resultSet;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public void setResultSet(ResultSet resultSet) {
		this.resultSet = resultSet;
	}

}
