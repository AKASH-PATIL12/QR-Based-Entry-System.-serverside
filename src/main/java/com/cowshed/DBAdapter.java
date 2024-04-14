package com.cowshed;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBAdapter {
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/cowshed","root","root");
				
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
