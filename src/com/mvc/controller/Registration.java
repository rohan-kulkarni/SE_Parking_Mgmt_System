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
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	public String DB_URL = "jdbc:mysql://localhost:3306/SE_PMS";
	public String USER = "root";
	public String PASS = "Admin123";
	public Connection conn = null;
	public Statement stmt = null;
	public String email, pass, loginType, fName, lName, address, city, zip, state;
	public ResultSet res = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
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
		try {
			fName = request.getParameter("firstname");
			lName = request.getParameter("lastname");
			email = request.getParameter("email");
			pass = request.getParameter("password");
			address = request.getParameter("address");
			city = request.getParameter("city");
			state = request.getParameter("state");
			zip = (String) request.getParameter("zipcode");
			loginType = request.getParameter("loginType");

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			if (loginType.equals("owner"))
				parkingOwner(request, response);

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	private void parkingOwner(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String sql = "";

		try {
			request.setAttribute("userName", fName);
			request.getRequestDispatcher("/parkingOwnerDashboard.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
