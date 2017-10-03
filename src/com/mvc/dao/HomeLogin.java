package com.mvc.dao;

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
 * Servlet implementation class HomeLogin
 */
@WebServlet("/HomeLogin")
public class HomeLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	public String DB_URL = "jdbc:mysql://localhost:3306/SE_PMS";
	public String USER = "root";
	public String PASS = "Admin123";
	public Connection conn = null;
	public Statement stmt = null;
	public String uName, pass, loginType;
	public ResultSet res = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Begin");

		try {
			uName = request.getParameter("username");
			pass = request.getParameter("password");
			loginType = request.getParameter("loginType");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql = "select * from users where(username='" + uName + "'&&password='" + pass + "'&&type='"
					+ loginType + "')";
			res = stmt.executeQuery(sql);
			if (res.next()) {
				System.out.println("success");
				request.setAttribute("userName", uName);
				request.getRequestDispatcher("/parkingOwnerDashboard.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("2nd error");
			e.printStackTrace();
		}

	}

}
