package com.vehicleowner;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	public String DB_URL="jdbc:mysql://localhost:3306/SE_PMS";
	public String USER = "root";
	public String PASS = "admin";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			String name = request.getParameter("Name");
			String mobile = request.getParameter("mobile");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String sql = "insert into users(username,password,type) values(?,?,?)";
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, username);
	        ps.setString(2, password);
	        ps.setString(3, "Vehicle Owner");
	        ps.executeUpdate();
	       
	        String sql2 = "select user_id from users where username = (?)";
	        PreparedStatement ps2 = conn.prepareStatement(sql2);
	        ps2.setString(1, username);
	        ps2.executeUpdate();
	        ResultSet rs = ps2.executeQuery();
	        String s = rs.toString();
	        
	        String sql1 = "insert into vehicleowner(name,contactno) values(?,?) where user_id = (?)";
	        PreparedStatement ps1 = conn.prepareStatement(sql1);
	        ps1.setString(1, name);
	        ps1.setString(2, mobile);
	        ps1.setString(3, s);
	        ps1.executeUpdate();
	        PrintWriter out = response.getWriter();
	        out.println("You have successfully registered");
	        
	      } catch(SQLException se) {
	         se.printStackTrace();
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
		
		
	}

}
