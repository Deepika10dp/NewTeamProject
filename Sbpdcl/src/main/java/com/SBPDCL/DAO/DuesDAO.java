
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
	

		public void updateDuesClearedStatusInRequest(String consumerId, String mobile) {
			// TODO Auto-generated method stub
			 String query = "UPDATE new_connection_requests SET dues_cleared = 1 WHERE consumerId = ? AND mobile = ?";
		        try (Connection con = DBConnection.getConnection();
		             PreparedStatement ps = con.prepareStatement(query)) {

		            ps.setString(1, consumerId);
		            ps.setString(2, mobile);
		            ps.executeUpdate();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		}

		
	}
