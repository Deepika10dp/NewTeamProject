<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consumer Sign up</title>
</head>
<body>
    <h2>Consumer Sign up</h2>
    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;"><%= request.getParameter("error") %></p>
    <% } %>
    <form action="ConsumerSignupServlet" method="post">
        <label>Name:</label> <input type="text" name="name" required><br>
        <label>Phone:</label> <input type="text" name="phone" required><br>
        <label>Password:</label> <input type="password" name="password" required><br>
        <input type="submit" value="Sign Up">
    </form>
</body>
</html>