<%@ page import="com.SBPDCL.bean.NewConnectionRequest" %>
<%
    com.SBPDCL.bean.LocationNameBean location = (com.SBPDCL.bean.LocationNameBean) request.getAttribute("locationNames");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Application Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-5">
        <div class="card shadow-lg">
            <div class="card-header bg-primary text-white text-center">
                <h3>Application Details</h3>
            </div>
            <div class="card-body">
                <%
                    NewConnectionRequest app = (NewConnectionRequest) request.getAttribute("appData");
                    if (app != null) {
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                        String formattedDate = sdf.format(app.getSubmissionDate());
                %>
                <div class="row mb-3">
                    <div class="col-md-6"><strong>Application ID:</strong> <%= app.getApp_id() %></div>
                    <div class="col-md-6"><strong>Consumer ID:</strong> <%= app.getConsumerId() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4"><strong>Connection Type:</strong> <%= app.getConnectionType() %></div>
                    <div class="col-md-4"><strong>Mobile:</strong> <%= app.getMobile() %></div>
                    <div class="col-md-4"><strong>Email:</strong> <%= app.getEmail() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4"><strong>House No:</strong> <%= app.getHouseNo() %></div>
                    <div class="col-md-4"><strong>Street:</strong> <%= app.getStreet() %></div>
                    <div class="col-md-4"><strong>City:</strong> <%= app.getCity() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4"><strong>Address Line 1:</strong> <%= app.getAddressLine1() %></div>
                    <div class="col-md-4"><strong>Address Line 2:</strong> <%= app.getAddressLine2() %></div>
                    <div class="col-md-4"><strong>Address Line 3:</strong> <%= app.getAddressLine3() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4"><strong>Pincode:</strong> <%= app.getPincode() %></div>
                    <div class="col-md-4"><strong>District:</strong> <%= location.getDistrictName() %></div>
                    <div class="col-md-4"><strong>Block:</strong> <%= location.getBlockName() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4"><strong>Panchayat:</strong> <%= location.getPanchayatName() %></div>
                    <div class="col-md-4"><strong>Village:</strong> <%= location.getVillageName() %></div>
                    <div class="col-md-4"><strong>Division:</strong> <%= location.getDivisionName() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6"><strong>Sub Division:</strong> <%= location.getSubDivisionName() %></div>
                    <div class="col-md-6"><strong>Section:</strong> <%= location.getSectionName() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4"><strong>Tariff:</strong> <%= app.getTariff() %></div>
                    <div class="col-md-4"><strong>Electric Phase:</strong> <%= app.getPhase() %></div>
                    <div class="col-md-4"><strong>Electric Load:</strong> <%= app.getLoad() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6"><strong>Gender:</strong> <%= app.getGender() %></div>
                    <div class="col-md-6"><strong>Applicant Name:</strong> <%= app.getApplicantName() %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6"><strong>Father/Husband Name:</strong> <%= app.getF_hName() %></div>
                    <div class="col-md-6"><strong>Submission Date:</strong> <%= formattedDate %></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12"><strong>Status:</strong> <%= app.getStatus() %></div>
                </div>

                <% } else { %>
                    <div class="alert alert-danger text-center">No application data available.</div>
                <% } %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
