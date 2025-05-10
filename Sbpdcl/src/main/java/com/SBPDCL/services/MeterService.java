
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
        meter.setMeter_id(generateMeterId());
        dao.insertMeter(meter);
    }
    
    public Meter getMeterByAppId(String app_id) throws SQLException, ClassNotFoundException{
    	return dao.getMeterByAppId(app_id);
    }
   
    public void updateInspectionDetails(Meter meter) throws SQLException, ClassNotFoundException {
    	dao.updateInspectionDetails(meter);
    }
    
    public Meter getInspectionByMeterId(String meter_id) throws SQLException, ClassNotFoundException{
    	return dao.getInspectionByMeterId(meter_id);
    }
}
