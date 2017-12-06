package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.util.DBConnection;
import com.mvc.util.EncryptPassword;

/**
 * Servlet implementation class Password
 */
@WebServlet("/Password")
public class Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Statement stmt = null;
	public ResultSet res = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Password() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		try {

			String cpassword = EncryptPassword.encryption(request.getParameter("cpassword"));
			String password1 = EncryptPassword.encryption(request.getParameter("password1"));
			String password2 = EncryptPassword.encryption(request.getParameter("password2"));
			String password = null;
			request.getSession();
			String username = (String) request.getSession().getAttribute("username");
			System.out.println(username);

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DBConnection.createConnection();

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from users where username= '" + username + "'");

			// res= stmt.executeQuery("select password from users where (username='" +
			// username + "')");
			String sql = "Update users set password= ? WHERE username=? and password=?";
			rs.next();
			password = rs.getString("password");
			System.out.println(password);

			if (cpassword.isEmpty() || password1.isEmpty() || password2.isEmpty()) {

				out.print("<html><head>");
				out.print("<script type=\"text/javascript\">alert(\"Please Check your Inputs.\");</script>");
				out.print("</head><body></body></html>");
				RequestDispatcher rd = request.getRequestDispatcher("/changePassword.jsp");
				rd.include(request, response);
			}

			if (cpassword != null && password1 != null && password2 != null) {

				if (password1.equals(password2)) {

					if (password.equals(cpassword)) {

						PreparedStatement ps = conn.prepareStatement(sql);
						ps.setString(1, password1);
						ps.setString(2, username);
						ps.setString(3, cpassword);
						ps.executeUpdate();
						out.print("<html><head>");
						out.print("<script type=\"text/javascript\">alert(\"Password Changed Successfully!!\");</script>");
						out.print("</head><body></body></html>");
						RequestDispatcher rd = request.getRequestDispatcher("/changePassword.jsp");
						rd.include(request, response);
						st.close();
						conn.close();

					}

					else {
						out.print("<script type=\"text/javascript\">alert(\"Password Dont match!!\");</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/changePassword.jsp");
						rd.include(request, response);
					}

				} else {
					out.print("<script type=\"text/javascript\">alert(\"New password and confirm new password is not matching\");</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/changePassword.jsp");
					rd.include(request, response);
				}
			} else {

				out.print("<script type=\"text/javascript\">alert(\"**Password doesnot Change.. Try Again! **\");</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/changePassword.jsp");
				rd.include(request, response);

			}

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
