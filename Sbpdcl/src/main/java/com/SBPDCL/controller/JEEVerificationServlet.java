package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.services.NewConnectionService;

/**
 * Servlet implementation class JEEVerificationServlet
 */
@WebServlet("/JEEVerificationServlet")
public class JEEVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JEEVerificationServlet() {
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
	        String jeeRemarks = request.getParameter("jeeRemarks");

	        NewConnectionService service = new NewConnectionService();
	        boolean updated = service.updateJEEVerification(appId, jeeRemarks);

	        if (updated) {
	            response.sendRedirect("jeeDashboard.jsp?success=true");
	        } else {
	            response.sendRedirect("jeeDashboard.jsp?error=true");
	        }
	}

}
