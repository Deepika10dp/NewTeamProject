<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guidelines - SBPDCL</title>
    <style>
       html, body {
		    height: 100%;
		    margin: 0;
		    padding: 0;
		    font-family: 'Poppins', sans-serif;
		    background: #f0f0f0;
		    overflow: auto;
		}
		body{
			position: relative;
		  
		}
		.background-container {
		    min-height: 100vh;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    position: relative;
		}
		
		.background-container::before {
		    content: "";
		    position: absolute;
		    top: 0; left: 0;
		    width: 100%; height: 100%;
		    z-index: -1;
		}
		
		.scroll-container {
		    position: absolute;
		    top: 0; bottom: 0;
		    left: 0; right: 0;
		    overflow-y: auto;
		    padding: 40px 20px;
		}
		
		.container {
		    background: rgba(255, 255, 255, 0.95);
		    padding: 30px;
		    max-width: 1000px;
		    margin: 0 auto;
		    border-radius: 12px;
		    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
		    z-index: 1;
		}
       
        h1 {
            text-align: center;
            color: maroon;
            margin-bottom: 20px;
        }
        .guidelines-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-bottom: 20px;
        }
        .guideline-box {
            width: 48%;
            min-width: 300px;
            background: #f8f9fa;
            padding: 15px;
            margin-top: 10px;
            border-left: rgb(128,0,0);
            border-radius: 5px;
            transition: transform 0.3s;
            box-sizing: border-box;
        }
        .guideline-box:hover {
            transform: scale(1.02);
        }
        h3, h4 {
            color: #343a40;
            text-align: center;
            font-size: 18px;
        }
       

        ul {
            padding-left: 20px;
        }
        li {
            line-height: 1.6;
        }
        .conclusion {
            text-align: center;
            font-size: 1.3em;
            font-weight: bold;
            color: #28a745;
            margin-top: 20px;
        }
        @media (max-width: 768px) {
            .guideline-box {
                width: 100%;
            }
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        caption {
            caption-side: top;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
      
    </style>
</head>
<body>
<div class="background-container" style="background: url('<%= request.getContextPath() %>/images/3.jpg') no-repeat center center/cover;">
<div class="scroll-container">
<div class="container">
    <h1>User Guidelines: New Service Connection Portal</h1>
    <h3>These guidelines will help you navigate and complete the process for applying for a new electricity connection.</h3>

    <!-- All 6 boxes in one Flexbox row -->
    <div class="guidelines-row">

        <div class="guideline-box">
            <h4>Step 1: User Registration</h4>
            <ul>
                <li>Visit the Sign Up page.</li>
                <li>Fill in the required details such as:<br>* Full Name<br>* Mobile Number<br>* Create a secure Password<br>* Submit the form to generate your Consumer ID.<br>* Save the Consumer ID and Password for future logins.</li>
                <li>Click Sign Up to register yourself.</li>
            </ul>
        </div>

        <div class="guideline-box">
             
            <h4>Step 2: Login</h4>
            <ul>
                <li>Go to the Login page.</li>
                <li>Enter your Consumer ID and Password.</li>
                <li>Click Login to access your dashboard.</li>
            </ul>    
        </div>

        <div class="guideline-box">
            
            <h4>Step 3: Fill Application Form</h4>
            <ul>
                <li>Click on “New Connection Application”.</li>
                <li>Complete the application form with accurate details:<br>* Connection Type<br>* Consumer ID<br>* Address of connection<br>* Type of connection<br>* Load requirement<br>* Applicant’s personal and contact information</li>
                <li>Preview all details before final submitting.</li>
            </ul>
        </div>

        <div class="guideline-box">
            
            <h4>Step 4: Upload Documents</h4>
            <ul>
                <li>Upload the necessary supporting documents:<br>* Identity Proof (e.g., Aadhaar, PAN)<br>* Address Proof (e.g., Electricity bill, Rental agreement)<br>* Ownership Proof or Authorization Letter (if applicable)<br>* Photo Of Applicant</li>
                <li>Ensure the documents are clear and in PDF/JPG/PNG format.</li>
                <li>Submit all files along with the application.</li>
            </ul>
        </div>

        <div class="guideline-box">
           
            <h4>Step 5: Make Payment (Offline)</h4>
            <table>
                <caption>Typical Charges for New Connection</caption>
                <tr><th>Application Fee</th><td>₹50</td></tr>
                <tr><th>Security Deposit</th><td>₹300 per kW</td></tr>
                <tr><th>Service Line Charges</th><td>(₹500–₹5000+)</td></tr>
                <tr><th>Meter Cost</th><td>Varies with meter type (single/three-phase, prepaid/postpaid)</td></tr>
            </table>
            <ul>
                <li>The payment must be made offline via cash.</li>
                <li>Visit the nearest electricity office or service center with your Consumer ID & Password.</li>
                <li>Collect and keep the payment receipt for future reference.</li>
            </ul>
        </div>

        <div class="guideline-box">
           
            <h4>Step 6: Track Status</h4>
            <ul>
                <li>Log in regularly to check the status of your application.</li>
            </ul>
        </div>

    </div>

    <h4>Ensure your contact details are correct for future communication. For any issues or delays, contact the local electricity board office.</h4>

    <div class="conclusion">
        Following these steps will ensure a smooth SBPDCL connection and bill payment process.
    </div>
</div>
</div>
</div>
</body>
</html>