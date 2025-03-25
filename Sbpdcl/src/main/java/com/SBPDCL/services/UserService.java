package com.SBPDCL.services;

import com.SBPDCL.DAO.UserDAO;
import com.SBPDCL.bean.User;

public class UserService {
	 private UserDAO userDAO = new UserDAO();

	    public User loginUser(String userId, String password) {
	        return userDAO.loginUser(userId, password);
	    }
}
