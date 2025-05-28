package com.SBPDCL.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.SBPDCL.bean.LocationNameBean;
import com.SBPDCL.bean.NewConnectionRequest;
import com.SBPDCL.services.NewConnectionService;
import com.SBPDCL.util.LocationNameUtil;
@WebServlet("/ViewApplicationServlet")
public class ViewApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ViewApplicationServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String appId = request.getParameter("appId");
		
		NewConnectionRequest requestData = NewConnectionService.getRequestByAppId(appId);
		
		if (requestData != null) {
		    LocationNameBean locationNames = LocationNameUtil.getLocationNames(requestData);
		    request.setAttribute("appData", requestData);
		    request.setAttribute("locationNames", locationNames);
		    System.out.println("Request object consumerId: " + requestData.getConsumerId()); // ✅ moved here
		    RequestDispatcher rd = request.getRequestDispatcher("application_details.jsp");
		    rd.forward(request, response);
		} else {
		    response.sendRedirect("consumer_dashboard.jsp?error=InvalidApplicationId");
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
