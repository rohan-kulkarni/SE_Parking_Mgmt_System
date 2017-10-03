package com.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewAnonymous
 */
@WebServlet("/ViewAnonymous")
public class ViewAnonymous extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	public String DB_URL = "jdbc:mysql://localhost:3306/SE_PMS";
	public String USER = "root";
	public String PASS = "Admin123";
	public Connection conn = null;
	public Statement stmt = null;
	public String email, pass, loginType, fName, lName, address, city, zip, state, contactno;
	public ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAnonymous() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String output ="";
		String fullName,contactno,email;
		
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			rs=stmt.executeQuery("select * from anonymoususer");
			 while(rs.next()){
	        	 	output=output+"<tr>";
	        	 	fullName = rs.getString("AU_fullname");
	        	 	email=rs.getString("AU_id");
	        	 	contactno = rs.getString("AU_contactNo");
	        	 	output=output+"<td>"+"Star Bazar"+"</td><td>"+fullName+"</td><td>"+email+"</td><td>"+contactno+"</td>";
	        	 	output=output+"</tr>";
	         }
			

		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
