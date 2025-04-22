package com.SBPDCL.services;

import com.SBPDCL.DAO.DuesDAO;
import com.SBPDCL.bean.DuesInfo;

public class DuesService {
	    private DuesDAO dao = new DuesDAO();

	    public DuesInfo checkDues(String consumerId, String mobile) throws Exception {
	        return dao.checkDues(consumerId, mobile);
	    }
	}


