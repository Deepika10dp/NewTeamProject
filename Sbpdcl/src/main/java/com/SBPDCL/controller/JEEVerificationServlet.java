package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.SBPDCL.services.NewConnectionService;
@WebServlet("/JEEVerificationServlet")
public class JEEVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public JEEVerificationServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String appId = request.getParameter("appId");
	    String jeeRemarks = request.getParameter("jeeRemarks");
	    NewConnectionService service = new NewConnectionService();
	    boolean updated = service.verifyDocumentsAndForwardToMI(appId, jeeRemarks);
	    if (updated) {
	        response.sendRedirect("jeeDashboard.jsp?success=true");
	    } else {
	        response.sendRedirect("jeeDashboard.jsp?error=true");
	    }	    }
}