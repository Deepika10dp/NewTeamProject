package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.SBPDCL.bean.DuesInfo;
import com.SBPDCL.util.DBConnection;

public class DuesDAO {


	
	    public DuesInfo checkDues(String consumerId, String mobile) throws Exception {
	        DuesInfo info = null;

	        Connection con = DBConnection.getConnection();
	        String sql = "SELECT dues_amount, dues_status FROM dues WHERE consumerId=? AND mobile=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, consumerId);
	        ps.setString(2, mobile);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            info = new DuesInfo();
	            info.setDues_amount(rs.getString("dues_amount"));
	            info.setDues_status(rs.getString("dues_status"));
	        }

	        rs.close();
	        ps.close();
	        con.close();

	        return info;
	    }

		
	}


