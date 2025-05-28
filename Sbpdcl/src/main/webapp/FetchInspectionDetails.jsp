<%@ page import="com.SBPDCL.bean.Meter" %>
<%
    Meter meter = (Meter) request.getAttribute("meter");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Inspection Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Full-page blurred background */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('images/3.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1;
        }

        body, html {
            height: 100%;
            margin: 0;
        }

        /* Center the content vertically and horizontally */
        .center-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px;
        }

        /* Styled card */
        .card {
            background-color: rgba(255, 255, 255, 0.95);
        }
    </style>
</head>
<body>
<div class="container center-container">
    <div class="row justify-content-center w-100">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow rounded-4">
                <div class="card-body">
                    <h3 class="text-center mb-4">Inspection Details</h3>

                    <% if (error != null) { %>
                        <div class="alert alert-danger"><%= error %></div>
                    <% } else if (meter != null) { %>
                        <table class="table table-bordered">
                            <tr><th>Meter ID</th><td><%= meter.getMeter_id() %></td></tr>
                            <tr><th>Application ID</th><td><%= meter.getApp_id() %></td></tr>
                            <tr><th>Inspector Name</th><td><%= meter.getInspector_name() %></td></tr>
                            <tr><th>Inspection Date</th><td><%= meter.getInspection_date() %></td></tr>
                            <tr><th>Address</th><td><%= meter.getAddress() %></td></tr>
                            <tr><th>Site Status</th><td><%= meter.getSite_status() %></td></tr>
                            <tr><th>Confirmation Status</th><td><%= meter.getConfirmation_status() %></td></tr>
                        </table>
                    <% } else { %>
                        <div class="alert alert-warning text-center">No inspection details found.</div>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>