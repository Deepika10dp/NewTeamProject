package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.SBPDCL.util.DBConnection;

import com.SBPDCL.bean.NewConnectionRequest;

public class NewConnectionDAO {
	 public boolean processNewConnection(NewConnectionRequest request) throws ClassNotFoundException{
	        try (Connection con = DBConnection.getConnection()) {
	        	
	        	 PreparedStatement ps = con.prepareStatement("insert into new_connection_request(app_id, connectionType, consumerId, mobile, email, houseNo, street, addressLine1, addressLine2, addressLine3, city, pincode, district, block, panchayat, village, division, subDivision, section, tariff, E_phase, E_load, gender, applicantName, f_hName, idProof, addressProof ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
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
	 }
}





