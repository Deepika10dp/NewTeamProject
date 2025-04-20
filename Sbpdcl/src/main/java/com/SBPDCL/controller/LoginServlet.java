package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SBPDCL.bean.User;
import com.SBPDCL.services.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService=new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
			String userId = request.getParameter("user_id");
	        String password = request.getParameter("password");
	        System.out.println("User ID: " +userId + ", Password: "+password);
	        if(userId==null || userId.isEmpty()) {
	        	response.sendRedirect("index.html?error=Invalid credentials");
	        	return;
	        }

	        User user = userService.loginUser(userId, password);
	        if (user != null) {
	        	System.out.println("Log in successful: "+ user.getName() + "- Role ID: "+user.getRoleId());
	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            int roleId=user.getRoleId();
	            System.out.println("Redirecting based on Role ID: "+roleId);
	            // Redirect based on role
	            switch (user.getRoleId()) {
	               
	                case 1:
	                    response.sendRedirect("miDashboard.jsp");
	                    break;
	                case 2:
	                    response.sendRedirect("jeeDashboard.jsp");
	                    break;

	                case 3:
	                    response.sendRedirect("aeeDashboard.jsp");
	                    break;
	               
	                case 4:
	                    response.sendRedirect("consumerDashboard.jsp");
	                    break;
	                default:
	                    response.sendRedirect("unauthorized.jsp");
	                    break;
	            }
	        } else {
	        	System.out.println("Invalid credentials for user ID: "+userId);
	            response.sendRedirect("login.jsp?error=Invalid credentials");
	        }
		
		//doGet(request, response);
	}

}
