<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.SBPDCL.bean.User,javax.servlet.http.HttpSession" %>
<%@page import="java.util.List"%>
<%@page import="com.SBPDCL.bean.NewConnectionRequest"%>
<%@ page import="com.SBPDCL.services.LocationService" %> 
<%@page import="com.SBPDCL.services.NewConnectionService"%>

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

    String sectionId = (String) session.getAttribute("section_id");
    NewConnectionService service = new NewConnectionService();
    List<NewConnectionRequest> requests = service.getApplicationsForJEE(sectionId);
    
    LocationService locationService = new LocationService();
    String sectionName = locationService.getSectionNameById(sectionId);
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
      z-index: 1000;
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
      z-index: 2100;
    }

    .profile-panel {
	  position: fixed;
	  top: 0;
	  right: -320px;
	  width: 300px;
	  height: 100%;
	  background-color: rgba(52, 58, 64, 0.9); /* semi-transparent fallback */
	  box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
	  transition: right 0.4s ease;
	  padding: 80px 20px 20px 20px;
	  z-index: 2000;
	  color: white;
	  overflow-y: auto;
	  backdrop-filter: blur(6px); /* optional for extra blur on panel contents */
	  position: fixed;
	  overflow: hidden;
	}
	
	/* Add this new ::before style for background blur image */
	.profile-panel::before {
	  content: "";
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-image: url('images/5.jpg'); /* your image path */
	  background-size: cover;
	  background-position: center;
	  filter: blur(8px);
	  opacity: 0.6;
	  z-index: -1;
	  pointer-events: none;
	}
    .profile-panel.open {
      right: 0;
    }

    .profile-panel a {
      color: #fff;
      text-decoration: underline;
      cursor: pointer;
    }
    /* Enable stacking context */
	.sidebar,
	.navbar {
	  position: relative;
	  z-index: 1;
	  overflow: hidden;
	}
	
	/* Sidebar background blur */
	.sidebar::before {
	  content: "";
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-image: url('images/5.jpg'); /* Update with actual path */
	  background-size: cover;
	  background-position: center;
	  filter: blur(8px);
	  z-index: -1;
	  opacity: 0.6;
	  pointer-events: none;
	}
	.navbar{
		z-index: 2001;
	}
	
  </style>
</head>
<body>
<!-- Profile Panel -->
<div class="profile-panel" id="profilePanel">
  <p><strong>Name:</strong> <%= user.getName() %></p>
  <p><strong>Section:</strong> <%= sectionName %></p>
  <p><strong>ID:</strong> <%= userId %></p>
  <p><a href="#" onclick="openChangePasswordModal(event)">Change Password</a></p>
  <p><a href="LogoutServlet">Logout</a></p>

  <div id="profileContent"></div>
</div>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Junior Electrical Engineer</a>
    <button class="profile-toggle" onclick="toggleProfile()">
      <span id="profileName"><%= user.getName() %></span>
      <i class="bi bi-person-circle ms-2" style="font-size: 1.8rem;"></i>
    </button>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar Menu -->
    <div class="col-md-2 sidebar">
	  <h5 class="text-center mb-4">Menu</h5>
	  <a href="#" class="menu-link active" data-filter="all">All Applications</a>
	  <a href="#" class="menu-link" data-filter="forwarded">Forwarded Applications</a>
	  <a href="#" class="menu-link" data-filter="pending-dues">Pending Dues</a>
	  <a href="#" class="menu-link" data-filter="pending-docs">Pending Document Verification</a>
	  <a href="#" class="menu-link" data-filter="rejected">Rejected Applications</a>
	</div>


    <!-- Main Content -->
    <div class="col-md-10 p-4">
      

      <!-- Applications Table -->
      <div>
        <h5>Total Applications = <span id="totalApplications"><%= requests.size() %></span></h5>
        <table class="table table-striped table-bordered" id="applicationsTable">
          <thead class="table-dark">
            <tr style="text-align: center;">
              	<th>Application ID</th>
		        <th>Applicant Name</th>
		        <th>Mobile No</th>
		        <th>Dues Cleared</th>
		        <th>Documents Verified</th>
		        <th>Actions</th>
            </tr>
          </thead>
         <tbody>
				<%
				    for (NewConnectionRequest r : requests) {
				        // Get raw status strings from DB (expected values: Cleared, Approved, Pending, etc.)
				        String duesClearedRaw = r.getDues_cleared();
				        String docsVerifiedRaw = r.getDocuments_verified();
				
				        // Handle possible null or empty values safely
				        String duesCleared = (duesClearedRaw == null || duesClearedRaw.trim().isEmpty()) ? "Pending" : duesClearedRaw.trim();
				        String docsVerified = (docsVerifiedRaw == null || docsVerifiedRaw.trim().isEmpty()) ? "Pending" : docsVerifiedRaw.trim();
				
				        // Normalize to lowercase for CSS class and comparison
				        String duesClearedLower = duesCleared.toLowerCase();
				        String docsVerifiedLower = docsVerified.toLowerCase();
				
				        // For badge colors and action logic, compare ignoring case
				        boolean isDuesCleared = "cleared".equalsIgnoreCase(duesCleared);
				        boolean isDocsApproved = "approved".equalsIgnoreCase(docsVerified);
				
				        // Capitalize first letter, rest lowercase for display
				        String duesClearedFormatted = duesCleared.substring(0, 1).toUpperCase() + duesCleared.substring(1).toLowerCase();
				        String docsVerifiedFormatted = docsVerified.substring(0, 1).toUpperCase() + docsVerified.substring(1).toLowerCase();
				%>
				    <tr 
				        data-dues="<%= duesClearedLower %>" 
				        data-docs="<%= docsVerifiedLower %>" 
				        data-status="<%= 
							    "approved".equalsIgnoreCase(docsVerified) ? "forwarded" : 
							    "rejected".equalsIgnoreCase(docsVerified) ? "rejected" : 
							    "pending" %>">
				        
				        <td><%= r.getApp_id() %></td>
				        <td><%= r.getApplicantName() %></td>
				        <td><%= r.getMobile() %></td>
				
				        <!-- Dues Cleared Badge -->
				        <td>
				            <span class="badge 
				                <%= "cleared".equalsIgnoreCase(duesCleared) ? "bg-success" : 
				                     "not cleared".equalsIgnoreCase(duesCleared) ? "bg-danger" : "bg-warning text-dark" %>">
				                <%= duesClearedFormatted %>
				            </span>
				        </td>
				
				        <!-- Documents Verified Badge -->
				        <td>
				            <span class="badge 
				                <%= "approved".equalsIgnoreCase(docsVerified) ? "bg-success" : 
				                     "rejected".equalsIgnoreCase(docsVerified) ? "bg-danger" : "bg-warning text-dark" %>">
				                <%= docsVerifiedFormatted %>
				            </span>
				        </td>
				
				        <!-- Action Buttons -->
				        <td>
				           <% if ("approved".equalsIgnoreCase(docsVerified)) { %>
						    	<span class="badge bg-success">Forwarded</span>
						   <% } else if ("rejected".equalsIgnoreCase(docsVerified)) { %>
						    	<span class="badge bg-danger">Rejected</span>
						   <% } else { %>
				                <form action="duesCheck.jsp" method="get" style="display:inline-block; margin-right:5px;">
								    <input type="hidden" name="consumerId" value="<%= r.getConsumerId() %>" />
								    <input type="hidden" name="mobile" value="<%= r.getMobile() %>" />
								    <input type="hidden" name="appId" value="<%= r.getApp_id() %>" /> <!-- Add this -->
								    <button type="submit" class="btn btn-sm btn-primary">Check Dues</button>
								</form>

				
				                <form action="DocumentVerificationServlet" method="get" style="display:inline-block;">
				                    <input type="hidden" name="appId" value="<%= r.getApp_id() %>" />
				                    <button type="submit" class="btn btn-sm btn-success" <%= isDuesCleared ? "" : "disabled" %>>
				                        Verify Docs
				                    </button>
				                </form>
				            <% } %>
				        </td>
				    </tr>
				<% } %>
			</tbody>



        </table>
      </div>
    </div>
  </div>
</div>



<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function toggleProfile() {
    const panel = document.getElementById("profilePanel");
    panel.classList.toggle("open");
  }

 
  // Handle menu click and filtering
  const menuLinks = document.querySelectorAll('.menu-link');
  const rows = document.querySelectorAll('#applicationsTable tbody tr');
  const totalSpan = document.getElementById('totalApplications');

  menuLinks.forEach(link => {
	  link.addEventListener('click', function (e) {
	    e.preventDefault();

	    // Remove 'active' from all, add to clicked
	    menuLinks.forEach(l => l.classList.remove('active'));
	    this.classList.add('active');

	    const filter = this.getAttribute('data-filter');
	    let count = 0;

	    rows.forEach(row => {
	      const status = row.getAttribute('data-status'); // forwarded/rejected/pending
	      const dues = row.getAttribute('data-dues');     // cleared/pending
	      const docs = row.getAttribute('data-docs');     // approved/rejected/pending

	      let show = false;

	      if (filter === 'all') {
	        show = true;
	      } else if (filter === 'forwarded') {
	        show = (status === 'forwarded');
	      } else if (filter === 'rejected') {
	        show = (status === 'rejected');
	      } else if (filter === 'pending-dues') {
	        show = (dues !== 'cleared');
	      } else if (filter === 'pending-docs') {
	        show = (docs === 'pending');
	      }

	      row.style.display = show ? '' : 'none';
	      if (show) count++;
	    });

	    totalSpan.textContent = count;
	  });
	});

  
 
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
    alert("<%= msg %>");
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