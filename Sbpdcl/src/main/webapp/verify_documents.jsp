<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.SBPDCL.bean.NewConnectionRequest" %>
<%
    String appId = request.getParameter("appId");
    if (appId == null || appId.trim().isEmpty()) {
        response.sendRedirect("errorPage.jsp");
        return;
    }

    // File names
    String idProofFile = appId + "_idProof.jpg";
    String addressFrontFile = appId + "_frontPage.jpg";
    String addressBackFile = appId + "_lastPage.jpg";
    String photoFile = appId + "_photo.jpg";
    String ownership1File = appId + "_owner1.jpg";
    String ownership2File = appId + "_owner2.jpg";
%>
<%
    NewConnectionRequest details = (NewConnectionRequest) request.getAttribute("details");
    if (details == null) {
%>
    <p style="color:red;">No application details found. Please go back and try again.</p>
<%
    } else {
%>
<%
    com.SBPDCL.bean.LocationNameBean location = (com.SBPDCL.bean.LocationNameBean) request.getAttribute("locationNames");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify Documents - Application ID: <%= appId %></title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 20px; }
        .container { max-width: 900px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { color: #333; }
        .doc-list { margin-top: 20px; }
        .doc-item {
            display: flex;
            align-items: center;
            margin: 15px 0;
        }
        .doc-item input[type="checkbox"] { margin-right: 10px; }
        .doc-item label { flex: 1; font-weight: bold; }
        .doc-item img {
            max-height: 100px;
            margin-left: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        select, textarea {
		    width: 100%;
		    max-width: 500px;
		    padding: 10px;
		    font-size: 16px;
		    margin-top: 5px;
		    margin-bottom: 20px;
		    border: 1px solid #ccc;
		    border-radius: 8px;
		    box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
		    transition: border-color 0.3s, box-shadow 0.3s;
		}
		
		select:focus, textarea:focus {
		    outline: none;
		    border-color: #4CAF50;
		    box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
		}
		
		label {
		    font-weight: bold;
		    display: block;
		    margin-bottom: 6px;
		}
		
		.form-group {
		    margin-bottom: 20px;
		}
		
		.submit-button {
		    background-color: #4CAF50;
		    color: white;
		    font-size: 16px;
		    padding: 12px 24px;
		    border: none;
		    border-radius: 8px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}
		
		.submit-button:hover {
		    background-color: #45a049;
		}
        table td { vertical-align: top; }
		.doc-image {
		    width: 150px;
		    cursor: pointer;
		    border: 1px solid #ccc;
		    margin: 10px 0;
	    }
		
		  /* Modal overlay */
	    #imgModal {
		    display: none;
		    position: fixed;
		    z-index: 1000;
		    top: 0; left: 0;
		    width: 100vw;
		    height: 100vh;
		    background-color: rgba(0,0,0,0.8);
		
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		#imgModal img {
		    max-width: 90vw;
		    max-height: 90vh;
		    border-radius: 8px;
		    box-shadow: 0 0 20px #000;
		}
		
		#imgModal .close-btn {
		    position: absolute;
		    top: 20px;
		    right: 30px;
		    font-size: 40px;
		    color: white;
		    cursor: pointer;
		    font-weight: bold;
		}
    </style>
</head>
<body>
<div class="container">
    <h2>Document Verification - Application ID: <%= appId %></h2>

    <form action="DocumentVerificationServlet" method="post" onsubmit="return validateForm();">
        <input type="hidden" name="appId" value="<%= appId %>" />
        <input type="hidden" id="allDocsVerified" name="allDocsVerified" value="false" />

        <fieldset style="background-color: #e9f7ef; padding: 15px; border: 1px solid #b2dfdb;">
            <legend><strong>Application Details</strong></legend>
            <table border="0" cellpadding="8">
                <tr><td><strong>Applicant Name:</strong></td><td><%= details.getApplicantName() %></td></tr>
                <tr><td><strong>Father/Husband Name:</strong></td><td><%= details.getF_hName() %></td></tr>
                <tr><td><strong>Mobile:</strong></td><td><%= details.getMobile() %></td></tr>
                <tr><td><strong>Email:</strong></td><td><%= details.getEmail() %></td></tr>
                <tr><td><strong>Connection Type:</strong></td><td><%= details.getConnectionType() %></td></tr>
                <tr><td><strong>Gender:</strong></td><td><%= details.getGender() %></td></tr>
                <tr><td><strong>Tariff:</strong></td><td><%= details.getTariff() %></td></tr>
                <tr><td><strong>Phase:</strong></td><td><%= details.getPhase() %></td></tr>
                <tr><td><strong>Load:</strong></td><td><%= details.getLoad() %></td></tr>
                <tr><td><strong>Address:</strong></td>
                    <td>
                        <%= details.getHouseNo() %>, <%= details.getStreet() %>,
                        <%= details.getAddressLine1() %>, <%= details.getAddressLine2() %>,
                        <%= details.getAddressLine3() %>, <%= details.getCity() %> - <%= details.getPincode() %>
                    </td>
                </tr>
                <tr><td><strong>Location:</strong></td>
                    <td>
                        
							District: <%= location.getDistrictName() %><br>
							Block: <%= location.getBlockName() %><br>
							Panchayat: <%= location.getPanchayatName() %><br>
							Village: <%= location.getVillageName() %><br>
							Division: <%= location.getDivisionName() %><br>
							SubDivision: <%= location.getSubDivisionName() %><br>
							Section: <%= location.getSectionName() %><br>
                    </td>
                </tr>
            </table>
        </fieldset>

        <label><strong>Mark Verified Documents</strong></label>
        <div class="doc-list">
            <div class="doc-item">
                <input type="checkbox" id="doc_id_proof" name="doc_id_proof" />
                <label for="doc_id_proof">ID Proof</label>
                <img src="DownloadFileServlet?file=<%= idProofFile %>" alt="ID Proof" class="doc-image" onclick="openModal(this.src)"/>
            </div>
            <div class="doc-item">
                <input type="checkbox" id="doc_address_front" name="doc_address_front" />
                <label for="doc_address_front">Address Proof (Front)</label>
                <img src="DownloadFileServlet?file=<%= addressFrontFile %>" alt="Address Front" class="doc-image" onclick="openModal(this.src)"/>
            </div>
            <div class="doc-item">
                <input type="checkbox" id="doc_address_back" name="doc_address_back" />
                <label for="doc_address_back">Address Proof (Back)</label>
                <img src="DownloadFileServlet?file=<%= addressBackFile %>" alt="Address Back" class="doc-image" onclick="openModal(this.src)"/>
            </div>
            <div class="doc-item">
                <input type="checkbox" id="doc_photo" name="doc_photo" />
                <label for="doc_photo">Applicant Photo</label>
                <img src="DownloadFileServlet?file=<%= photoFile %>" alt="Applicant Photo" class="doc-image" onclick="openModal(this.src)"/>
            </div>
            <div class="doc-item">
                <input type="checkbox" id="doc_ownership1" name="doc_ownership1" />
                <label for="doc_ownership1">Ownership Proof 1</label>
                <img src="DownloadFileServlet?file=<%= ownership1File %>" alt="Ownership 1" class="doc-image" onclick="openModal(this.src)"/>
            </div>
            <div class="doc-item">
                <input type="checkbox" id="doc_ownership2" name="doc_ownership2" />
                <label for="doc_ownership2">Ownership Proof 2</label>
                <img src="DownloadFileServlet?file=<%= ownership2File %>" alt="Ownership 2" class="doc-image" onclick="openModal(this.src)"/>
            </div>
        </div>
		<div class="form-group">
	        <label for="verification_status"><strong>Verification Status</strong></label>
	        <select id="verification_status" name="verification_status" required>
	            <option value="">--Select Status--</option>
	            <option value="Approved">Approved</option>
	            <option value="Rejected">Rejected</option>
	        </select>
		</div>
		<div class="form-group">
	        <label for="jee_remarks"><strong>JEE Remarks</strong></label>
	        <textarea id="jee_remarks" name="jee_remarks" required placeholder="Enter your verification remarks..."></textarea>
		</div>
        <button type="submit" class="submit-button">Verify and Forward to MI</button>
    </form>
</div>
<!-- Modal for showing large image -->
<div id="imgModal" onclick="closeModal(event)">
  <span class="close-btn" onclick="closeModal(event)">&times;</span>
  <img id="modalImg" src="" alt="Enlarged Document" />
</div>

<script>
  function openModal(src) {
    document.getElementById('modalImg').src = src;
    document.getElementById('imgModal').style.display = 'flex';
  }

  function closeModal(event) {
    // Prevent closing if clicked on image itself
    if (event.target.id === 'modalImg') return;
    document.getElementById('imgModal').style.display = 'none';
  }
</script>
<script>
    function validateForm() {
        const status = document.getElementById('verification_status').value;
        const remarks = document.getElementById('jee_remarks').value.trim();
        const checkboxes = document.querySelectorAll('.doc-item input[type="checkbox"]');
        const allChecked = Array.from(checkboxes).every(cb => cb.checked);

        document.getElementById("allDocsVerified").value = allChecked ? "true" : "false";

        if (!status) {
            alert('Please select overall verification status.');
            return false;
        }

        if (remarks === '') {
            alert('Please enter your verification remarks.');
            return false;
        }

        return true;
    }
</script>
</body>
</html>
<% } %>
