<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.SBPDCL.bean.NewConnectionRequest" %>
<%@ page import="com.SBPDCL.bean.LocationNameBean" %>

<%
    NewConnectionRequest formData = (NewConnectionRequest) request.getAttribute("formData");
    LocationNameBean locationNames = (LocationNameBean) request.getAttribute("locationNames");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Preview Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
        }
        .section {
            margin-bottom: 25px;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .section h3 {
            margin-top: 0;
            border-bottom: 1px solid #ccc;
            padding-bottom: 5px;
        }
        .row {
            display: flex;
            margin: 8px 0;
        }
        .label {
            width: 220px;
            font-weight: bold;
        }
        .value {
            flex: 1;
        }
        .buttons {
            margin-top: 20px;
        }
        button {
            padding: 10px 20px;
            margin-right: 10px;
            font-size: 14px;
        }
 
	    .preview-section {
	    	width: 100%;
		    max-width: 1000px;
		    margin: auto;
		    text-align: center;
		    padding: 20px;
	    }
	
	    .preview-frame {
		    width: 100%;
		    height: 600px;
		    border: 1px solid #ccc;
		    margin-bottom: 30px;
	   }
	
	    .preview-image {
		    width: auto;
		    max-width: 100%;
		    height: auto;
		    display: block;
		    margin: 0 auto 30px;
		    border: 1px solid #ccc;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	   }
	
	    h3 {
	    	margin-bottom: 15px;
	   }

    </style>
</head>
<body>

    <h2>Preview Your Application</h2>

    <form action="FinalSubmitServlet" method="post">

    <div style="display: flex; gap:20px; flex-wrap: wrap;">    
    	<!-- Personal Details -->
        <div class="section" style="flex: 1; min-width: 300px;">
            <h3>Personal Details</h3>
            <div class="row"><div class="label">Applicant Name:</div><div class="value"><%= formData.getApplicantName() %></div></div>
            <div class="row"><div class="label">Father/Husband Name:</div><div class="value"><%= formData.getF_hName() %></div></div>
            <div class="row"><div class="label">Gender:</div><div class="value"><%= formData.getGender() %></div></div>
            <div class="row"><div class="label">Mobile:</div><div class="value"><%= formData.getMobile() %></div></div>
            <div class="row"><div class="label">Email:</div><div class="value"><%= formData.getEmail() %></div></div>
        </div>

        <!-- Address Details -->
        <div class="section" style="flex: 1; min-width: 300px;">
            <h3>Address Details</h3>
            <div class="row"><div class="label">House No:</div><div class="value"><%= formData.getHouseNo() %></div></div>
            <div class="row"><div class="label">Street:</div><div class="value"><%= formData.getStreet() %></div></div>
            <div class="row"><div class="label">Address Line 1:</div><div class="value"><%= formData.getAddressLine1() %></div></div>
            <div class="row"><div class="label">Address Line 2:</div><div class="value"><%= formData.getAddressLine2() %></div></div>
            <div class="row"><div class="label">Address Line 3:</div><div class="value"><%= formData.getAddressLine3() %></div></div>
            <div class="row"><div class="label">City:</div><div class="value"><%= formData.getCity() %></div></div>
            <div class="row"><div class="label">Pincode:</div><div class="value"><%= formData.getPincode() %></div></div>
        </div>
	 </div>
	 
	  <div style="display: flex; gap:20px; flex-wrap: wrap;">  
        <!-- Location Details -->
        <div class="section" style="flex: 1; min-width: 300px;">
            <h3>Location</h3>
            <div class="row"><div class="label">District:</div><div class="value"><%= locationNames.getDistrictName() %></div></div>
            <div class="row"><div class="label">Block:</div><div class="value"><%= locationNames.getBlockName() %></div></div>
            <div class="row"><div class="label">Panchayat:</div><div class="value"><%= locationNames.getPanchayatName() %></div></div>
            <div class="row"><div class="label">Village/Ward:</div><div class="value"><%= locationNames.getVillageName() %></div></div>
            <div class="row"><div class="label">Division:</div><div class="value"><%= locationNames.getDivisionName() %></div></div>
            <div class="row"><div class="label">Subdivision:</div><div class="value"><%= locationNames.getSubDivisionName() %></div></div>
            <div class="row"><div class="label">Section:</div><div class="value"><%= locationNames.getSectionName() %></div></div>
        </div>

        <!-- Connection Details -->
        <div class="section" style="flex: 1; min-width: 300px;">
            <h3>Connection Details</h3>
            <div class="row"><div class="label">Tariff:</div><div class="value"><%= formData.getTariff() %></div></div>
            <div class="row"><div class="label">Phase:</div><div class="value"><%= formData.getPhase() %></div></div>
            <div class="row"><div class="label">Load:</div><div class="value"><%= formData.getLoad() %></div></div>
            <div class="row"><div class="label">ID Proof:</div><div class="value"><%= formData.getIdProof() %></div></div>
            <div class="row"><div class="label">Address Proof:</div><div class="value"><%= formData.getAddressProof() %></div></div>
        </div>
        
        <input type="hidden" name="app_id" value="<%= formData.getApp_id() %>"/>
        <input type="hidden" name="connectionType" value="<%= formData.getConnectionType() %>"/>
        <input type="hidden" name="consumerId" value="<%= formData.getConsumerId() %>"/>
        <input type="hidden" name="mobile" value="<%= formData.getMobile() %>"/>
        <input type="hidden" name="email" value="<%= formData.getEmail() %>"/>
        <input type="hidden" name="houseNo" value="<%= formData.getHouseNo() %>"/>
        <input type="hidden" name="street" value="<%= formData.getStreet() %>"/>
        <input type="hidden" name="addressLine1" value="<%= formData.getAddressLine1() %>"/>
        <input type="hidden" name="addressLine2" value="<%= formData.getAddressLine2() %>"/>
        <input type="hidden" name="addressLine3" value="<%= formData.getAddressLine3() %>"/>
        <input type="hidden" name="city" value="<%= formData.getCity() %>"/>
        <input type="hidden" name="pincode" value="<%= formData.getPincode() %>"/>
        <input type="hidden" name="district" value="<%= formData.getDistrict() %>"/>
        <input type="hidden" name="block" value="<%= formData.getBlock() %>"/>
        <input type="hidden" name="panchayat" value="<%= formData.getPanchayat() %>"/>
        <input type="hidden" name="village" value="<%= formData.getVillage() %>"/>
        <input type="hidden" name="division" value="<%= formData.getDivision() %>"/>
        <input type="hidden" name="subDivision" value="<%= formData.getSubDivision() %>"/>
        <input type="hidden" name="section" value="<%= formData.getSection() %>"/>
        <input type="hidden" name="tariff" value="<%= formData.getTariff() %>"/>
        <input type="hidden" name="phase" value="<%= formData.getPhase() %>"/>
        <input type="hidden" name="load" value="<%= formData.getLoad() %>"/>
        <input type="hidden" name="gender" value="<%= formData.getGender() %>"/>
        <input type="hidden" name="applicantName" value="<%= formData.getApplicantName() %>"/>
        <input type="hidden" name="f_hName" value="<%= formData.getF_hName() %>"/>
        <input type="hidden" name="idProof" value="<%= formData.getIdProof() %>"/>
        <input type="hidden" name="addressProof" value="<%= formData.getAddressProof() %>"/>
     </div>
		
<div class="preview-section">
  <h2>Uploaded Files</h2>

  <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px;">
    <div style="text-align: center; width: 140px;">
      <h4>ID Proof</h4>
      <img src="DownloadFileServlet?file=<%= formData.getIdProofFile() %>" alt="ID Proof" style="width: 120px; height: 160px; object-fit: cover; border: 1px solid #ccc;" />
    </div>

    <div style="text-align: center; width: 140px;">
      <h4>Address Proof (Front)</h4>
      <img src="DownloadFileServlet?file=<%= formData.getAddressProofFront() %>" alt="Address Proof Front" style="width: 120px; height: 160px; object-fit: cover; border: 1px solid #ccc;" />
    </div>

    <div style="text-align: center; width: 140px;">
      <h4>Address Proof (Last)</h4>
      <img src="DownloadFileServlet?file=<%= formData.getAddressProofLast() %>" alt="Address Proof Last" style="width: 120px; height: 160px; object-fit: cover; border: 1px solid #ccc;" />
    </div>

    <div style="text-align: center; width: 140px;">
      <h4>Photograph of Applicant</h4>
      <img src="DownloadFileServlet?file=<%= formData.getPhoto() %>" alt="Photograph" style="width: 100px; height: 120px; object-fit: cover; border: 1px solid #ccc;" />
    </div>

    <div style="text-align: center; width: 140px;">
      <h4>Ownership Proof (First)</h4>
      <img src="DownloadFileServlet?file=<%= formData.getOwnershipFirst() %>" alt="Ownership First" style="width: 120px; height: 160px; object-fit: cover; border: 1px solid #ccc;" />
    </div>

    <div style="text-align: center; width: 140px;">
      <h4>Ownership Proof (Second)</h4>
      <img src="DownloadFileServlet?file=<%= formData.getOwnershipSecond() %>" alt="Ownership Second" style="width: 120px; height: 160px; object-fit: cover; border: 1px solid #ccc;" />
    </div>
  </div>
</div>
	
    <div class="buttons" style="display: flex; gap: 15px; justify-content: center; margin-top: 30px;">
        <a href="form.html" style="
            background-color: #28a745;
            color: white;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            line-height: 38px;
        ">Back to Edit</a>
        <button type="submit" style="
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        ">Final Submit</button>
    </div>
</form>    
</body>
</html>