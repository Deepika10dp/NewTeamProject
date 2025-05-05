<%@ page import="com.SBPDCL.bean.Meter" %>
<%
    Meter meter = (Meter) request.getAttribute("meter");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Inspection Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } else if (meter != null) { %>
        <h3>Inspection Details</h3>
        <table class="table table-bordered">
        	<tr><th>Meter ID</th><td><%= meter.getMeter_id() %></td></tr>
            <tr><th>Application ID</th><td><%= meter.getApp_id() %></td></tr>
            <tr><th>Inspector Name</th><td><%= meter.getInspector_name() %></td></tr>
            <tr><th>Inspection Date</th><td><%= meter.getInspection_date() %></td></tr>
            <tr><th>Address</th><td><%= meter.getAddress() %></td></tr>
            <tr><th>Site Status</th><td><%= meter.getSite_status() %></td></tr>
            <tr><th>Confirmation Status</th><td><%= meter.getConfirmation_status() %></td></tr>
        </table>
    <% } else { %>
        <div class="alert alert-warning">No inspection details found.</div>
    <% } %>
</div>
</body>
</html>