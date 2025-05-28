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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String app_id = request.getParameter("app_id");
        String mi_remarks = request.getParameter("mi_remarks");
        String action = request.getParameter("action");

        NewConnectionService service = new NewConnectionService();

        if (app_id == null || mi_remarks == null || action == null) {
            response.sendRedirect("miDashboard.jsp?error=invalid_input");
            return;
        }

        String remarksLower = mi_remarks.toLowerCase();

        // Save or forward logic
        if ("save".equalsIgnoreCase(action)) {
            // Save remarks without changing status
            boolean saved = false;
			try {
				saved = service.saveOnlyMIRemarks(app_id, mi_remarks);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            if (saved) {
                response.sendRedirect("miDashboard.jsp?success=remarks_saved");
            } else {
                response.sendRedirect("miDashboard.jsp?error=save_failed");
            }
        } else if ("forward".equalsIgnoreCase(action)) {
            if (remarksLower.contains("rejected") || remarksLower.contains("pending")) {
                // Don't allow forward if rejected or pending
                response.sendRedirect("miDashboard.jsp?error=not_forwarded_invalid_remarks");
            } else if (remarksLower.contains("approved")) {
                // Update remarks and status, then forward
                boolean updated = service.updateMIInspection(app_id, mi_remarks);
                boolean forwarded = false;
				try {
					forwarded = service.forwardToAEE(app_id);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                if (updated && forwarded) {
                    response.sendRedirect("miDashboard.jsp?success=forwarded_to_AEE");
                } else {
                    response.sendRedirect("miDashboard.jsp?error=forward_failed");
                }
            } else {
                // Default case — not approved
                response.sendRedirect("miDashboard.jsp?error=remarks_not_approved");
            }
        } else {
            response.sendRedirect("miDashboard.jsp?error=invalid_action");
        }
    }
}