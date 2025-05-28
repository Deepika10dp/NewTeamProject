
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String consumerId = request.getAttribute("consumerId") != null ? (String) request.getAttribute("consumerId") : "";
    String mobile = request.getAttribute("mobile") != null ? (String) request.getAttribute("mobile") : "";
    String status = request.getAttribute("duesStatus") != null ? (String) request.getAttribute("duesStatus") : "";
    String appId = request.getParameter("appId") != null ? request.getParameter("appId") : "";

%>

<html>
<head>
    <title>Check Dues</title>
    <style>
        .container {
            width: 500px;
            margin: auto;
            padding: 20px;
            border: 2px solid #007bff;
            border-radius: 10px;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .status {
            font-weight: bold;
            font-size: 16px;
            margin: 10px 0;
        }
        .not-cleared {
            color: red;
        }
        .cleared {
            color: green;
        }
        input[type="submit"], button {
            padding: 8px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        input[type="submit"]:hover, button:hover {
            background-color: #0056b3;
        }
        label {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Check Dues - Consumer ID: <%= request.getParameter("consumerId") %></h2>

        <!-- Form to check dues -->
        <form action="CheckDuesServlet" method="post">
            <label>Consumer ID:</label><br>
            <input type="text" name="consumerId" value="<%= request.getParameter("consumerId") %>" readonly><br><br>
        
            <label>Phone Number:</label><br>
            <input type="text" name="mobile" value="<%= request.getParameter("mobile") %>" readonly><br><br>
        	 <input type="hidden" name="appId" value="<%= appId %>">
            <input type="submit" value=" Check Dues">
        </form>

        <!-- Dues status display -->
        <% if (!status.isEmpty()) { %>
            <p class="status">
                Fetched Dues Status:
                <% if ("Cleared".equalsIgnoreCase(status)) { %>
                    <span class="cleared"> Cleared</span>
                <% } else { %>
                    <span class="not-cleared"> Not Cleared</span>
                <% } %>
            </p>

            <!-- JEE decision form only visible after dues status is available -->
            <form action="SubmitDuesDecisionServlet" method="post">
			    <input type="hidden" name="appId" value="<%= appId %>">
			
			    <p><strong>JEE Decision (Select One):</strong></p>
			    <label><input type="radio" name="finalDuesStatus" value="Cleared" required> Cleared</label><br>
			    <label><input type="radio" name="finalDuesStatus" value="Not Cleared"> Not Cleared</label><br><br>
			
			    <input type="submit" value="Submit Decision">
			</form>

        <% } %>
    </div>
</body>
</html>
