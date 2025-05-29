package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

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

        String remarksLower = mi_remarks.toLowerCase().trim();

        try {
            if ("save".equalsIgnoreCase(action)) {
                boolean saved = service.saveOnlyMIRemarks(app_id, mi_remarks, remarksLower);
                if (saved) {
                    response.sendRedirect("miDashboard.jsp?success=remarks_saved");
                } else {
                    response.sendRedirect("miDashboard.jsp?error=save_failed");
                }

            } else if ("forward".equalsIgnoreCase(action)) {
                boolean updatedRemarks = service. updateMIInspection(app_id, mi_remarks);

                if (remarksLower.contains("rejected")) {
                    boolean rejected = service.saveOnlyMIRemarks(app_id, mi_remarks, remarksLower);
                    if (updatedRemarks && rejected) {
                        response.sendRedirect("miDashboard.jsp?success=rejected");
                    } else {
                        response.sendRedirect("miDashboard.jsp?error=rejection_failed");
                    }

                } else if (remarksLower.contains("approved")) {
                    boolean forwarded = service.forwardToAEE(app_id);
                    if (updatedRemarks && forwarded) {
                        response.sendRedirect("miDashboard.jsp?success=forwarded_to_aee");
                    } else {
                        response.sendRedirect("miDashboard.jsp?error=forward_failed");
                    }

                } else if (remarksLower.contains("pending")) {
                    // Don't forward or change status
                    if (updatedRemarks) {
                        response.sendRedirect("miDashboard.jsp?success=pending_saved");
                    } else {
                        response.sendRedirect("miDashboard.jsp?error=pending_failed");
                    }

                } else {
                    // Invalid remark: not approved/rejected/pending
                    response.sendRedirect("miDashboard.jsp?error=invalid_remarks");
                }

            } else {
                response.sendRedirect("miDashboard.jsp?error=invalid_action");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("miDashboard.jsp?error=server_error");
        }
    }
}