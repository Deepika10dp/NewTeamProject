<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User,javax.servlet.http.HttpSession" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 2) {
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
  <title>Meter Installer Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
    <span class="navbar-brand mb-0 h1">Meter Installer Dashboard</span>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar -->
    <div class="col-md-2 sidebar p-3">
      <h5 class="text-center">Menu</h5>
      <a href="#">Dashboard Home</a>
      <a href="#">Assigned Installations</a>
      <a href="#">Update Meter Status</a>
      <a href="#">Schedule Installation</a>
      <a href="miDashboard.jsp?page=change_password" >Change Password</a>
     <a href="LogoutServlet">Logout</a>
    </div>
    
     <%
	      if ("change_password".equals(pageParam)) {
	  %>
	      <jsp:include page="change_password.jsp" />
	  <%
	      }
	  %>

    <!-- Main Content -->
    <div class="col-md-10 p-4">
      <h3>Welcome, Meter Installer</h3>
      <p class="text-muted">Track and manage your assigned installations.</p>

      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card bg-primary text-white">
            <div class="card-body">
              <h5>Total Assigned</h5>
              <h3>18</h3>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-4">
          <div class="card bg-success text-white">
            <div class="card-body">
              <h5>Completed</h5>
              <h3>12</h3>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-4">
          <div class="card bg-warning text-dark">
            <div class="card-body">
              <h5>Pending</h5>
              <h3>6</h3>
            </div>
          </div>
        </div>
      </div>

      <!-- Assigned Installations Table -->
      <div class="card mt-4">
        <div class="card-header">
          Assigned Installations
        </div>
        <div class="card-body">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Application ID</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>Meter No.</th>
                <th>Status</th>
                <th>Update</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>NSC2025011</td>
                <td>Rajesh Singh</td>
                <td>Patna, Bihar</td>
                <td><input type="text" class="form-control" placeholder="Enter meter no."></td>
                <td>
                  <select class="form-select">
                    <option>Pending</option>
                    <option>Installed</option>
                  </select>
                </td>
                <td><button class="btn btn-primary btn-sm">Submit</button></td>
              </tr>
              <tr>
                <td>NSC2025012</td>
                <td>Anita Verma</td>
                <td>Gaya, Bihar</td>
                <td><input type="text" class="form-control" value="MTR8930"></td>
                <td>
                  <select class="form-select">
                    <option>Installed</option>
                    <option>Pending</option>
                  </select>
                </td>
                <td><button class="btn btn-primary btn-sm">Submit</button></td>
              </tr>
              <!-- More rows as needed -->
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