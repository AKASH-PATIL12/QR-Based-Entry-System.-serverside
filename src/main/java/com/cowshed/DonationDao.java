package com.cowshed;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DonationDao {

	//Fetch all paid record from donation table
	public ResultSet fetchDonation() {
		
		ResultSet vs=null;
	try {
		
		String sql1 = "select * from donation where status = 'paid' ";
		DBAdapter adapter = new DBAdapter();
		Connection con = adapter.getConnection();
		PreparedStatement ps1 = con.prepareStatement(sql1);
		vs = ps1.executeQuery();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return vs;
	
}
}
