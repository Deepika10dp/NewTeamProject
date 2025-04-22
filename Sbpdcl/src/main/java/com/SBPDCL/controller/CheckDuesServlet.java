package com.SBPDCL.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.bean.DuesInfo;
import com.SBPDCL.services.DuesService;
@WebServlet("/CheckDuesServlet")
public class CheckDuesServlet extends HttpServlet {
	  
	private static final long serialVersionUID = 1L;
	
	public CheckDuesServlet() {
		super();
	}

		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	        String consumerId = req.getParameter("consumerId");
	        String mobile = req.getParameter("mobile");

	        DuesService service = new DuesService();

	        try {
	            DuesInfo info = service.checkDues(consumerId, mobile);

	            res.setContentType("text/html");
	            PrintWriter out = res.getWriter();
	            out.println("<html><body><div style='padding: 20px;'>");

	            if (info != null) {
	                out.println("<h3>Dues Details</h3>");
	                out.println("<p><strong>Amount:</strong> " + info.getDues_amount() + "</p>");
	                out.println("<p><strong>Status:</strong> " + info.getDues_status() + "</p>");
	            } else {
	                out.println("<p style='color:red;'>No dues record found for the given details.</p>");
	            }

	            out.println("</div></body></html>");

	        } catch (Exception e) {
	            throw new ServletException("Error checking dues", e);
	        }
	    }
	}


