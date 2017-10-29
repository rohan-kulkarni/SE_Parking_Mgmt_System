package com.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.util.DBConnection;

/**
 * Servlet implementation class HomeLogin
 */
@WebServlet("/HomeLogin")
public class HomeLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		HttpSession session = null;

		try {
			uName = request.getParameter("username");
			pass = request.getParameter("password");
			loginType = request.getParameter("loginType");
			conn = DBConnection.createConnection();
			stmt = conn.createStatement();
			
			String sql = "select * from users where(username='" + uName + "'&&password='" + pass + "'&&type='"
					+ loginType + "')";
			res = stmt.executeQuery(sql);
			if (res.next()) {
				System.out.println("success");
				session = request.getSession();
				session.setAttribute("userName", uName);
				session.setAttribute("user_id", res.getString("user_id"));
				session.setAttribute("username", uName);
				if (loginType.equals("owner"))
					request.getRequestDispatcher("/parkingOwnerDashboard.jsp").forward(request, response);
				if(loginType.equals("user"))
					request.getRequestDispatcher("/vehicleOwnerDashboard.jsp").forward(request, response);
				if(loginType.equals("anonymous"))
					request.getRequestDispatcher("#").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("2nd error");
			e.printStackTrace();
		}

	}

}
