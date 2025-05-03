package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.SBPDCL.util.DBConnection;

import com.SBPDCL.bean.NewConnectionRequest;

public class NewConnectionDAO {
	/* public boolean processNewConnection(NewConnectionRequest request) throws ClassNotFoundException{
	        try (Connection con = DBConnection.getConnection()) {
	        	
	        	 PreparedStatement ps = con.prepareStatement("insert into new_connection_requests(app_id, connectionType, consumerId, mobile, email, houseNo, street, addressLine1, addressLine2, addressLine3, city, pincode, district, block, panchayat, village, division, subDivision, section, tariff, E_phase, E_load, gender, applicantName, f_hName, idProof, addressProof ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	        	 ps.setString(1, request.getApp_id());
	        	 ps.setString(2, request.getConnectionType());
	        	 ps.setString(3, request.getConsumerId());
	        	 ps.setString(4, request.getMobile());
	        	 ps.setString(5, request.getEmail());
	        	 ps.setString(6, request.getHouseNo());
	        	 ps.setString(7, request.getStreet());
	        	 ps.setString(8, request.getAddressLine1());
	        	 ps.setString(9, request.getAddressLine2());
	        	 ps.setString(10, request.getAddressLine3());
	        	 ps.setString(11, request.getCity());
	        	 ps.setString(12, request.getPincode());
	        	 ps.setString(13, request.getDistrict());
	        	 ps.setString(14, request.getBlock());
	        	 ps.setString(15, request.getPanchayat());
	        	 ps.setString(16, request.getVillage());
	        	 ps.setString(17, request.getDivision());
	        	 ps.setString(18, request.getSubDivision());
	        	 ps.setString(19, request.getSection());
	        	 ps.setString(20, request.getTariff());
	        	 ps.setString(21, request.getPhase());
	        	 ps.setString(22, request.getLoad());
	        	 ps.setString(23, request.getGender());
	        	 ps.setString(24, request.getApplicantName());
	        	 ps.setString(25, request.getF_hName());
	        	 ps.setString(26, request.getIdProof());
	        	 ps.setString(27, request.getAddressProof());
	        	
	        	
	            
	            return ps.executeUpdate() >0;
	        }catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	 }*/
	  public boolean processNewConnection(NewConnectionRequest formData) {
	        boolean flag = false;
	        try (Connection con =DBConnection.getConnection()) {
	        	PreparedStatement ps = con.prepareStatement(
	        			  "INSERT INTO new_connection_requests(app_id, connectionType, consumerId, mobile, email, houseNo, street, addressLine1, addressLine2, addressLine3, city, pincode, district, block, panchayat, village, division, subDivision, section, tariff, E_phase, E_load, gender, applicantName, f_hName, idProof, addressProof) " +
	        			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
	        			);

	        			ps.setString(1, formData.getApp_id());
	        			ps.setString(2, formData.getConnectionType()); 
	        			ps.setString(3, formData.getConsumerId());     
	        			ps.setString(4, formData.getMobile());
	        			ps.setString(5, formData.getEmail());
	        			ps.setString(6, formData.getHouseNo());
	        			ps.setString(7, formData.getStreet());
	        			ps.setString(8, formData.getAddressLine1());
	        			ps.setString(9, formData.getAddressLine2());
	        			ps.setString(10, formData.getAddressLine3());
	        			ps.setString(11, formData.getCity());
	        			ps.setString(12, formData.getPincode());
	        			ps.setString(13, formData.getDistrict());
	        			ps.setString(14, formData.getBlock());
	        			ps.setString(15, formData.getPanchayat());
	        			ps.setString(16, formData.getVillage());
	        			ps.setString(17, formData.getDivision());
	        			ps.setString(18, formData.getSubDivision());
	        			ps.setString(19, formData.getSection());
	        			ps.setString(20, formData.getTariff());
	        			ps.setString(21, formData.getPhase());
	        			ps.setString(22, formData.getLoad());
	        			ps.setString(23, formData.getGender());
	        			ps.setString(24, formData.getApplicantName());
	        			ps.setString(25, formData.getF_hName());
	        			ps.setString(26, formData.getIdProof());
	        			ps.setString(27, formData.getAddressProof());
	            int rows = ps.executeUpdate();
	            if (rows > 0) {
	                flag = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return flag;
	    }
	  public boolean updateStatusToSubmitted(String appId) {
		    boolean result = false;
		    Connection con = null;
		    PreparedStatement ps = null;
		    
		    try {
		        // Establish connection
		        con = DBConnection.getConnection();
		        
		        // Begin transaction if not auto-committed
		        con.setAutoCommit(false);

		        // Define query for updating status
		        String query = "UPDATE new_connection_requests SET status = ? WHERE app_id = ?";
		        ps = con.prepareStatement(query);
		        
		        // Set parameters
		        ps.setString(1, "Submitted");
		        ps.setString(2, appId);

		        // Execute the update query
		        int rows = ps.executeUpdate();

		        // If rows are updated, set result to true
		        if (rows > 0) {
		            result = true;
		            // Commit the transaction if successful
		            con.commit();
		        }

		    } catch (Exception e) {
		        // Print stack trace for debugging
		        e.printStackTrace();
		        
		        // If error, rollback the transaction
		        if (con != null) {
		            try {
		                con.rollback();
		            } catch (SQLException ex) {
		                ex.printStackTrace();
		            }
		        }
		    } finally {
		        // Close resources
		        try {
		            if (ps != null) {
		                ps.close();
		            }
		            if (con != null) {
		                con.setAutoCommit(true); // Reset to auto-commit mode
		                con.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    return result;
		}

}





