
package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.SBPDCL.util.DBConnection;

public class DuesDAO {


	
	  public boolean checkDuesCleared(String consumerId, String mobile) {
	        boolean cleared = false;

	        try (Connection con = DBConnection.getConnection()) {
	            String sql = "SELECT dues_status FROM dues WHERE consumerId = ? AND mobile = ?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, consumerId);
	            ps.setString(2, mobile);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                String status = rs.getString("dues_status");
	                cleared = "Cleared".equalsIgnoreCase(status);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return cleared;
	    }

	    public String getDuesStatus(String consumerId, String mobile) {
	        String status = "Not Found";

	        try (Connection con = DBConnection.getConnection()) {
	            String sql = "SELECT dues_status FROM dues WHERE consumerId = ? AND mobile = ?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, consumerId);
	            ps.setString(2, mobile);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                status = rs.getString("dues_status");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return status;
	    }
	

		
		public boolean updateFinalDuesStatus(String consumerId, String mobile, String finalStatus) {
		    String query = "UPDATE new_connection_requests SET dues_cleared = ? WHERE consumerId = ? AND mobile = ?";
		    try (Connection con = DBConnection.getConnection();
		         PreparedStatement ps = con.prepareStatement(query)) {

		        int clearedValue = "Cleared".equalsIgnoreCase(finalStatus) ? 1 : 0;
		        ps.setInt(1, clearedValue);
		        ps.setString(2, consumerId);
		        ps.setString(3, mobile);

		        int rowsAffected = ps.executeUpdate();
		        return rowsAffected > 0;
		    } catch (Exception e) {
		        e.printStackTrace();
		        return false;
		    }
		}


		
	}
