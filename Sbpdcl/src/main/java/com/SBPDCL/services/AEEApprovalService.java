package com.SBPDCL.services;

import java.util.List;
import java.util.UUID;

import com.SBPDCL.DAO.AEEApprovalDAO;
import com.SBPDCL.bean.NewConnectionRequest;

public class AEEApprovalService {
    AEEApprovalDAO dao = new AEEApprovalDAO();

    public List<NewConnectionRequest> getAEEApplications(String sectionId) {
        return dao.getApplicationsForAEE(sectionId);
    }

    public boolean approve(String appId, String consumerId, String remarks) {
        String consumerNumber;
        if (dao.isConsumerExists( consumerId)) {
            consumerNumber = dao.getExistingConsumerNumber( consumerId);
        } else {
            consumerNumber = generateConsumerNumber();
        }
        return dao.approveApplication(appId, consumerId, remarks, consumerNumber);
    }

    private String generateConsumerNumber() {
        return "CNSMR" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}