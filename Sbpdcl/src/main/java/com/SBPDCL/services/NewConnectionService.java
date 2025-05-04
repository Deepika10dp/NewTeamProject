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

}
