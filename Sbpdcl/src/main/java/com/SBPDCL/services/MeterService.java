
package com.SBPDCL.services;

import java.sql.SQLException;


import com.SBPDCL.DAO.MeterDAO;
import com.SBPDCL.bean.Meter;


public class MeterService {

    private MeterDAO dao = new MeterDAO();

    public String generateMeterId() {
        return "MTR" + System.currentTimeMillis();
    }

    public void saveMeter(Meter meter) throws SQLException, ClassNotFoundException {
        dao.updateMeter(meter);
    }
    
    public Meter getMeterByAppId(String app_id) throws SQLException, ClassNotFoundException{
    	return dao.getMeterByAppId(app_id);
    }
   
    public void insertInspectionDetails(Meter meter) throws SQLException, ClassNotFoundException {
    	meter.setMeter_id(generateMeterId());
    	dao.insertInspectionDetails(meter);
    }
    
    public Meter getInspectionByAppId(String app_id) throws SQLException, ClassNotFoundException{
    	return dao.getInspectionByAppId(app_id);
    }
    public String getConfirmationStatusByAppId(String app_id) throws SQLException, ClassNotFoundException{
    	return dao.getConfirmationStatusByAppId(app_id);
    }
    public boolean isMeterDetailsFilled(String app_id) throws SQLException, ClassNotFoundException{
    	return dao.isMeterDetailsFilled(app_id);
    }
}
