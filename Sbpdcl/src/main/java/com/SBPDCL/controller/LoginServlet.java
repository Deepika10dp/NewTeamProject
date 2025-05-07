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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService=new UserService();
    
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userId = request.getParameter("user_id");
	        String password = request.getParameter("password");
	        System.out.println("User ID: " +userId + ", Password: "+password);
	        if(userId==null || userId.isEmpty()) {
	        	response.sendRedirect("index.html?error=Invalid credentials");
	        	return;
	        }

	        User user = userService.loginUser(userId, password);
	        if (user != null) {
	            System.out.println("Log in successful: " + user.getName() + " - Role ID: " + user.getRoleId());
	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            session.setAttribute("user_id", user.getUserId()); 

	            int roleId = user.getRoleId();
	            System.out.println("Redirecting based on Role ID: " + roleId);

	            switch (roleId) {
	                case 1:
	                	session.setAttribute("section_id", user.getSectionId()); 
	                	response.sendRedirect("jeeDashboard.jsp");
	                    break;
	                case 2:
	                	session.setAttribute("section_id", user.getSectionId());
	                    response.sendRedirect("miDashboard.jsp");
	                    break;
	                case 3:
	                	session.setAttribute("section_id", user.getSectionId());
	                    response.sendRedirect("aeeDashboard.jsp");
	                    break;
	                case 4:
						session.setAttribute("consumerId", user.getUserId());
						System.out.println("Consumer ID set in session: " + user.getUserId());
						response.sendRedirect("consumer_dashboard.jsp");
						break;
	                default:
	                    response.sendRedirect("unauthorized.jsp");
	                    break;
	            }
	        }else {
				System.out.println("Login failed: No user found");
				response.sendRedirect("index.html?error=Invalid credentials");
			}
	}
}