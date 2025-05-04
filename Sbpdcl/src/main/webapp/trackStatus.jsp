<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.SBPDCL.bean.NewConnectionRequest" %>

<%
    List<NewConnectionRequest> applications = (List<NewConnectionRequest>) request.getAttribute("applications");
%>

<div class="container">
    <h4 class="mb-4">Your Application Status</h4>
    <div class="row row-cols-1 row-cols-md-2 g-4">
        <%
            if (applications != null && !applications.isEmpty()) {
                for (NewConnectionRequest app : applications) {
        %>
        <%
   			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    		String formattedDate = sdf.format(app.getSubmissionDate());
		%>
        <div class="col">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Application ID: <%= app.getApp_id() %></h5>
                    <p class="card-text"><strong>Date:</strong> <%= formattedDate %></p>
                    <p class="card-text"><strong>Status:</strong> <span class="badge bg-info"><%= app.getStatus() %></span></p>
                    <a href="ViewApplicationServlet?appId=<%= app.getApp_id() %>" class="btn btn-sm btn-outline-primary">View Details</a>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="col">
            <div class="alert alert-warning">No applications found.</div>
        </div>
        <%
            }
        %>
    </div>
</div>
