package com.SBPDCL.services;

import com.SBPDCL.DAO.NewConnectionDAO;

import com.SBPDCL.bean.NewConnectionRequest;


public class NewConnectionService {
	  private NewConnectionDAO dao = new NewConnectionDAO();
	    
	    public boolean processNewConnection(NewConnectionRequest request) throws ClassNotFoundException {
	        return dao.processNewConnection(request);
	    
	}


}

