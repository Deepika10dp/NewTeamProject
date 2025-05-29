package com.SBPDCL.DAO;

import java.sql.*;
import java.util.*;

import com.SBPDCL.bean.LocationNameBean;
import com.SBPDCL.bean.NewConnectionRequest;
import com.SBPDCL.util.DBConnection;
import com.SBPDCL.util.LocationNameUtil;

public class AEEApprovalDAO {

    public List<NewConnectionRequest> getApplicationsForAEE(String sectionId) {
        List<NewConnectionRequest> list = new ArrayList<>();
        String query = "SELECT * FROM new_connection_requests WHERE (current_stage='AEE' OR (current_stage='Complete' AND status='Connection Approved')) AND section=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, sectionId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    NewConnectionRequest req = new NewConnectionRequest();
                    req.setApp_id(rs.getString("app_id"));
                    req.setApplicantName(rs.getString("applicantName"));
                    req.setMobile(rs.getString("mobile"));
                    req.setStatus(rs.getString("status"));
                    req.setAeeRemarks(rs.getString("aee_remarks"));
                    req.setConsumerId(rs.getString("consumerId"));
                    list.add(req);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean isConsumerExists(String consumerId) {
        boolean exists = false;
        String query = "SELECT consumer_number FROM consumers WHERE consumer_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, consumerId);
            try (ResultSet rs = ps.executeQuery()) {
                exists = rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    public String getExistingConsumerNumber(String consumerId) {
        String number = null;
        String query = "SELECT consumer_number FROM consumers WHERE consumer_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, consumerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    number = rs.getString("consumer_number");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return number;
    }

    public NewConnectionRequest getRequestByAppId(String appId) {
        NewConnectionRequest req = null;
        String sql = "SELECT * FROM new_connection_requests WHERE app_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, appId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    req = new NewConnectionRequest();
                    req.setDistrict(rs.getString("district"));
                    req.setBlock(rs.getString("block"));
                    req.setPanchayat(rs.getString("panchayat"));
                    req.setVillage(rs.getString("village"));
                    req.setDivision(rs.getString("division"));
                    req.setSubDivision(rs.getString("subDivision"));
                    req.setSection(rs.getString("section"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return req;
    }

    public boolean approveApplication(String appId, String consumerId, String remarks, String consumerNumber) {
        boolean success = false;
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            // Step 1: Update new_connection_requests
            String updateQuery = "UPDATE new_connection_requests SET status='Connection Approved', current_stage='Complete', aee_remarks=?, consumer_number=? WHERE app_id=?";
            try (PreparedStatement ps = con.prepareStatement(updateQuery)) {
                ps.setString(1, remarks);
                ps.setString(2, consumerNumber);
                ps.setString(3, appId);
                int updated = ps.executeUpdate();
                if (updated == 0) {
                    con.rollback();
                    return false;
                }
            }

            // Step 2: Insert into consumers if not exists
            if (!isConsumerExists(consumerId)) {
                NewConnectionRequest formData = getRequestByAppId(appId);
                if (formData == null) {
                    con.rollback();
                    return false;
                }
                LocationNameBean names = LocationNameUtil.getLocationNames(formData); // Fetch names from IDs using LocationNameUtil

                String insertQuery = "INSERT INTO consumers (consumer_id, app_id, consumer_number, name, phone_no, address, connection_type, email, houseNo, street, addressLine2, addressLine3, " +
                        "city, pincode, district, block, panchayat, village, division, subDivision, section, " +
                        "tariff, E_phase, E_load, gender, f_hName, idProof, addressProof, " +
                        "idProofFile, addressProofFront, addressProofLast, photo, " +
                        "ownershipFirst, ownershipSecond, created_at) " +
                        "SELECT ?, app_id, ?, applicantName, mobile, addressLine1, connectionType, email, houseNo, street, addressLine2, addressLine3, " +
                        "city, pincode, ?, ?, ?, ?, ?, ?, ?, " +
                        "tariff, E_phase, E_load, gender, f_hName, idProof, addressProof, " +
                        "idProofFile, addressProofFront, addressProofLast, photo, " +
                        "ownershipFirst, ownershipSecond, NOW() " +
                        "FROM new_connection_requests WHERE app_id=?";

                try (PreparedStatement insertPs = con.prepareStatement(insertQuery)) {
                    insertPs.setString(1, consumerId);
                    insertPs.setString(2, consumerNumber);
                    insertPs.setString(3, names.getDistrictName());
                    insertPs.setString(4, names.getBlockName());
                    insertPs.setString(5, names.getPanchayatName());
                    insertPs.setString(6, names.getVillageName());
                    insertPs.setString(7, names.getDivisionName());
                    insertPs.setString(8, names.getSubDivisionName());
                    insertPs.setString(9, names.getSectionName());
                    insertPs.setString(10, appId);

                    int inserted = insertPs.executeUpdate();
                    if (inserted == 0) {
                        con.rollback();
                        return false;
                    }
                }
            }
            con.commit();
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
        return success;
    }
}
