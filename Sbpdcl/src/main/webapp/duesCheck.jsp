<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String consumerId = request.getAttribute("consumerId") != null ? (String) request.getAttribute("consumerId") : "";
    String mobile = request.getAttribute("mobile") != null ? (String) request.getAttribute("mobile") : "";
    String status = request.getAttribute("duesStatus") != null ? (String) request.getAttribute("duesStatus") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Check Dues</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        /* Full-page blurred background image */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: url('images/3.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1;
        }

        .container {
            width: 500px;
            padding: 30px;
            border: 2px solid #007bff;
            border-radius: 15px;
            background-color: rgba(255, 255, 255, 0.85);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            z-index: 1;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        form {
            margin-top: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin-bottom: 5px;
            font-weight: normal;
            width: 100%;
            text-align: left;
        }

        input[type="text"] {
            width: 90%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"], button {
            padding: 8px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #0056b3;
        }

        .status {
            font-weight: bold;
            font-size: 16px;
            margin: 15px 0;
        }

        .not-cleared {
            color: red;
        }

        .cleared {
            color: green;
        }

        .decision-form label {
            text-align: left;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Check Dues - Consumer ID: <%= request.getParameter("consumerId") %></h2>

        <!-- Form to check dues -->
        <form action="CheckDuesServlet" method="post">
            <label>Consumer ID:</label>
            <input type="text" name="consumerId" value="<%= request.getParameter("consumerId") %>" readonly>

            <label>Phone Number:</label>
            <input type="text" name="mobile" value="<%= request.getParameter("mobile") %>" readonly>

            <input type="submit" value="Check Dues">
        </form>

        <!-- Dues status display -->
        <% if (!status.isEmpty()) { %>
            <p class="status">
                Fetched Dues Status:
                <% if ("Cleared".equalsIgnoreCase(status)) { %>
                    <span class="cleared">Cleared</span>
                <% } else { %>
                    <span class="not-cleared">Not Cleared</span>
                <% } %>
            </p>

            <!-- JEE decision form only visible after dues status is available -->
            <form class="decision-form" action="SubmitDuesDecisionServlet" method="post">
                <input type="hidden" name="consumerId" value="<%= consumerId %>">
                <input type="hidden" name="mobile" value="<%= mobile %>">

                <p><strong>JEE Decision (Select One):</strong></p>
                <label><input type="radio" name="finalDuesStatus" value="Cleared" required> Cleared</label><br>
                <label><input type="radio" name="finalDuesStatus" value="Not Cleared"> Not Cleared</label><br><br>

                <input type="submit" value="Submit Decision">
            </form>
        <% } %>
    </div>
</body>
</html>