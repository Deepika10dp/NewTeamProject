<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consumer Signup</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Consumer Signup</h2>
    <form action="ConsumerSignupServlet" method="post">
        <label>Name:</label>
        <input type="text" name="name" required>
        
        <label>Phone Number:</label>
        <input type="text" name="phone" required pattern="[0-9]{10}">
        
        <label>Password:</label>
        <input type="password" name="password" required>
        
        <button type="submit">Sign Up</button>
    </form>
</body>
</html>