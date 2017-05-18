package com.coder.springmvc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class TestConnection {

	private final String driver = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost/crop_image";
	private final String userName = "Coder";
	private final String password = "CoderDb958";
	private Connection connection;
	
	public void connectToDatabase() {
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, userName, password);
			
			if(connection != null) {
				System.out.println("Connected successfully.");
			}
			
		} catch(ClassNotFoundException | SQLException exc){
			System.out.println(exc.getMessage());
		} finally {
			try {
				connection.close();
				
			} catch (SQLException e) {}
		}
	}
	
	public static void main(String[] args) {
		new TestConnection().connectToDatabase();
	}
}
