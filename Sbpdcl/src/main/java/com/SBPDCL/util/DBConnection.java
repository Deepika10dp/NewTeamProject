package com.SBPDCL.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static  String url = "jdbc:mysql://localhost:3306/projectdb";
    static String user = "root";
<<<<<<< HEAD
    static String password = "chand@3002";
=======
    static String password = "da_1014";
>>>>>>> branch 'master' of https://github.com/Deepika10dp/NewTeamProject
    
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException
    {
    	 try {
    		    Class.forName("com.mysql.cj.jdbc.Driver");
    		   } catch (ClassNotFoundException e) {
    		    // TODO Auto-generated catch block
    		    e.printStackTrace();
    		   }
    		      Connection connection =DriverManager.getConnection(url,user,password);
    		      return connection;
    		     }
}
