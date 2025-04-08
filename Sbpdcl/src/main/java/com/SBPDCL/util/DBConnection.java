package com.SBPDCL.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException
    {
    	Properties props=new Properties();
    	try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                System.out.println("Unable to find db.properties");
                return null;
            }
            props.load(input);
        } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String url = props.getProperty("db.url");
        String user = props.getProperty("db.user");
        String password = props.getProperty("db.password");
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
