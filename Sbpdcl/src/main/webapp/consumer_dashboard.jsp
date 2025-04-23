<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User,javax.servlet.http.HttpSession" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 4) {
        response.sendRedirect("unauthorized.jsp");
        return;
    }

    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("user_id") == null) {
        response.sendRedirect("index.html");
        return;
    }

    String userId = (String) sess.getAttribute("user_id");
    String pageParam = request.getParameter("page");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Consumer Dash board</title>
</head>
<body>
	 <h2>Welcome Consumer: <%= user.getName() %></h2>
	 <a href="form.html">New Connection</a><br>
     <a href="consumer_dashboard.jsp?page=change_password" >Change Password</a>
     <a href="LogoutServlet">Logout</a>
     
     <!-- Include Change Password JSP if selected -->
	  <%
	      if ("change_password".equals(pageParam)) {
	  %>
	      <jsp:include page="change_password.jsp" />
	  <%
	      }
	  %>
</body>
		 <%
	    String msg = (String) request.getAttribute("msg");
	    if (msg != null) {
	   %>
	    <script>
	        alert("<%= msg.replaceAll("\"", "\\\\\"") %>");
	    </script>
	  <%
	    }
	  %>
</html>