package com.anonymous;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchBookingServlet
 */
@WebServlet("/SearchBookingServlet")
public class SearchBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	public String DB_URL="jdbc:mysql://localhost:3306/SE_PMS";
	public String USER = "root";
	public String PASS = "root";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("booking_id");
		PrintWriter out=response.getWriter();
		String output="";
		try {
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	         Statement stmt = conn.createStatement();
	         String sql;
	         sql = "select * from Booking where B_id='"+id+"'";
	         ResultSet rs = stmt.executeQuery(sql);
	         output=output+"<table class='table table-striped table-list' height=30px border=1px>";
	         output=output+"<th>Date</th><th>Booking Id</th><th>Entry Time</th><th>Vehicle Type</th><th>Registration Number</th><th>Contact Number</th><th>Name</th>";
	         while(rs.next()){
	        	 	output=output+"<tr>";
	        	 	int B_id  = rs.getInt("B_id");
	        	 	String B_vehicleType  = rs.getString("B_vehicleType");
	        	 	String B_date  = rs.getString("B_date");
	        	 	String B_actEntry  = rs.getString("B_actEntry");
	        	 	String contact  = rs.getString("B_contact_no");
	        	 	String Name  = rs.getString("B_Name");
	        	 	String RegNo  = rs.getString("B_RegNo");
	        	 	output=output+"<td>"+B_date+"</td><td>"+B_id+"</td><td>"+B_actEntry+"</td><td>"+B_vehicleType+"</td><td>"+RegNo+"</td><td>"+contact+"</td><td>"+Name+"</td>";
	        	 	output=output+"</tr>";
	         }
	         output=output+"</table>";
	         rs.close();
	         stmt.close();
	         conn.close();
	      } catch(SQLException se) {
	         se.printStackTrace();
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
		out.println(output);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
