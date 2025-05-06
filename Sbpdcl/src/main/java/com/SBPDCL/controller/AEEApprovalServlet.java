package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.services.AEEApprovalService;

/**
 * Servlet implementation class AEEApprovalServlet
 */
@WebServlet("/AEEApprovalServlet")
public class AEEApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AEEApprovalService service = new AEEApprovalService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AEEApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String appId = request.getParameter("appId");
        String remarks = request.getParameter("aeeRemarks");
        String userId = request.getParameter("userId");

        boolean success = service.approve(appId, userId, remarks);

        if (success) {
            response.sendRedirect("aeeDashboard.jsp?msg=Approval successful");
        } else {
            response.sendRedirect("aeeDashboard.jsp?error=Approval failed");
        }
	}

}
