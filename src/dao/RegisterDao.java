package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.NewUser;

public class RegisterDao {
	private NewUser newUser;
	private Connection connection;
	private PreparedStatement statement;

	public RegisterDao(NewUser newUser, Connection connection) {
		if (newUser != null && connection != null) {
			this.newUser = newUser;
			this.connection = connection;
		} else {

		}
	}

	public int insert() {
		try {
			statement = connection.prepareStatement("insert into userdetails values(?,?,?,?,?,?)",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			statement.setString(1, newUser.getUserName());
			statement.setString(2, newUser.getPassword());
			statement.setString(3, newUser.getFirstName());
			statement.setString(4, newUser.getLastName());
			statement.setString(5, newUser.getContact());
			statement.setString(6, "user");
			return statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
