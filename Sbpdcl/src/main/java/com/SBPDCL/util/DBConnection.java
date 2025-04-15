package com.SBPDCL.util;

import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
  
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException
      
    {
      Connection conn = null;

        try {
            Properties props = new Properties();
            InputStream in = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");
            URL url1 = DBConnection.class.getClassLoader().getResource("db.properties");
            System.out.println("Found at: " + url1);
            if (in == null) {
                System.out.println("db.properties not found in classpath!");
                return null;
            }

            props.load(in);

            String driver = props.getProperty("db.driver");
            String url = props.getProperty("db.url");
            String username = props.getProperty("db.username");
            String password = props.getProperty("db.password");

            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

}