
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
	            System.out.println("Fetched from DB: " + status);

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
	

	    public boolean updateFinalDuesStatus(String appId, String finalStatus) {
	        String query = "UPDATE new_connection_requests SET dues_cleared = ? WHERE app_id = ?";
	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(query)) {

	            ps.setString(1, finalStatus);  // "Cleared" or "Not Cleared"
	            ps.setString(2, appId);        // Update based only on app_id

	            int rowsAffected = ps.executeUpdate();
	            return rowsAffected > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }	
	}
