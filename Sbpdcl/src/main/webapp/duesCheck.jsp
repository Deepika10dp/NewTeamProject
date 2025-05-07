<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String consumerId = request.getParameter("consumerId") != null ? request.getParameter("consumerId") : "";
    String mobile = request.getParameter("mobile") != null ? request.getParameter("mobile") : "";
    String status = (String) request.getAttribute("duesStatus"); // Comes from servlet if already checked
%>
<html>
<head>
    <title>Check Dues</title>
</head>
<body>
    <div style="width: 400px; margin: auto; padding: 20px; border: 1px solid #ccc;">
        <h2>Check Dues - Consumer ID: <%= consumerId %></h2>
        <form action="CheckDuesServlet" method="post">
            <label>Consumer ID</label><br>
            <input type="text" name="consumerId" value="<%= consumerId %>" readonly required><br><br>

            <label>Phone Number</label><br>
            <input type="text" name="mobile" value="<%= mobile %>" readonly required><br><br>

            <% if (status != null) { %>
                <p><strong>Status:</strong> <%= status %></p>
                <% if ("Cleared".equalsIgnoreCase(status)) { %>
                    <label><input type="checkbox" name="duesCleared" value="yes" required> Confirm dues are cleared</label><br><br>
                <% } else { %>
                    <p style="color: red;">Dues are not cleared.</p>
                <% } %>
            <% } %>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
