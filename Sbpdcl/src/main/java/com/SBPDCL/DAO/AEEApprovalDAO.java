package com.SBPDCL.DAO;

import java.sql.*;
import java.util.*;
import com.SBPDCL.bean.NewConnectionRequest;
import com.SBPDCL.util.DBConnection;

public class AEEApprovalDAO {

    public List<NewConnectionRequest> getApplicationsForAEE(String sectionId) {
        List<NewConnectionRequest> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT * FROM new_connection_requests WHERE (current_stage='AEE' OR (current_stage='Complete' AND status='Approved')) AND section=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, sectionId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NewConnectionRequest req = new NewConnectionRequest();
                req.setApp_id(rs.getString("app_id"));
                req.setApplicantName(rs.getString("applicantName"));
                req.setMobile(rs.getString("mobile"));
                req.setStatus(rs.getString("status"));
                req.setAeeRemarks(rs.getString("aee_remarks"));
                list.add(req);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean isConsumerExists(String consumerId) {
        boolean exists = false;
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT consumer_number FROM consumers WHERE consumer_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, consumerId);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    public String getExistingConsumerNumber(String consumerId) {
        String number = null;
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT consumer_number FROM consumers WHERE consumer_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, consumerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                number = rs.getString("consumer_number");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return number;
    }

    public boolean approveApplication(String appId, String consumerId, String remarks, String consumerNumber) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);

            // Update new_connection_requests
            String updateQuery = "UPDATE new_connection_requests SET status='Approved', current_stage='Complete', aee_remarks=?, consumer_number=? WHERE app_id=?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            ps.setString(1, remarks);
            ps.setString(2, consumerNumber);
            ps.setString(3, appId);
            int updated = ps.executeUpdate();

            // If consumer not already in consumers table, insert
            if (!isConsumerExists(consumerId)) {
            	String insertQuery = "INSERT INTO consumers (consumer_id, app_id, consumer_number, name, phone_no, address, connection_type, email, houseNo, street, addressLine2, addressLine3," +
            		    "city, pincode, district, block, panchayat, village, division, subDivision, section," +
            		    "tariff, E_phase, E_load, gender, f_hName, idProof, addressProof," +
            		    "idProofFile, addressProofFront, addressProofLast, photo," +
            		    "ownershipFirst, ownershipSecond, created_at) " +
            		    "SELECT ?, app_id, ?, applicantName, mobile, addressLine1, connectionType, email, houseNo, street, addressLine2, addressLine3," +
            		    "city, pincode, district, block, panchayat, village, division, subDivision, section," +
            		    "tariff, E_phase, E_load, gender, f_hName, idProof, addressProof," +
            		    "idProofFile, addressProofFront, addressProofLast, photo," +
            		    "ownershipFirst, ownershipSecond, created_at " + // <-- fixed here (no comma)
            		    "FROM new_connection_requests WHERE app_id=?";

                PreparedStatement insertPs = con.prepareStatement(insertQuery);
                insertPs.setString(1, consumerId);
                insertPs.setString(2, consumerNumber);
                insertPs.setString(3, appId);
                System.out.println("Updated rows: " + updated);

                insertPs.executeUpdate();
            }


            con.commit();
            success = updated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}