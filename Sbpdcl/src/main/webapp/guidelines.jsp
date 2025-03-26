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
    </style>
</head>
<body>

<div class="container">
    <h1>Guidelines for SBPDCL New Connection</h1>

    <div class="guidelines">
        <div class="guideline-box">
            <h3>How to Apply for a New Connection</h3>
            <ul>
                <li>Visit the official website and go to 'New Connection'.</li>
                <li>Select 'LT New Connection' and fill in the required details.</li>
                <li>Upload scanned copies of identity and address proof.</li>
                <li>Submit the form and save the request number.</li>
                <li>Check application status using the request number.</li>
            </ul>
        </div>

        <div class="guideline-box">
            <h3>How to Check Connection Status</h3>
            <ul>
                <li>Go to the bill status page.</li>
                <li>Enter your application number and registered mobile number.</li>
                <li>View the status updates of your new connection.</li>
            </ul>
        </div>

        <div class="guideline-box">
            <h3>How to Pay Electricity Bill</h3>
            <ul>
                <li>Visit the payment website and go to 'Bills and Recharges'.</li>
                <li>Select 'Electricity Bill Payment' and choose your provider.</li>
                <li>Enter your Consumer Number and fetch the bill.</li>
                <li>Select a payment method and complete the payment.</li>
            </ul>
        </div>
    </div>

    <div class="conclusion">
        Following these steps will ensure a smooth SBPDCL connection and bill payment process.
    </div>
</div>

</body>
</html>