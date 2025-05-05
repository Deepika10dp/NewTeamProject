package com.SBPDCL.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.bean.Meter;
import com.SBPDCL.services.MeterService;

@SuppressWarnings("serial")
@WebServlet("/InspectionDetailsServlet")
public class InspectionDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String app_id = request.getParameter("app_id");
        String inspector_name = request.getParameter("inspector_name");
        String inspection_date = request.getParameter("inspection_date");
        String address = request.getParameter("address");
        String site_status = request.getParameter("site_status");
        String confirmation_status = request.getParameter("confirmation_status");

        try {
            Meter meter = new Meter();
            meter.setApp_id(app_id);
            meter.setInspector_name(inspector_name);
            meter.setInspection_date(java.sql.Date.valueOf(inspection_date));
            meter.setAddress(address);
            meter.setSite_status(site_status);
            meter.setConfirmation_status(confirmation_status);

            MeterService service = new MeterService();
            service.updateInspectionDetails(meter);

	    
			response.getWriter().write("Inspection details saved successfully.");
			
		}catch (IOException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new ServletException(e); 
        }
    }
}

	  



