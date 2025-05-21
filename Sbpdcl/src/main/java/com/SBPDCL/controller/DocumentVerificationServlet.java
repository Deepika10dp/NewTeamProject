package com.SBPDCL.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.DAO.NewConnectionDAO;
import com.SBPDCL.bean.LocationNameBean;
import com.SBPDCL.bean.NewConnectionRequest;
import com.SBPDCL.services.NewConnectionService;
import com.SBPDCL.util.LocationNameUtil;

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
        String appId = request.getParameter("appId");
        System.out.println("appId: " + appId);

        if (appId != null && !appId.trim().isEmpty()) {
            NewConnectionRequest appData = service.getApplicationDetailsByAppId(appId);
            if (appData != null) {
                // Fetch location names using LocationNameUtil
                LocationNameBean locationNames = LocationNameUtil.getLocationNames(appData);

                request.setAttribute("details", appData);
                request.setAttribute("locationNames", locationNames);
                RequestDispatcher rd = request.getRequestDispatcher("verify_documents.jsp");
                rd.forward(request, response);
                return;
            }
        }

        // If application not found
        request.setAttribute("errorMessage", "No application details found. Please go back and try again.");
        RequestDispatcher rd = request.getRequestDispatcher("verify_documents.jsp");
        rd.forward(request, response);
    
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String appId = request.getParameter("appId");
	    String jeeRemarks = request.getParameter("jee_remarks");

	    boolean idProofChecked = request.getParameter("doc_id_proof") != null;
	    boolean addressFrontChecked = request.getParameter("doc_address_front") != null;
	    boolean addressBackChecked = request.getParameter("doc_address_back") != null;
	    boolean photoChecked = request.getParameter("doc_photo") != null;
	    boolean ownership1Checked = request.getParameter("doc_ownership1") != null;
	    boolean ownership2Checked = request.getParameter("doc_ownership2") != null;

	    if (idProofChecked && addressFrontChecked && addressBackChecked && photoChecked 
	        && ownership1Checked && ownership2Checked && jeeRemarks != null && !jeeRemarks.trim().isEmpty()) {

	        boolean updateSuccess = service.verifyDocumentsAndForwardToMI(appId, jeeRemarks);

	        if (updateSuccess) {
	            response.sendRedirect("jeeDashboard.jsp?message=Documents+verified+and+forwarded+to+MI");
	        } else {
	            response.sendRedirect("verify_documents.jsp?appId=" + appId + "&error=Failed+to+update+verification+status");
	        }
	    } else {
	        response.sendRedirect("verify_documents.jsp?appId=" + appId + "&error=Please+verify+all+documents+and+enter+remarks");
	    }
	}


}
