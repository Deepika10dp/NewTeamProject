package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.SBPDCL.bean.User;
import com.SBPDCL.util.DBConnection;

public class UserDAO {
	 public User loginUser(String userId, String password) {
	        User user = null;
	        try (Connection conn = DBConnection.getConnection()) {
	            String query ="SELECT user_id,name,phone_no,password,role_id,section_id FROM users WHERE user_id= ? AND password=?";
	            		/* "SELECT u.user_id, u.name, u.password, u.phone, u.role_id, r.role_name " +
	                           "FROM users u JOIN roles r ON u.role_id = r.id " +
	                           "WHERE u.user_id = ? AND u.password = ?";*/
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, userId);
	            ps.setString(2, password);
	            ResultSet rs = ps.executeQuery();
	            System.out.println("User ID: "+userId+ ", Password: "+password);
	            if (rs.next()) {
	            	System.out.println("Database Record Found:");
	                System.out.println("User ID: " + rs.getString("user_id"));
	                System.out.println("Name: " + rs.getString("name"));
	                System.out.println("Phone: " + rs.getString("phone_no"));
	                System.out.println("Password: " + rs.getString("password"));
	                System.out.println("Role ID from DB: " + rs.getInt("role_id")); 
	                
	                user = new User();
	                user.setUserId(rs.getString("user_id"));
	                user.setName(rs.getString("name"));
	                user.setPassword(rs.getString("password"));
	                user.setPhoneNo(rs.getString("phone_no"));
	                int roleId=rs.getInt("role_id");
	                user.setSectionId(rs.getString("section_id")); // important for JEE
	                System.out.println("Setting Role ID in the user object: " +roleId);
	                user.setRoleId(rs.getInt("role_id"));
	             //   user.setRoleName(rs.getString("role_name"));
	            }
	            else {
	            	System.out.println("No user found with given credentials");
	            }
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return user;
	 }
	 public static boolean registerConsumer(User user) {
	        try (Connection conn = DBConnection.getConnection()) {
	            String query = "INSERT INTO users (user_id, name, phone_no, password, role_id) VALUES (?, ?, ?, ?, ?)";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, user.getUserId());
	            ps.setString(2, user.getName());
	            ps.setString(3, user.getPhoneNo());
	            ps.setString(4, user.getPassword());
	            ps.setInt(5, user.getRoleId());
	            return ps.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 public User getUserById(String userId) {
	        User user = null;
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE user_id = ?")) {

	            ps.setString(1, userId);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                user = new User();
	                user.setUserId(rs.getString("user_id"));
	                user.setPassword(rs.getString("password")); // Already hashed
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return user;
	    }

	  public boolean updatePassword(String userId, String oldPassword, String newPassword) {
	        Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        boolean success = false;

	        try {
	            conn = DBConnection.getConnection();

	            // Check if old password is correct
	            ps = conn.prepareStatement("SELECT password FROM users WHERE user_id = ?");
	            ps.setString(1, userId);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	                String currentPassword = rs.getString("password");
	                if (!currentPassword.equals(oldPassword)) {
	                    return false;
	                }
	            }

	            // Update to new password
	            ps = conn.prepareStatement("UPDATE users SET password = ? WHERE user_id = ?");
	            ps.setString(1, newPassword);
	            ps.setString(2, userId);
	            int rows = ps.executeUpdate();
	            success = rows > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try { if (rs != null) rs.close(); } catch (Exception e) {}
	            try { if (ps != null) ps.close(); } catch (Exception e) {}
	            try { if (conn != null) conn.close(); } catch (Exception e) {}
	        }
	        return success;
	    }
}
