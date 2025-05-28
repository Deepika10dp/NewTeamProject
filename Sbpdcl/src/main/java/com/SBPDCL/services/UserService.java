package com.SBPDCL.services;

import com.SBPDCL.DAO.UserDAO;
import com.SBPDCL.bean.User;
import com.SBPDCL.util.ConsumerIDGenerator;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public User loginUser(String userId, String password) {
        return userDAO.loginUser(userId, password);
    }

    public static User registerConsumer(String name, String phoneNo, String password) {
        String consumerId = ConsumerIDGenerator.generateConsumerID();
        User user = new User();
        user.setUserId(consumerId);
        user.setName(name);
        user.setPhoneNo(phoneNo);
        user.setPassword(password);
        user.setRoleId(4); 
        boolean isRegistered = UserDAO.registerConsumer(user);
        if (isRegistered) {
            return user;  // return the user object
        } else {
            return null;
        }
    }

    public boolean changePassword(String userId, String oldPass, String newPass) {
        return userDAO.updatePassword(userId, oldPass, newPass);
    }	   
}