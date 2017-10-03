package com.vehicleowner;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Parkinglocator")
public class Parkinglocator extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	public String DB_URL="jdbc:mysql://localhost:3306/SE_PMS";
	public String USER = "root";
	public String PASS = "admin";
    
    public Parkinglocator() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    public String getData(){
		String output="";
		try {
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	         Statement stmt = conn.createStatement();
	         String sql;
	         sql = "select * from parking";
	         ResultSet rs = stmt.executeQuery(sql);
	         output=output+"<table class='table table-striped table-list' height=30px border=1px>";
	         output=output+"<th>P_ID</th><th>P_NAME</th><th>P_State</th><th>P_City</th><th>P_Address</th><th>P_Zip</th><th>Opentime</th>";
	         while(rs.next()){
	        	 	output=output+"<tr>";
	        	 	int P_id  = rs.getInt("P_id");
	        	 	String P_Name  = rs.getString("P_Name");
	        	 	String P_State  = rs.getString("P_State");
	        	 	String P_City  = rs.getString("P_City");
	        	 	String Address  = rs.getString("P_Address");
	        	 	String P_Zip  = rs.getString("P_Zip");
	        	 	String P_opentime  = rs.getString("P_opentime");
	        	 	output=output+"<td>"+P_id+"</td><td>"+P_Name+"</td><td>"+P_State+"</td><td>"+P_City+"</td><td>"+Address+"</td><td>"+P_Zip+"</td><td>"+P_opentime+"</td>";
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
		return output;
	}
    
    
    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		out.println(getData());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String output="";
		PrintWriter out=response.getWriter();
		try {
			String state = request.getParameter("state");
			String city = request.getParameter("city");
			
			String sql = "select * from parking where state=(?) and city=(?)";
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, state);
	        ps.setString(2, city);
	       
	        ResultSet rs = ps.executeQuery();
	        
	        output=output+"<table class='table table-striped table-list' height=30px border=1px>";
	        output=output+"<th>Parking ID</th><th>Parking Name</th><th>State</th><th>City</th><th>Address</th><th>Zip</th><th>Opening Time</th>";
	        
	        while(rs.next()){
        	 	output=output+"<tr>";
        	 	int P_id  = rs.getInt("P_id");
        	 	String P_name = rs.getString("P_name");
        	 	String P_state  = rs.getString("P_state");
        	 	String P_city  = rs.getString("P_city");
        	 	String P_address  = rs.getString("P_address");
        	 	String p_zip  = rs.getString("p_zip");
        	 	String P_opentime  = rs.getString("P_opentime");
        	 	String P_closetime  = rs.getString("P_closetime");
        	 	output=output+"<td>"+P_id+"</td><td>"+P_name+"</td><td>"+P_state+"</td><td>"+P_city+"</td><td>"+P_address+"</td><td>"+p_zip+"</td><td>"+P_opentime+"</td>";
        	 	output=output+"</tr>";
         }
         output=output+"</table>";
         rs.close();
         ps.close();
         conn.close();
	        
	      } catch(SQLException se) {
	         se.printStackTrace();
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
		
		
		
		
		
	}

}
