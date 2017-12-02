package com.mvc.dao;

import java.sql.*;

import com.mvc.util.DBConnection;

public class ActionSpaceDao {

	private Connection conn;
	
	public ActionSpaceDao()
	{
		conn=DBConnection.createConnection();
	}
	
	public void approveRequest(int p_id)
	{
		try 
		{
			String query="update parking set Status=? where P_id=?";
			PreparedStatement pstmt=conn.prepareStatement(query);
			pstmt.setString(1, "approved");
			pstmt.setInt(2, p_id);
			pstmt.executeUpdate();
			
			System.out.println("Request approved");
			return;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public void declineRequest(int p_id)
	{
		try 
		{
			String query="update parking set Status=? where P_id=?";
			PreparedStatement pstmt=conn.prepareStatement(query);
			pstmt.setString(1, "declined");
			pstmt.setInt(2, p_id);
			pstmt.executeUpdate();
			
			System.out.println("Request declined");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
