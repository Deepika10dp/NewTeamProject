package com.SBPDCL.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.SBPDCL.bean.User;
import com.SBPDCL.util.DBConnection;

public class UserDAO {
	 public User loginUser(String userId, String password) {
	        User user = null;
	        try (Connection conn = DBConnection.getConnection()) {
	            String query ="SELECT user_id,name,phone_no,password,role_id FROM users WHERE user_id= ? AND password=?";
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
	
	public boolean changePassword(String userId, String newPassword) {
		// TODO Auto-generated method stub
		 boolean status = false;
	        try (Connection con = DBConnection.getConnection()) {
	            String query = "UPDATE users SET password = ? WHERE user_id = ?";
	            PreparedStatement ps = con.prepareStatement(query);
	            ps.setString(1, newPassword);
	            ps.setString(2, userId);
	            int rowsUpdated = ps.executeUpdate();
	            if (rowsUpdated > 0) {
	                status = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        return status;
	}
}
