package com.SBPDCL.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.bean.Meter;
import com.SBPDCL.services.MeterService;

@SuppressWarnings("serial")
@WebServlet("/FetchInspectionServlet")
	public class FetchInspectionServlet extends HttpServlet {

		
			private MeterService service = new MeterService();

		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        String meterId = request.getParameter("meter_id");

		        try {
		        	Meter meter = service.getInspectionByMeterId(meterId);
		            request.setAttribute("meter", meter);
		            RequestDispatcher dispatcher = request.getRequestDispatcher("FetchInspectionDetails.jsp");
		            dispatcher.forward(request, response);
		        } catch (Exception e) {
		            e.printStackTrace();
		            request.setAttribute("error", "Details not found or error occurred.");
		            request.getRequestDispatcher("FetchInspectionDetails.jsp").forward(request, response);
		        }
		    }
}




