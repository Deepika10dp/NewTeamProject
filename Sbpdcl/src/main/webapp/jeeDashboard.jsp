<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>JEE Dashboard</title>
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
      padding-top: 20px;
    }
    .sidebar a {
      color: white;
      padding: 10px 20px;
      display: block;
      text-decoration: none;
    }
    .sidebar a:hover {
      background-color: #495057;
    }
    .dashboard-card {
      border-radius: 10px;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">JEE Dashboard</a>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar -->
    <div class="col-md-2 sidebar">
      <h5 class="text-center mb-4">Menu</h5>
      <a href="#">New Applications</a>
      <a href="#">Verify Site Inspection</a>
      <a href="#">Upload Reports</a>
      <a href="#">Approve for Meter Installation</a>
      <a href="#">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="col-md-10 p-4">
      <h3>Junior Electrical Engineer</h3>
      

      <div class="row mt-4">

        <!-- New Applications -->
        <div class="col-md-3 mb-3">
          <div class="card text-white bg-primary dashboard-card">
            <div class="card-body">
              <h5 class="card-title">New Applications</h5>
              <p class="card-text fs-4"><%= 25 %></p>
            </div>
          </div>
        </div>

        <!-- Site Inspections -->
        <div class="col-md-3 mb-3">
          <div class="card text-white bg-success dashboard-card">
            <div class="card-body">
              <h5 class="card-title">Verified Sites</h5>
              <p class="card-text fs-4"><%= 15 %></p>
            </div>
          </div>
        </div>

        <!-- Pending Reports -->
        <div class="col-md-3 mb-3">
          <div class="card text-white bg-warning dashboard-card">
            <div class="card-body">
              <h5 class="card-title">Pending Reports</h5>
              <p class="card-text fs-4"><%= 8 %></p>
            </div>
          </div>
        </div>

        <!-- Meter Install Approvals -->
        <div class="col-md-3 mb-3">
          <div class="card text-white bg-danger dashboard-card">
            <div class="card-body">
              <h5 class="card-title">Meter Approvals</h5>
              <p class="card-text fs-4"><%= 10 %></p>
            </div>
          </div>
        </div>

      </div>

      <!-- Quick Access Table -->
      <div class="mt-5">
        <h5>Recent Applications</h5>
        <table class="table table-striped table-bordered">
          <thead class="table-dark">
            <tr>
              <th>Application ID</th>
              <th>Applicant Name</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>APP12345</td>
              <td>Ravi Kumar</td>
              <td>Pending Inspection</td>
              <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
            </tr>
            <tr>
              <td>APP12346</td>
              <td>Neha Singh</td>
              <td>Report Pending</td>
              <td><a href="#" class="btn btn-sm btn-warning">Upload Report</a></td>
            </tr>
            <tr>
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>