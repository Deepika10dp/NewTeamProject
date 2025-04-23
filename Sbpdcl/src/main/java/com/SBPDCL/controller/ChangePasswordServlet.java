package com.SBPDCL.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SBPDCL.bean.User;
import com.SBPDCL.services.UserService;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		 HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user_id") == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        String userId = (String) session.getAttribute("user_id");
	        String oldPass = request.getParameter("oldPassword");
	        String newPass = request.getParameter("newPassword");

	        User user = (User) session.getAttribute("user"); // Get user from session
	        int roleId = user.getRoleId(); // Used to identify which dashboard
	        
	        UserService userService = new UserService();
	        boolean success = userService.changePassword(userId, oldPass, newPass);

	     // Set message to show on the dashboard
	        request.setAttribute("msg", success ? "Password changed successfully." : "Old password is incorrect.");

	        // Decide which dashboard to forward to
	        String dashboardPage = "";
	        switch (roleId) {
	            case 1:
	                dashboardPage = "jeeDashboard.jsp";
	                break;
	            case 2:
	                dashboardPage = "miDashboard.jsp";
	                break;
	            case 3:
	                dashboardPage = "aeeDashboard.jsp";
	                break;
	            case 4:
	                dashboardPage = "consumer_dashboard.jsp";
	                break;
	            default:
	                dashboardPage = "unauthorized.jsp";
	                break;
	        }

	        RequestDispatcher rd = request.getRequestDispatcher(dashboardPage + "?page=change_password");
	        rd.forward(request, response);
		//doGet(request, response);
	}

}