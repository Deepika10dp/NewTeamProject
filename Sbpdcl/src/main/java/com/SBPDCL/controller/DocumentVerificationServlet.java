package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.services.NewConnectionService;

/**
 * Servlet implementation class DocumentVerificationServlet
 */
@WebServlet("/DocumentVerificationServlet")
public class DocumentVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private NewConnectionService service = new NewConnectionService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocumentVerificationServlet() {
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
		 String appId = request.getParameter("app_id");
	        String jeeRemarks = request.getParameter("jee_remarks");

	        service.verifyDocumentsAndForwardToMI(appId, jeeRemarks);

	        response.sendRedirect("jeeDashboard.jsp?message=Documents+verified+and+forwarded+to+MI");
	}

}
