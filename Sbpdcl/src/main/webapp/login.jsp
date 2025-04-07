<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="bg-secondary p-4 rounded shadow" style="max-width: 400px; width: 100%;">
            <h2 class="text-center mb-4">Login</h2>
            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label for="user_id" class="form-label">User Id:</label>
                    <input type="text" class="form-control bg-light text-dark" id="user_id" name="user_id" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control bg-light text-dark" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-danger w-100">Login</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>