package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.SBPDCL.services.DuesService;

@WebServlet("/CheckDuesServlet")
public class CheckDuesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    DuesService service = new DuesService(); // ✅ FIXED: Using correct service

    public CheckDuesServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String consumerId = request.getParameter("consumerId");
        String mobile = request.getParameter("mobile");
        String duesConfirmed = request.getParameter("duesCleared");

        boolean duesCleared = service.checkDuesCleared(consumerId, mobile);

        if ("yes".equalsIgnoreCase(duesConfirmed) && duesCleared) {
            // ✅ Optional: update dues_cleared status in new_connection_requests table
            service.updateDuesClearedInRequest(consumerId, mobile);
            response.sendRedirect("jeeDashboard.jsp?consumer_id=" + consumerId + "&mobile=" + mobile);
            return;
        }

        // Show dues status
        String duesStatus = duesCleared ? "Cleared" : "Not Cleared";
        request.setAttribute("consumerId", consumerId);
        request.setAttribute("mobile", mobile);
        request.setAttribute("duesStatus", duesStatus);

        RequestDispatcher rd = request.getRequestDispatcher("duesCheck.jsp");
        rd.forward(request, response);
    }
}
