package com.SBPDCL.services;

import java.util.List;

import com.SBPDCL.DAO.NewConnectionDAO;
import com.SBPDCL.bean.NewConnectionRequest;

public class NewConnectionService {

    private NewConnectionDAO dao = new NewConnectionDAO();
    
    public boolean processNewConnection(NewConnectionRequest request) throws ClassNotFoundException {
        return dao.processNewConnection(request);
    }
    public boolean finalSubmit(String appId) {
        return dao.updateStatusToSubmitted(appId);
    }
    public List<NewConnectionRequest> getApplicationsByConsumer(String consumerId) {
        return new NewConnectionDAO().getApplicationsByConsumer(consumerId);
    }
    public static NewConnectionRequest getRequestByAppId(String appId) {
    	return NewConnectionDAO.getRequestByAppId(appId);
    }
    public List<NewConnectionRequest> getApplicationsForJEE(String sectionId) {
        return new NewConnectionDAO().getRequestsForJEE(sectionId);
    }
    public boolean verifyDocumentsAndForwardToMI(String appId, String jeeRemarks) {
        // Call the DAO method to update the database
        return dao.verifyDocumentsAndForwardToMI(appId, jeeRemarks);
    }


    public List<NewConnectionRequest> getApplicationsForMI(String sectionId) {
        return new NewConnectionDAO().getApplicationsForMI(sectionId);
    }

    public boolean updateMIInspection(String appId, String miRemarks) {
        return new NewConnectionDAO().updateMIInspection(appId, miRemarks);
    }
	public boolean checkDuesCleared(String consumerId, String mobile) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
