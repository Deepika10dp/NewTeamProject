package com.SBPDCL.services;

import com.SBPDCL.DAO.DuesDAO;

public class DuesService {
    DuesDAO duesDAO = new DuesDAO();

    public boolean checkDuesCleared(String consumerId, String mobile) {
        return duesDAO.checkDuesCleared(consumerId, mobile);
    }

    public String getDuesStatus(String consumerId, String mobile) {
        return duesDAO.getDuesStatus(consumerId, mobile);
    }

    public void updateFinalDuesStatus(String consumerId, String mobile, String finalStatus) {
        duesDAO.updateFinalDuesStatus(consumerId, mobile, finalStatus);
    }

}
