
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
		        con = DBConnection.getConnection();
		        con.setAutoCommit(false);
		        String query = "UPDATE new_connection_requests SET status = ?, current_stage = ? WHERE app_id = ?";
		        ps = con.prepareStatement(query);
		        ps.setString(1, "Submitted"); 
		        ps.setString(2, "JEE");
		        ps.setString(3, appId);

		        int rowsUpdated = ps.executeUpdate();

		        if (rowsUpdated > 0) {
		            con.commit(); 
		            result = true;
		        } else {
		            con.rollback(); 
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
		            request.setSubmissionDate(rs.getTimestamp("created_at")); 
		            request.setConsumerId(rs.getString("consumerId"));
		            request.setStatus(rs.getString("status"));
		            request.setConsumer_number(rs.getString("consumer_number")); 
		            request.setConnectionType(rs.getString("connectionType"));
		            request.setMobile(rs.getString("mobile"));
		            request.setEmail(rs.getString("email"));
		            request.setHouseNo(rs.getString("houseNo"));
		            request.setStreet(rs.getString("street"));
		            request.setAddressLine1(rs.getString("addressLine1"));
		            request.setAddressLine2(rs.getString("addressLine2"));
		            request.setAddressLine3(rs.getString("addressLine3"));
		            request.setCity(rs.getString("city"));
		            request.setPincode(rs.getString("pincode"));
		            request.setDistrict(rs.getString("district"));
		            request.setBlock(rs.getString("block"));
		            request.setPanchayat(rs.getString("panchayat"));
		            request.setVillage(rs.getString("village"));
		            request.setDivision(rs.getString("division"));
		            request.setSubDivision(rs.getString("subDivision"));
		            request.setSection(rs.getString("section"));
		            request.setTariff(rs.getString("tariff"));
		            request.setPhase(rs.getString("E_phase"));
		            request.setLoad(rs.getString("E_load"));
		            request.setGender(rs.getString("gender"));
		            request.setApplicantName(rs.getString("applicantName"));
		            request.setF_hName(rs.getString("f_hName"));
		            
		        } else {
		            System.out.println(" No record found for appId: " + appId);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } 

		    return request;
		}

	  public List<NewConnectionRequest> getRequestsForJEE(String sectionId) {
		    List<NewConnectionRequest> list = new ArrayList<>();
		    try (Connection con = DBConnection.getConnection()) {
		        String query = "SELECT * FROM new_connection_requests WHERE  section=?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setString(1, sectionId);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            NewConnectionRequest req = new NewConnectionRequest();
		            req.setApp_id(rs.getString("app_id"));
		            req.setApplicantName(rs.getString("applicantName"));
		            req.setMobile(rs.getString("mobile"));
		            req.setDues_cleared(rs.getString("dues_cleared"));
		            req.setDocuments_verified(rs.getString("documents_verified"));
		            req.setConsumerId(rs.getString("consumerId"));
		            req.setStatus(rs.getString("status"));
		            req.setCurrentStage(rs.getString("current_stage"));
		            list.add(req);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}  
	  public static NewConnectionRequest getApplicationDetailsByAppId(String appId) {
	        NewConnectionRequest request = null;
	        try (Connection conn = DBConnection.getConnection()) {
	            String query = "SELECT * FROM new_connection_requests WHERE app_id = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, appId);

	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                request = new NewConnectionRequest();
	                request.setApp_id(rs.getString("app_id"));
	                request.setConnectionType(rs.getString("connectionType"));
	                request.setConsumerId(rs.getString("consumerId"));
	                request.setMobile(rs.getString("mobile"));
	                request.setEmail(rs.getString("email"));
	                request.setHouseNo(rs.getString("houseNo"));
	                request.setStreet(rs.getString("street"));
	                request.setAddressLine1(rs.getString("addressLine1"));
	                request.setAddressLine2(rs.getString("addressLine2"));
	                request.setAddressLine3(rs.getString("addressLine3"));
	                request.setCity(rs.getString("city"));
	                request.setPincode(rs.getString("pincode"));
	                request.setDistrict(rs.getString("district"));
	                request.setBlock(rs.getString("block"));
	                request.setPanchayat(rs.getString("panchayat"));
	                request.setVillage(rs.getString("village"));
	                request.setDivision(rs.getString("division"));
	                request.setSubDivision(rs.getString("subDivision"));
	                request.setSection(rs.getString("section"));
	                request.setTariff(rs.getString("tariff"));
	                request.setPhase(rs.getString("E_phase"));
	                request.setLoad(rs.getString("E_load"));
	                request.setGender(rs.getString("gender"));
	                request.setApplicantName(rs.getString("applicantName"));
	                request.setF_hName(rs.getString("f_hName"));
	            	System.out.println("Application details found for App ID: " + appId);
				} else {
					System.out.println("No application found with appId: " + appId);
			
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return request;
	    }
	 
	  public boolean verifyDocuments(String appId, String jeeRemarks, String verificationStatus) {
		    String query;
		    
		    if ("Approved".equalsIgnoreCase(verificationStatus)) {
		        query = "UPDATE new_connection_requests SET status='Pending MI', current_stage='MI', jee_remarks=?, documents_verified='approved' WHERE app_id=?";
		    } else if ("Rejected".equalsIgnoreCase(verificationStatus)) {
		        query = "UPDATE new_connection_requests SET status='Rejected', current_stage='JEE', jee_remarks=?, documents_verified='rejected' WHERE app_id=?";
		    } else {
		        return false;
		    }

		    try (Connection con = DBConnection.getConnection(); 
		         PreparedStatement ps = con.prepareStatement(query)) {

		        ps.setString(1, jeeRemarks);
		        ps.setString(2, appId);
		        
		        int rowsUpdated = ps.executeUpdate();
		        return rowsUpdated > 0;

		    } catch (Exception e) {
		        e.printStackTrace();
		        return false;
		    }
		}


	  public List<NewConnectionRequest> getApplicationsForMI(String sectionId) {
		    List<NewConnectionRequest> list = new ArrayList<>();
		    try (Connection con = DBConnection.getConnection()) {
		        String query = "SELECT * FROM new_connection_requests " +
		                       "WHERE section=? AND (current_stage='MI' OR current_stage='AEE' OR current_stage='Complete')";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setString(1, sectionId);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            NewConnectionRequest req = new NewConnectionRequest();
		            req.setApp_id(rs.getString("app_id"));
		            req.setApplicantName(rs.getString("applicantName"));
		            req.setStatus(rs.getString("status"));
		            req.setMi_remarks(rs.getString("mi_remarks"));
		            req.setAddressLine1(rs.getString("addressLine1"));
		            req.setCurrentStage(rs.getString("current_stage"));
		            // Add more fields if needed
		            list.add(req);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}

	  public boolean updateMIInspection(String app_id, String mi_remarks) {
		    String sql = "UPDATE new_connection_requests SET status = ?, current_stage = ?, mi_remarks = ? WHERE app_id = ?";

		    try (Connection con = DBConnection.getConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {

		        ps.setString(1, "Pending AEE");
		        ps.setString(2, "AEE");
		        ps.setString(3, mi_remarks);
		        ps.setString(4, app_id);

		        int rows = ps.executeUpdate();
		        return rows > 0;
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return false; 
		}
	 public boolean saveOnlyMIRemarks(String app_id, String mi_remarks) throws ClassNotFoundException {
	        String sql = "UPDATE new_connection_requests SET mi_remarks = ? WHERE app_id = ?";
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setString(1, mi_remarks);
	            ps.setString(2, app_id);
	            return ps.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	  public boolean forwardToAEE(String app_id) throws ClassNotFoundException {
		    String sql = "UPDATE new_connection_requests SET status = 'Pending AEE' WHERE app_id = ?";
		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        ps.setString(1, app_id);
		        return ps.executeUpdate() > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;

	  }
	  public boolean rejectedStatus(String app_id) throws ClassNotFoundException {
		    String sql = "UPDATE new_connection_requests SET status = 'Rejected' WHERE app_id = ?";
		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        ps.setString(1, app_id);
		        return ps.executeUpdate() > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
	  }
	 
	
}
