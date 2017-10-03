package com.mvc.util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection
{
	public static Connection createConnection()
	{
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/SE_PMS"; //MySQL URL and followed by the database name
		String username = "root"; //MySQL username
		String password = "Admin123"; //MySQL password
		try 	
		{
			try 
			{
				Class.forName("com.mysql.jdbc.Driver"); //loading mysql driver 
			} 
			catch (ClassNotFoundException e)
			{
				e.printStackTrace();
			} 
			conn = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
			System.out.println("Printing connection object "+conn);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return conn; 
	}
}