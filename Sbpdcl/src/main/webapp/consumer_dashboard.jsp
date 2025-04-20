<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User"%>
    <%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 5) {
        response.sendRedirect("unauthorized.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Consumer Dash board</title>
</head>
<body>
	 <h2>Welcome Consumer: <%= user.getName() %></h2>
	 <a href="changePassword.jsp">Change Password</a><br>
	 <a href="form.html">New Connection</a><br>
    <a href="LogoutServlet">Logout</a><br>
</body>
</html>