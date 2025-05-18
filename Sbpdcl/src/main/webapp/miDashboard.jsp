<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User,javax.servlet.http.HttpSession" %>
<%@page import="java.util.List"%>
<%@page import="com.SBPDCL.bean.NewConnectionRequest"%>
<%@page import="com.SBPDCL.services.NewConnectionService"%>
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
<%
    String sectionId = (String) session.getAttribute("section_id");
    NewConnectionService service = new NewConnectionService();
    List<NewConnectionRequest> requests = service.getApplicationsForMI(sectionId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Meter Installer Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
      background: transparent;
      border: none;
      display: flex;
      align-items: center;
      color: white;
      position: fixed;
      top: 10px;
      right: 10px;
      z-index: 1060;
    }

    .profile-panel {
      position: fixed;
      top: 0; /* height of navbar */
      right: -320px;
      width: 300px;
      height: 100%;
      background-color: #343a40;
      box-shadow: -2px 0 5px rgba(0,0,0,0.1);
      transition: right 0.4s ease;
      padding: 80px 20px 20px 20px;
      z-index: 1050;
      color: white;
      overflow-y: auto;
    }

    .profile-panel.open {
      right: 0;
    }

    .profile-panel a {
      color: #fff;
      text-decoration: underline;
      cursor: pointer;
    }

   
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1">Meter Installer Dashboard</span>
    <button class="profile-toggle" onclick="toggleProfile()">
      <span id="profileName"><%= user.getName() %></span>
      <i class="bi bi-person-circle ms-2" style="font-size: 1.8rem;"></i>
    </button>
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
      
    </div>

    <!-- Main Content -->
    <div class="col-md-10 p-4">

      <!-- Assigned Installations Table -->
      <div class="card mt-4">
        
        <div class="card-body">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Application ID</th>
                <th>Customer Name</th>
                <th>Status</th>
                <th>Remarks</th>
                <th>Update</th>
              </tr>
            </thead>
            <tbody>
			      <%
			        for (NewConnectionRequest req : requests) {
			      %>
			      <form action="MIInspectionServlet" method="post">
			        <tr data-status="<%= req.getStatus() %>">
			          <td><%= req.getApp_id() %></td>
			          <td><%= req.getApplicantName()%></td>
			          <td><%= req.getStatus() %></td>
			          <td><input type="text" name="miRemarks" class="form-control" required></td>
			          <td>
			            <input type="hidden" name="appId" value="<%= req.getApp_id() %>">
			            <button type="submit" class="btn btn-sm btn-primary">Verify & Forward to AEE</button>
			          </td>
			        </tr>
			      </form>
			      <%
			        }
			      %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Profile Panel -->
<div class="profile-panel" id="profilePanel">
  <p><strong>Name:</strong> <%= user.getName() %></p>
  <p><strong>Role:</strong> Meter Installer</p>
  <p><strong>ID:</strong> <%= userId %></p>
  <p><a href="#" onclick="openChangePasswordModal(event)">Change Password</a></p>
  <p><a href="LogoutServlet">Logout</a></p>

  <div id="profileContent"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function toggleProfile() {
    const panel = document.getElementById("profilePanel");
    panel.classList.toggle("open");
  }

  function loadChangePassword(event) {
    event.preventDefault();

    const panel = document.getElementById("profilePanel");
    panel.classList.add("open"); // Keep panel open

    const contentDiv = document.getElementById("profileContent");

    // Load JSP via AJAX
    fetch("change_password.jsp")
      .then(response => {
        if (!response.ok) throw new Error("Failed to load change password");
        return response.text();
      })
      .then(html => {
        contentDiv.innerHTML = html;
      })
      .catch(err => {
        contentDiv.innerHTML = "<p style='color:red;'>Error loading content.</p>";
        console.error(err);
      });
  }
  
  function openChangePasswordModal(event) {
	  event.preventDefault();

	  const modalBody = document.getElementById("changePasswordContent");
	  modalBody.innerHTML = "<p>Loading...</p>";

	  fetch("change_password.jsp")
	    .then(response => {
	      if (!response.ok) throw new Error("Error loading page.");
	      return response.text();
	    })
	    .then(html => {
	      modalBody.innerHTML = html;
	      const modal = new bootstrap.Modal(document.getElementById('changePasswordModal'));
	      modal.show();
	    })
	    .catch(error => {
	      modalBody.innerHTML = "<p class='text-danger'>Failed to load the form.</p>";
	      console.error(error);
	    });
	}
</script>

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

<!-- Change Password Modal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content bg-light">
      <div class="modal-header">
        <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="changePasswordContent">
        <p>Loading...</p>
      </div>
    </div>
  </div>
</div>
</body>
</html>