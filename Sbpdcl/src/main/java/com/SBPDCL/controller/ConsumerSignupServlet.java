package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.bean.User;
import com.SBPDCL.services.UserService;
@WebServlet("/ConsumerSignupServlet")
public class ConsumerSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    public ConsumerSignupServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String phoneNo = request.getParameter("phone_no");
	    String password = request.getParameter("password");

	    User user = UserService.registerConsumer(name, phoneNo, password);
	    if (user != null) {
	        request.setAttribute("userId", user.getUserId());
	        request.setAttribute("password", user.getPassword());
	        request.getRequestDispatcher("registration_success.jsp").forward(request, response);
	    } else {
	        response.sendRedirect("index.html?error=RegistrationFailed");
	    }
	}
}


