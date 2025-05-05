package com.SBPDCL.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.bean.Meter;
import com.SBPDCL.services.MeterService;

@SuppressWarnings("serial")
@WebServlet("/MeterServlet")
public class MeterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String app_id = request.getParameter("app_id");
        String meter_type = request.getParameter("meter_type");
        String meter_capacity = request.getParameter("meter_capacity");
        String installation_date = request.getParameter("installation_date");

        try {
            Meter meter = new Meter();
            meter.setApp_id(app_id);
            meter.setMeter_type(meter_type);
            meter.setMeter_capacity(meter_capacity);
            meter.setInstallation_date(java.sql.Date.valueOf(installation_date));

            MeterService service = new MeterService();
            service.saveMeter(meter);

	            response.sendRedirect("miDashboard.jsp?message=Data+Submitted");

	        } catch (IOException | ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            throw new ServletException(e); 
	        }
	    }
}
	


