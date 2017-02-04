package model;

import java.sql.Date;

public class AddComment {
	private String comment;
	private int rating;
	private String username;
	private String isbn;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = Integer.parseInt(rating);
	}

}
