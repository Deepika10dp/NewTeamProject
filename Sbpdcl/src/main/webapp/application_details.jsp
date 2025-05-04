<%@ page import="com.SBPDCL.bean.NewConnectionRequest" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2>Application Details</h2>
            </div>
            <div class="card-body">
                <%
                    // Fetch the single application data from the request attribute
                    NewConnectionRequest app = (NewConnectionRequest) request.getAttribute("appData");

                    if (app != null) {
                        // Format the submission date to the desired format
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                        String formattedDate = sdf.format(app.getSubmissionDate());
                %>
                        <p><strong>Application ID:</strong> <%= app.getApp_id() %></p>
                        <p><strong>Date:</strong> <%= formattedDate %></p>
                        <p><strong>Status:</strong> <%= app.getStatus() %></p>
                <%
                    } else {
                        // If no application data is found, display an error message
                %>
                        <p>No application data available.</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
