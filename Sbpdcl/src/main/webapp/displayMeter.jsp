<%@ page import="com.SBPDCL.bean.Meter" %>
<%
    Meter meter = (Meter) request.getAttribute("meter");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Meter Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } else if (meter != null) { %>
        <h3>Meter Details</h3>
        <table class="table table-bordered">
        	<tr><th>Meter ID</th><td><%= meter.getMeter_id() %></td></tr>
            <tr><th>Application ID</th><td><%= meter.getApp_id() %></td></tr>
            <tr><th>Meter Type</th><td><%= meter.getMeter_type() %></td></tr>
            <tr><th>Meter Capacity</th><td><%= meter.getMeter_capacity() %></td></tr>
            <tr><th>Installation Date</th><td><%= meter.getInstallation_date() %></td></tr>
        </table>
    <% } else { %>
        <div class="alert alert-warning">No meter details found.</div>
    <% } %>
</div>
</body>
</html>