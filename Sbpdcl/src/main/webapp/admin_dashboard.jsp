<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 1) {
        response.sendRedirect("unauthorized.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Dash board</title>
</head>
<body>
	  <h2>Welcome Admin: <%= user.getName() %></h2>
      <a href="LogoutServlet">Logout</a>
</body>
</html>