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
    public NewConnectionRequest getApplicationDetailsByAppId(String appId) {
        return NewConnectionDAO.getApplicationDetailsByAppId(appId);
    }

   
    public boolean verifyDocuments(String appId, String jeeRemarks, String verificationStatus) {
        return dao.verifyDocuments(appId, jeeRemarks, verificationStatus);
    }



    public List<NewConnectionRequest> getApplicationsForMI(String sectionId) {
        return new NewConnectionDAO().getApplicationsForMI(sectionId);
    }

    public boolean updateMIInspection(String app_id, String mi_remarks) {
        return dao.updateMIInspection(app_id, mi_remarks);
    }
	public boolean checkDuesCleared(String consumerId, String mobile) {
		return false;
	}
	public boolean saveOnlyMIRemarks(String appId, String remarks, String status) throws ClassNotFoundException {
	    boolean remarksSaved = dao.saveOnlyMIRemarks(appId, remarks);

	    if ("Rejected".equalsIgnoreCase(status)) {
	        try {
	            boolean statusUpdated = dao.rejectedStatus(appId);
	            return remarksSaved && statusUpdated;
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    return remarksSaved;
	}	
}
