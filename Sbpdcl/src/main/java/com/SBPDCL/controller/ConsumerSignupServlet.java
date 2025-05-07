package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String name = request.getParameter("name");
        String phoneNo = request.getParameter("phone_no");
        String password = request.getParameter("password");
        boolean isSuccess = UserService.registerConsumer(name, phoneNo, password);
        if (isSuccess) {
            response.sendRedirect("index.html");
        } else {
        	response.sendRedirect("index.html?error=RegistrationFailed");
        }		
	}
}