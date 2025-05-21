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

        String consumerId = request.getParameter("consumerId");
        String mobile = request.getParameter("mobile");
        String finalStatus = request.getParameter("finalDuesStatus"); // Cleared or Not Cleared

        duesService.updateFinalDuesStatus(consumerId, mobile, finalStatus);

        request.setAttribute("message", "✅ Decision updated for Consumer ID: " + consumerId + " as " + finalStatus);
        request.getRequestDispatcher("jeeDashboard.jsp").forward(request, response);
    }
}
