<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User,javax.servlet.http.HttpSession" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 3) {
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
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>AEE Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background-color: #f8f9fa;
    }
    .sidebar {
      height: 100vh;
      background-color: #343a40;
      color: white;
    }
    .sidebar a {
      color: white;
      padding: 15px;
      display: block;
      text-decoration: none;
    }
    .sidebar a:hover {
      background-color: #495057;
    }
    .card {
      border-radius: 10px;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1">AEE Dashboard</span>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar -->
    <div class="col-md-2 sidebar p-3">
      <h5 class="text-center">Menu</h5>
      <a href="#">Dashboard Home</a>
      <a href="#">Forwarded Applications</a>
      <a href="#">JEE Reports</a>
      <a href="#">Approve/Reject</a>
      <a href="#">Track Applications</a>
       <a href="aeeDashboard.jsp?page=change_password" >Change Password</a>
      <a href="LogoutServlet">Logout</a>
    </div>
	
	<!-- Include Change Password JSP if selected -->
	  <%
	      if ("change_password".equals(pageParam)) {
	  %>
	      <jsp:include page="change_password.jsp" />
	  <%
	      }
	  %>
    <!-- Main Content -->
    <div class="col-md-10 p-4">
      <h3>Welcome, AEE</h3>
      

      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card bg-primary text-white">
            <div class="card-body">
              <h5>Applications Received</h5>
              <h3>132</h3>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-4">
          <div class="card bg-warning text-dark">
            <div class="card-body">
              <h5>Pending Approvals</h5>
              <h3>28</h3>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-4">
          <div class="card bg-success text-white">
            <div class="card-body">
              <h5>Connections Approved</h5>
              <h3>104</h3>
            </div>
          </div>
        </div>
      </div>

      <!-- Recent Activity -->
      <div class="card mt-4">
        <div class="card-header">
          Recent Applications
        </div>
        <div class="card-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Application ID</th>
                <th>Applicant Name</th>
                <th>Status</th>
                <th>JEE Remarks</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>NSC2025001</td>
                <td>Ravi Kumar</td>
                <td>Pending</td>
                <td>Verified</td>
                <td>
                  <button class="btn btn-success btn-sm">Approve</button>
                  <button class="btn btn-danger btn-sm">Reject</button>
                </td>
              </tr>
              <tr>
                <td>NSC2025002</td>
                <td>Sneha Sharma</td>
                <td>Pending</td>
                <td>Incomplete Documents</td>
                <td>
                  <button class="btn btn-success btn-sm">Approve</button>
                  <button class="btn btn-danger btn-sm">Reject</button>
                </td>
              </tr>
              <!-- Add more rows as needed -->
            </tbody>
          </table>
        </div>
      </div>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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