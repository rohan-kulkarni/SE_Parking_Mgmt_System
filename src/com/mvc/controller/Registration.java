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
	public String email, pass, loginType, fName, lName, address, city, zip, state, contactno;
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
			contactno = (String) request.getParameter("number");
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

		try {
			stmt.executeUpdate("insert into users (`username`, `password`, `type`) values('" + email + "','"
					+ pass + "','owner')");
			res = null;
			res = stmt.executeQuery("select user_id from users where (username='" + email + "')");
			res.next();
			int u_id = res.getInt("user_id");
			stmt.executeUpdate(
					"insert into parkingowner (`PO_fullName`,`PO_contactNo`,`Users_user_id`,`PO_address`,`PO_city`,`PO_state`,`PO_zip`) values('"
							+ fName + " " + lName + "','" + contactno + "','" + u_id + "','" + address + "','" + city
							+ "','" + state + "','" + zip + "')");

			request.setAttribute("userName", fName);
			request.setAttribute("name", fName+" "+lName);
			request.getRequestDispatcher("/parkingOwnerDashboard.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
