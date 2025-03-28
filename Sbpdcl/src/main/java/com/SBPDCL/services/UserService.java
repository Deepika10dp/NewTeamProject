package com.SBPDCL.services;

import com.SBPDCL.DAO.UserDAO;
import com.SBPDCL.bean.User;
import com.SBPDCL.util.ConsumerIDGenerator;
import com.SBPDCL.util.SMSService;

public class UserService {
	 private UserDAO userDAO = new UserDAO();

	    public User loginUser(String userId, String password) {
	        return userDAO.loginUser(userId, password);
	    }
	    public static boolean registerConsumer(String name, String phoneNo, String password) {
	        String consumerId = ConsumerIDGenerator.generateConsumerID();
	        User user = new User();
	        user.setUserId(consumerId);
	        user.setName(name);
	        user.setPhoneNo(phoneNo);
	        user.setPassword(password);
	        user.setRoleId(6); // Role ID for Consumer

	        boolean isRegistered = UserDAO.registerConsumer(user);
	        if (isRegistered) {
	            String message = "Welcome! Your Consumer ID: " + consumerId + " Password: " + password;
	            SMSService.sendSMS(phoneNo, message);
	        }
	        return isRegistered;
	    }
	   
}
