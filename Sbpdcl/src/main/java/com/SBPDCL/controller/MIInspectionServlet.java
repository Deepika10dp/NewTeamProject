package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.SBPDCL.services.NewConnectionService;
@WebServlet("/MIInspectionServlet")
public class MIInspectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MIInspectionServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String app_id = request.getParameter("app_id");
        String mi_remarks = request.getParameter("mi_remarks");
        NewConnectionService service = new NewConnectionService();
        if (app_id != null && mi_remarks != null) {
            boolean updated = service.updateMIInspection(app_id, mi_remarks);
            if (updated) {
                response.sendRedirect("miDashboard.jsp?success=true");
            } else {
                response.sendRedirect("miDashboard.jsp?error=true");
            }
        } else {
            response.sendRedirect("miDashboard.jsp?error=invalid");
        }

	}

}