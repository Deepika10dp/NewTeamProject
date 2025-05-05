package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.SBPDCL.bean.Meter;
import com.SBPDCL.util.DBConnection;

public class MeterDAO {
	
	public void insertMeter(Meter meter) throws SQLException, ClassNotFoundException {
	    String query = "INSERT INTO meter_details (meter_id, app_id, meter_type, meter_capacity, installation_date) VALUES (?, ?, ?, ?, ?)";
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {
	    	ps.setString(1, meter.getMeter_id());
	        ps.setString(2, meter.getApp_id());
	        ps.setString(3, meter.getMeter_type());
	        ps.setString(4, meter.getMeter_capacity());
	        ps.setDate(5, new java.sql.Date(meter.getInstallation_date().getTime()));

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
	    
	    public boolean updateInspectionDetails(Meter meter)throws SQLException, ClassNotFoundException {
	    	String sql = "UPDATE meter_details SET inspector_name = ?, inspection_date = ?, address = ?, site_status = ?, confirmation_status = ? WHERE app_id = ?";
	        
	    	try (Connection conn = DBConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement(sql)){
	           
	            ps.setString(1,meter.getInspector_name());
	            ps.setDate(2, new java.sql.Date(meter.getInspection_date().getTime()));
	            ps.setString(3, meter.getAddress());
	            ps.setString(4, meter.getSite_status());
	            ps.setString(5, meter.getConfirmation_status());
	            ps.setString(6,meter.getApp_id());
	            
	            ps.executeUpdate();
	      
	        }
			return false;
	    }
	    
	    public Meter getInspectionByMeterId(String meter_id) throws SQLException, ClassNotFoundException {
	        Meter meter = null;
	        String sql = "SELECT * FROM meter_details WHERE meter_id = ?";
	     
	        try (Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(sql)){
	        	
	            ps.setString(1, meter_id);
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
}







