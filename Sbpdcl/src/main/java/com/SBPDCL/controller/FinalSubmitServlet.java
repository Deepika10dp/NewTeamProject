package com.SBPDCL.controller;

import com.SBPDCL.services.NewConnectionService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/FinalSubmitServlet")
public class FinalSubmitServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private NewConnectionService connectionService = new NewConnectionService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String appId = request.getParameter("app_id");

        boolean success = connectionService.finalSubmit(appId);

        if (success) {
            request.setAttribute("message", "Application submitted successfully!");
            request.getRequestDispatcher("submit_success.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Error submitting application. Try again.");
            request.getRequestDispatcher("submit_error.jsp").forward(request, response);
        }
        System.out.println("App ID received in FinalSubmitServlet: " + appId);

    }
}