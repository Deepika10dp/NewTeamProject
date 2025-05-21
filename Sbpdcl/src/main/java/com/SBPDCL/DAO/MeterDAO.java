
package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.SBPDCL.bean.Meter;
import com.SBPDCL.util.DBConnection;

public class MeterDAO {
	
	public void insertInspectionDetails(Meter meter) throws SQLException, ClassNotFoundException {
	    String query = "INSERT INTO meter_details (meter_id, app_id, inspector_name, inspection_date, address, site_status, confirmation_status) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {
	    		ps.setString(1,meter.getMeter_id());
	    		ps.setString(2,meter.getApp_id());
	    		ps.setString(3,meter.getInspector_name());
	            ps.setDate(4, new java.sql.Date(meter.getInspection_date().getTime()));
	            ps.setString(5, meter.getAddress());
	            ps.setString(6, meter.getSite_status());
	            ps.setString(7, meter.getConfirmation_status());
	            ps.executeUpdate();
	        }
			
	    }
	    public Meter getMeterByAppId(String app_id) throws SQLException, ClassNotFoundException {
	        Meter meter = null;
	        String sql = "SELECT * FROM meter_details WHERE app_id = ?";
	     
	        try (Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(sql)){
	        	
	            ps.setString(1, app_id);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                meter = new Meter();
	                meter.setMeter_id(rs.getString("meter_id"));
	                meter.setApp_id(rs.getString("app_id"));
	                meter.setMeter_type(rs.getString("meter_type"));
	                meter.setMeter_capacity(rs.getString("meter_capacity"));
	                meter.setInstallation_date(rs.getDate("installation_date"));
	            }
	        }
	        return meter;
	   }
	    
	    public boolean updateMeter(Meter meter)throws SQLException, ClassNotFoundException {
	    	String sql = "UPDATE meter_details SET  meter_type = ?, meter_capacity = ?, installation_date = ? WHERE app_id = ?";
	        
	    	try (Connection conn = DBConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement(sql)){
	            ps.setString(1, meter.getMeter_type());
	            ps.setString(2, meter.getMeter_capacity());
	            ps.setDate(3, new java.sql.Date(meter.getInstallation_date().getTime()));
	            ps.setString(4,meter.getApp_id());
	            ps.executeUpdate();
	        }
			return false;
	    }
	    
	    public Meter getInspectionByAppId(String app_id) throws SQLException, ClassNotFoundException {
	        Meter meter = null;
	        String sql = "SELECT * FROM meter_details WHERE app_id = ?";
	     
	        try (Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(sql)){
	        	
	            ps.setString(1, app_id);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                meter = new Meter();
	                meter.setMeter_id(rs.getString("meter_id"));
	                meter.setApp_id(rs.getString("app_id"));
	                meter.setInspector_name(rs.getString("inspector_name"));
	                meter.setInspection_date(rs.getDate("inspection_date"));
	                meter.setAddress(rs.getString("address"));
	                meter.setSite_status(rs.getString("site_status"));
	                meter.setConfirmation_status(rs.getString("confirmation_status"));
	            }
	        }
	        return meter;
	   }
	    public String getConfirmationStatusByAppId(String app_id) {
	        String status = null;
	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "SELECT confirmation_status FROM meter_details WHERE app_id = ?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, app_id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                status = rs.getString("confirmation_status");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
	    public boolean isMeterDetailsFilled(String appId) {
	        boolean filled = false;
	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement("SELECT * FROM meter_details WHERE app_id = ?")) {
	            ps.setString(1, appId);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                String meterType = rs.getString("meter_type");
	                filled = (meterType != null && !meterType.trim().isEmpty());
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return filled;
	    }
}
