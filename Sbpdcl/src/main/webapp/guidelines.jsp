<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guidelines - SBPDCL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        .guidelines {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .guideline-box {
            width: 48%;
            background: #f8f9fa;
            padding: 15px;
            margin: 10px 0;
            border-left: 5px solid #007bff;
            border-radius: 5px;
            transition: transform 0.3s;
        }
        .guideline-box:hover {
            transform: scale(1.02);
        }
        h3 {
            color: #343a40;
        }
        ul {
            padding-left: 20px;
        }
        li {
            line-height: 1.6;
        }
        .conclusion {
            text-align: center;
            font-size: 1.2em;
            font-weight: bold;
            color: #28a745;
            margin-top: 20px;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .guideline-box {
                width: 100%;
            }
        }
        table {
            width: 60%;
            border-collapse: collapse;
            margin: 30px auto;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            width: 40%;
        }
        caption {
            caption-side: top;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
    </style>
</head>
<body>

<div class="container">
    <h1>User Guidelines: New Service Connection Portal</h1>
    <h4>These guidelines will help you navigate and complete the process for applying for a new electricity connection.</h4>

    <div class="guidelines">
        <div class="guideline-box">
            <h3>How to Apply for a New Connection?</h3>
            <h4>Step 1: User Registration</h4>
            <ul>
                <li>Visit the Sign Up page.</li>
                <li>Fill in the required details such as:<br>* Full Name<br>* Mobile Number<br>* Create a secure Password<br>* Submit the form to generate your Consumer ID.<br>* Save the Consumer ID and Password for future logins.</li>
                <li>Click Sign Up to register yourself.</li>
            </ul>
        </div>
        <div class="guideline-box"> 
            <h3>How to Login?</h3>
            <h4>Step 2: Login</h4>
            <ul>
                <li>Go to the Login page.</li>
                <li>Enter your Consumer ID and Password.</li>
                <li>Click Login to access your dashboard.</li>
            </ul>
        </div>
        <div class="guideline-box">
            <h3>How to Fill Application Form?</h3>
            <h4>Step 3: Fill Application Form</h4>
            <ul>
                <li>Click on “New Connection Application”.</li>
                <li>Complete the application form with accurate details:<br>* Connection Type<br>* Consumer ID<br>* Address of connection<br>* Type of connection<br>* Load requirement<br>* Applicant’s personal and contact information</li>
                <li>Preview all details before final submitting.</li>
            </ul>
        </div>
        <div class="guideline-box">
            <h3>How to upload required documents?</h3>
            <h4>Step 4: Upload Documents</h4>
            <ul>
                <li>Upload the necessary supporting documents:<br>* Identity Proof (e.g., Aadhaar, PAN)<br>* Address Proof (e.g., Electricity bill, Rental agreement)<br>* Ownership Proof or Authorization Letter (if applicable)<br>* Photo Of Applicant</li>
                <li>Make sure the documents are clear and in PDF/JPG/PNG format.</li>
                <li>Submit all files along with the application.</li>               
            </ul>
        </div>
         <div class="guideline-box">
            <h3>How to make Payment?</h3>
            <h4>Step 5: Make Payment (Offline)</h4>
            <table>
	        <caption>Typical Charges for New Connection</caption>
	        <tr>
	            <th>Application Fee</th>
	            <td> ₹50 </td>
	        </tr>
	        <tr>
	            <th>Security Deposit</th>
	            <td>₹300 per kW </td>
	        </tr>
	        <tr>
	            <th>Service Line Charges</th>
	            <td>(₹500–₹5000+)</td>
	        </tr>
	        <tr>
	            <th>Meter Cost</th>
	            <td>Varies with meter type (single/three-phase, prepaid/postpaid)</td>
	        </tr>
	    </table>
	    <ul>
                <li>The payment must be made offline via cash.</li>
                <li>Visit the nearest electricity office or service center with your Consumer ID & Password.</li>
                <li>Ensure you collect and keep the payment receipt for future reference.</li>               
            </ul>
        </div>
        <div class="guideline-box">
            <h3>How to Track Status?</h3>
            <h4>Step 6: Track Status</h4>
            <ul>
                <li>Log in regularly to check the status of your application.</li>              
            </ul>
        </div>
    </div>
    <h5>Ensure your contact details are correct for future communication.<br>For any issues or delays, contact the local electricity board office.</h5>

    <div class="conclusion">
        Following these steps will ensure a smooth SBPDCL connection and bill payment process.
    </div>
</div>

</body>
</html>