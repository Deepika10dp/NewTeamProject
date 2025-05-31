package com.SBPDCL.controller;

import com.SBPDCL.services.DuesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/SubmitDuesDecisionServlet")
public class SubmitDuesDecisionServlet extends HttpServlet {

    private DuesService duesService = new DuesService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	 String appId = request.getParameter("appId");
         String finalStatus = request.getParameter("finalDuesStatus");

         boolean result = duesService.updateFinalDuesStatus(appId, finalStatus);

         if (result) {
             response.sendRedirect("jeeDashboard.jsp"); 
         } else {
             request.setAttribute("message", "Failed to update dues status for Application ID: " + appId);
             request.getRequestDispatcher("jeeDashboard.jsp").forward(request, response);
         }
    }
}
