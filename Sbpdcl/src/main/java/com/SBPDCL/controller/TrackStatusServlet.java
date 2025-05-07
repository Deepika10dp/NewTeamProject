package com.SBPDCL.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SBPDCL.bean.NewConnectionRequest;
import com.SBPDCL.services.NewConnectionService;

@WebServlet("/TrackStatusServlet")
public class TrackStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TrackStatusServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

        if (session != null) {
            String consumerId = (String) session.getAttribute("consumerId");
            System.out.println("Consumer ID: " + consumerId); 

            if (consumerId != null) {
                List<NewConnectionRequest> applications = new NewConnectionService().getApplicationsByConsumer(consumerId);
                request.setAttribute("applications", applications);
                request.getRequestDispatcher("trackStatus.jsp").forward(request, response);
            } else {
                System.out.println("Consumer ID not found in session.");
                response.sendRedirect("index.html");
            }
        } else {
            System.out.println("Session is null.");
            response.sendRedirect("index.html");
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}