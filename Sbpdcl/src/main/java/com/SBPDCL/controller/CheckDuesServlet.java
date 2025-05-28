package com.SBPDCL.controller;

import com.SBPDCL.services.DuesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CheckDuesServlet")
public class CheckDuesServlet extends HttpServlet {

    private DuesService duesService = new DuesService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String consumerId = request.getParameter("consumerId");
        String mobile = request.getParameter("mobile");
        String appId = request.getParameter("appId");
        String duesStatus = duesService.getDuesStatus(consumerId, mobile);
        System.out.println("CheckDuesServlet - consumerId: " + consumerId + ", mobile: " + mobile + ", appId: " + appId);

        request.setAttribute("consumerId", consumerId);
        request.setAttribute("mobile", mobile);
        request.setAttribute("duesStatus", duesStatus);
        request.setAttribute("appId", appId);
        request.getRequestDispatcher("duesCheck.jsp").forward(request, response);
    }
}
