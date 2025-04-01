<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password </title>
</head>
<body>
    <h2>Change Password</h2>
    <% if(request.getParameter("error") != null) { %>
        <p style="color:red;"><%= request.getParameter("error") %></p>
    <% } %>
    <form action="ChangePasswordServlet" method="post">
        <label>Old Password:</label>
        <input type="password" name="oldPassword" required><br>

        <label>New Password:</label>
        <input type="password" name="newPassword" required><br>

        <label>Confirm New Password:</label>
        <input type="password" name="confirmPassword" required><br>

        <input type="submit" value="Change Password">
    </form>
</body>
</html>