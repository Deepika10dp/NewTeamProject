package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.SBPDCL.util.DBConnection;

import com.SBPDCL.bean.NewConnectionRequest;

public class NewConnectionDAO {
	
	  public boolean processNewConnection(NewConnectionRequest formData) {
	        boolean flag = false;
	        try (Connection con =DBConnection.getConnection()) {
	        	PreparedStatement ps = con.prepareStatement(
	        			  "INSERT INTO new_connection_requests(app_id, connectionType, consumerId, mobile, email, houseNo, street, addressLine1, addressLine2, addressLine3, city, pincode, district, block, panchayat, village, division, subDivision, section, tariff, E_phase, E_load, gender, applicantName, f_hName, idProof, addressProof, idProofFile, addressProofFront, addressProofLast, photo, ownershipFirst, ownershipSecond) " +
	        			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
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
	        			ps.setString(28, formData.getIdProofFile());
	        			ps.setString(29, formData.getAddressProofFront());
	        			ps.setString(30, formData.getAddressProofLast());
	        			ps.setString(31, formData.getPhoto());
	        			ps.setString(32, formData.getOwnershipFirst());
	        			ps.setString(33, formData.getOwnershipSecond());

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
		        
		        // Begin transaction if needed
		        con.setAutoCommit(false);

		        // Define query for updating status
		        String query = "UPDATE new_connection_requests SET status = ? WHERE app_id = ?";
		        ps = con.prepareStatement(query);
		        
		        // Set parameters
		        ps.setString(1, "Submitted"); // assuming 'Submitted' is the status
		        ps.setString(2, appId);

		        int rowsUpdated = ps.executeUpdate();

		        if (rowsUpdated > 0) {
		            con.commit(); // commit if successful
		            result = true;
		        } else {
		            con.rollback(); // rollback if no rows updated
		        }

		    } catch (Exception e) {
		        try {
		            if (con != null) con.rollback();
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		        e.printStackTrace();
		    } finally {
		        try {
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    return result;
		}
	  public List<NewConnectionRequest> getApplicationsByConsumer(String consumerId) {
		    List<NewConnectionRequest> list = new ArrayList<>();
		    try (Connection con = DBConnection.getConnection()) {
		        String sql = "SELECT app_id, consumerId, created_at as submissionDate, status FROM new_connection_requests WHERE consumerId = ?";
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setString(1, consumerId);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            NewConnectionRequest req = new NewConnectionRequest();
		            req.setApp_id(rs.getString("app_id"));
		            req.setConsumerId(rs.getString("consumerId"));
		            req.setSubmissionDate(rs.getTimestamp("submissionDate"));
		            req.setStatus(rs.getString("status")); // ✅ Corrected
		            list.add(req);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}

	  public static NewConnectionRequest getRequestByAppId(String appId) {
		    NewConnectionRequest request = null;
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;

		    try {
		        con = DBConnection.getConnection();
		        String sql = "SELECT * FROM new_connection_requests WHERE app_id = ?";
		        ps = con.prepareStatement(sql);
		        ps.setString(1, appId);
		        rs = ps.executeQuery();

		        if (rs.next()) {
		            request = new NewConnectionRequest();
		            request.setApp_id(rs.getString("app_id"));
		            request.setSubmissionDate(rs.getTimestamp("created_at")); // ✅ Fixed: renamed to "created_at"
		            request.setStatus(rs.getString("status"));                 // ✅ Ensure this matches DB
		        } else {
		            System.out.println("⚠️ No record found for appId: " + appId);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } 

		    return request;
		}



}





