package com.SBPDCL.controller;

import com.SBPDCL.bean.NewConnectionRequest;
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
        HttpSession session = request.getSession();
        NewConnectionRequest formData = (NewConnectionRequest) session.getAttribute("formData");

        if (formData == null) {
            request.setAttribute("message", "Session expired. Please fill the form again.");
            request.getRequestDispatcher("form.html").forward(request, response);
            return;
        }

        boolean success = false;
        try {
            // Step 1: Insert application data
            success = connectionService.processNewConnection(formData);

            // Step 2: If insertion is successful, update status
            if (success) {
                String appId = formData.getApp_id(); // Ensure app_id is set in formData
                boolean statusUpdated = connectionService.finalSubmit(appId);
                System.out.println("Status update result: " + statusUpdated);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (success) {
            session.removeAttribute("formData");
            request.setAttribute("message", "Application submitted successfully!");
            request.getRequestDispatcher("submit_success.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Error submitting application. Try again.");
            request.getRequestDispatcher("submit_error.jsp").forward(request, response);
        }

        System.out.println("App ID submitted: " + formData.getApp_id());
    }
}
