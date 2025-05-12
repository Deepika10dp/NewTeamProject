<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef;
            text-align: center;
            padding-top: 100px;
        }
        .card {
            background: #fff;
            border-radius: 10px;
            display: inline-block;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        h2 {
            color: #2c3e50;
        }
        p {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Registration Successful!</h2>
        <p><strong>User ID:</strong> ${userId}</p>
        <p><strong>Password:</strong> ${password}</p>
        <p>Make sure to take a screenshot or note them down for future logins.</p>
    </div>
</body>
</html>