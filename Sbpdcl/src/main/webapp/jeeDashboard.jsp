<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User,javax.servlet.http.HttpSession" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 1) {
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
  <title>JEE Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS and Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
    }

    .sidebar {
      height: 100vh;
      background-color: #343a40;
      color: white;
      padding-top: 20px;
    }

    .sidebar a {
      color: white;
      padding: 10px 20px;
      display: block;
      text-decoration: none;
    }

    .sidebar a:hover,
    .sidebar a.active {
      background-color: #495057;
    }

    .profile-toggle {
      position: fixed;
      top: 10px;
      right: 10px;
      background: transparent;
      border: none;
      display: flex;
      align-items: center;
      z-index: 1060;
    }

    .profile-toggle span {
      margin-right: 8px;
      color: white;
      font-weight: 500;
    }

    .profile-panel {
      position: fixed;
      top: 0;
      right: -320px;
      width: 300px;
      height: 100%;
      background-color: #343a40;
      box-shadow: -2px 0 5px rgba(0,0,0,0.1);
      transition: right 0.4s ease;
      padding: 20px;
      z-index: 1050;
      color: white;
    }

    .profile-panel.open {
      right: 0;
    }
  </style>
</head>
<body>
 <h2>Welcome JEE: <%= user.getName() %></h2>
<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Junior Electrical Engineer</a>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar Menu -->
    <div class="col-md-2 sidebar">
      <h5 class="text-center mb-4">Menu</h5>
      <a href="#" class="menu-link active" data-status="All">All Applications</a>
      <a href="#" class="menu-link" data-status="Pending Inspection">Verify Site Inspection</a>
      <a href="#" class="menu-link" data-status="Report Pending">Pending Reports</a>
      <a href="#" class="menu-link" data-status="Ready for Meter">Meter Installation</a>
      <a href="#" class="menu-link" data-status="checks dues">Check Dues</a>
      <a href="jeeDashboard.jsp?page=change_password" >Change Password</a>
      <a href="LogoutServlet">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="col-md-10 p-4">
	  <!-- Include Change Password JSP if selected -->
	  <%
	      if ("change_password".equals(pageParam)) {
	  %>
	      <jsp:include page="change_password.jsp" />
	  <%
	      }
	  %>
	 

	  
      <!-- Applications Table -->
      <div>
        <h5>Recent Applications</h5>
        <table class="table table-striped table-bordered" id="applicationsTable">
          <thead class="table-dark">
            <tr>
              <th>Application ID</th>
              <th>Applicant Name</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr data-status="Pending Inspection">
              <td>APP12345</td>
              <td>Ravi Kumar</td>
              <td>Pending Inspection</td>
              <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
            </tr>
            <tr data-status="Report Pending">
              <td>APP12346</td>
              <td>Neha Singh</td>
              <td>Report Pending</td>
              <td><a href="#" class="btn btn-sm btn-warning">Upload Report</a></td>
            </tr>
            <tr data-status="Ready for Meter">
              <td>APP12347</td>
              <td>Sunil Sharma</td>
              <td>Ready for Meter</td>
              <td><a href="#" class="btn btn-sm btn-success">Approve</a></td>
            </tr>
          </tbody>
        </table>
      </div>
	  
    </div>
  </div>
</div>

<!-- Profile Toggle Button -->
<button class="profile-toggle" onclick="toggleProfile()">
  <span id="profileName">Rahul Mehta</span>
  <i class="bi bi-person-circle" style="font-size: 1.8rem; color:white;"></i>
</button>

<!-- Profile Panel -->
<div class="profile-panel" id="profilePanel">
  <p><strong>Name:</strong> Rahul Mehta</p>
  <p><strong>Section:</strong> East Division</p>
  <p><strong>Id:</strong> </p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript -->
<script>
  function toggleProfile() {
    const panel = document.getElementById("profilePanel");
    const nameSpan = document.getElementById("profileName");

    panel.classList.toggle("open");
    nameSpan.style.display = panel.classList.contains("open") ? "none" : "inline";
  }

  // Handle menu click and filtering
  const menuLinks = document.querySelectorAll('.menu-link');
  const rows = document.querySelectorAll('#applicationsTable tbody tr');

  menuLinks.forEach(link => {
    link.addEventListener('click', function (e) {
      e.preventDefault();
      menuLinks.forEach(l => l.classList.remove('active'));
      this.classList.add('active');

      const status = this.getAttribute('data-status');
      rows.forEach(row => {
        row.style.display = (status === "All" || row.getAttribute('data-status') === status) ? '' : 'none';
      });
    });
  });
</script>

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