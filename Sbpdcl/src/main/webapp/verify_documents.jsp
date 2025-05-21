<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String appId = request.getParameter("appId");
    if (appId == null || appId.trim().isEmpty()) {
        response.sendRedirect("errorPage.jsp"); // or show a message
        return;
    }

    // Constructing file names
    String idProofFile = appId + "_idProof.jpg";
    String addressFrontFile = appId + "_frontPage.jpg";
    String addressBackFile = appId + "_lastPage.jpg";
    String photoFile = appId + "_photo.jpg";
    String ownership1File = appId + "_owner1.jpg";
    String ownership2File = appId + "_owner2.jpg";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Verify Documents - Application ID: <%= appId %></title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f9f9f9; }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
        }
        h2 { color: #333; }
        .doc-list { margin-top: 20px; }
        .doc-item {
            display: flex;
            align-items: center;
            margin: 15px 0;
        }
        .doc-item input[type="checkbox"] {
            margin-right: 10px;
        }
        .doc-item label {
            flex: 1;
            font-weight: bold;
        }
        .doc-item img {
            max-height: 100px;
            margin-left: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        textarea {
            width: 100%;
            height: 100px;
            margin-top: 10px;
            padding: 10px;
            font-size: 14px;
            resize: vertical;
        }
        button {
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #28a745;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
    <script>
        function validateForm() {
            let checkboxes = document.querySelectorAll('.doc-item input[type="checkbox"]');
            let allChecked = Array.from(checkboxes).every(cb => cb.checked);
            document.getElementById("allDocsVerified").value = allChecked ? "true" : "false";
            return true;
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Document Verification - Application ID: <%= appId %></h2>

<form action="DocumentVerificationServlet" method="post" onsubmit="return validateForm();">
    <input type="hidden" name="appId" value="<%= appId %>" />

    <label>Mark Verified Documents</label>
    <div class="doc-list">
        <div class="doc-item">
            <input type="checkbox" id="doc_id_proof" name="doc_id_proof" />
            <label for="doc_id_proof">ID Proof</label>
            <img src="DownloadFileServlet?file=<%= idProofFile %>" alt="ID Proof" />
        </div>

        <div class="doc-item">
            <input type="checkbox" id="doc_address_front" name="doc_address_front" />
            <label for="doc_address_front">Address Proof (Front)</label>
            <img src="DownloadFileServlet?file=<%= addressFrontFile %>" alt="Address Proof Front" />
        </div>

        <div class="doc-item">
            <input type="checkbox" id="doc_address_back" name="doc_address_back" />
            <label for="doc_address_back">Address Proof (Back)</label>
            <img src="DownloadFileServlet?file=<%= addressBackFile %>" alt="Address Proof Back" />
        </div>

        <div class="doc-item">
            <input type="checkbox" id="doc_photo" name="doc_photo" />
            <label for="doc_photo">Applicant Photo</label>
            <img src="DownloadFileServlet?file=<%= photoFile %>" alt="Applicant Photo" />
        </div>

        <div class="doc-item">
            <input type="checkbox" id="doc_ownership1" name="doc_ownership1" />
            <label for="doc_ownership1">Ownership Proof 1</label>
            <img src="DownloadFileServlet?file=<%= ownership1File %>" alt="Ownership Proof 1" />
        </div>

        <div class="doc-item">
            <input type="checkbox" id="doc_ownership2" name="doc_ownership2" />
            <label for="doc_ownership2">Ownership Proof 2</label>
            <img src="DownloadFileServlet?file=<%= ownership2File %>" alt="Ownership Proof 2" />
        </div>
    </div>

    <label for="verification_status">Overall Verification Status</label>
    <select id="verification_status" name="verification_status" required>
        <option value="">--Select Status--</option>
        <option value="Approved">Approved</option>
        <option value="Rejected">Rejected</option>
    </select>

    <label for="jee_remarks">JEE Remarks</label>
    <textarea id="jee_remarks" name="jee_remarks" required placeholder="Enter your verification remarks here..."></textarea>

    <button type="submit">Verify and Forward to MI</button>
</form>
</div>
<script>
function validateForm() {
    // Check if status is selected
    const status = document.getElementById('verification_status').value;
    if (!status) {
        alert('Please select overall verification status.');
        return false;
    }
    
    // Remarks required
    const remarks = document.getElementById('jee_remarks').value.trim();
    if (remarks === '') {
        alert('Please enter your verification remarks.');
        return false;
    }
    
    return true;
}
</script>


</body>

</html>
