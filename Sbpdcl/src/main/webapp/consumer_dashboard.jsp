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
<html lang="en">
	<head>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>Consumer Dashboard</title>
	
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
	
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
	      top: 0;
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
	    .navbar {
	      background-color: #343a40;
	    }
	    .navbar .navbar-brand {
	      color: white;
	    }
	    .navbar .navbar-brand:hover {
	      color: #ddd;
	    }
	    #mainContent {
	      min-height: 400px;
	    }
	  </style>
	</head>
	<body>
	
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">Consumer Dashboard</a>
		    <button class="profile-toggle" onclick="toggleProfile()">
		      <span id="profileName"><%= user.getName() %></span>
		      <i class="bi bi-person-circle ms-2" style="font-size: 1.8rem;"></i>
		    </button>
		  </div>
		</nav>
		
		<div class="container-fluid">
		  <div class="row">
		    <div class="col-md-2 sidebar">
		      <h5 class="text-center mb-4">Menu</h5>
		      <a href="form.html" class="menu-link">New Connection</a>
		      <a href="#" class="menu-link" onclick="loadTrackStatus('<%= userId %>')">Track Status</a>
		    </div>
		    <div class="col-md-10 p-4">
		      <h2>Welcome, <%= user.getName() %></h2>
		      <div id="mainContent">
		        <p>Please select an option from the menu.</p>
		      </div>
		      <div class="profile-panel" id="profilePanel">
		        <p><strong>Name:</strong> <%= user.getName() %></p>
		        <p><strong>ID:</strong> <%= userId %></p>
		        <p><a href="#" onclick="loadChangePassword(event)">Change Password</a></p>
		        <p><a href="LogoutServlet">Logout</a></p>
		        <div id="profileContent"></div>
		      </div>	
		    </div>
		  </div>
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
		    panel.classList.add("open");
		    const contentDiv = document.getElementById("profileContent");
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
		  function loadTrackStatus(userId) {
		    const contentDiv = document.getElementById("mainContent");
		    contentDiv.innerHTML = "<p>Loading application status...</p>";
		
		    fetch("TrackStatusServlet?consumerId=" + userId)
		      .then(response => {
		        if (!response.ok) throw new Error("Failed to fetch application status.");
		        return response.text();
		      })
		      .then(html => {
		        contentDiv.innerHTML = html;
		      })
		      .catch(error => {
		        contentDiv.innerHTML = "<p style='color:red;'>Error loading status.</p>";
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
	
	</body>
</html>