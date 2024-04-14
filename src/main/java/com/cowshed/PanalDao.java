package com.cowshed;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.imageio.ImageIO;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

public class PanalDao {
	
	//this method read qr code contain
	public String QrReader(String fName) throws NotFoundException, IOException {
		File file = new File("E:\\QR-PNG\\"+fName);
		Result rs = new MultiFormatReader().decode(new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(file)))));		
		String context = rs.getText(); //store contain of QR code
		return context;
	}
	
	
	//This method verify user
	public String entryIn(String str) throws SQLException {
		
		String sql1 = "select * from register where phno=? ";
		DBAdapter adapter = new DBAdapter();
		Connection con = adapter.getConnection();
		
		PreparedStatement ps1 = con.prepareStatement(sql1);
		ps1.setInt(1, Integer.parseInt(str));
		ResultSet vs = ps1.executeQuery();
		
		while(vs.next()) 
		{
			
	
			String sql2 = "insert into log(name,phno,email) values(?,?,?)";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setString(1, vs.getString("name"));
			ps2.setInt(2, vs.getInt("phno"));
			ps2.setString(3, vs.getString("email"));
			
			int res = ps2.executeUpdate();
			if(res>0) {
				return "success";
			}
			else {
				return "error";
			}
		}
		return null;
	}
	
	//method for exit
	public String exitOut(int phno) throws SQLException {
		String sql3 = "update log set extime= CURRENT_TIMESTAMP where phno = ?";
		DBAdapter adapter = new DBAdapter();
		Connection con = adapter.getConnection();
		
		PreparedStatement ps3 = con.prepareStatement(sql3);
		ps3.setInt(1, phno);
		int res = ps3.executeUpdate();
		con.close();
		if(res>0) {
			return "Exited...";
		}else {
			return "Make Entry first";
		}
		
	}
	

	
	//METHOD THAT RETURN RESULTSET ACCORDING TO DATE SELECTED
	public ResultSet selectDate(String date) {
		
			ResultSet vs=null;
		try {
			
			String sql1 = "select * from log where date(etime)=? ";
			DBAdapter adapter = new DBAdapter();
			Connection con = adapter.getConnection();
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1, date);
			vs = ps1.executeQuery();
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vs;
		
	}
	
	
}

