<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <style>
    	 body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            display: flex;
            align-items: stretch;
            justify-content: space-between;
            height: 80vh;
            padding: 30px;
            
        }
        .image-container {
            flex: 1;
            display: flex; 
            justify-content: center;
            align-items: center;
        }
        .image-container img {
            width: 100%;
            max-width: 500px;
            max-height: 500px;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }
        .content-container {
            flex: 1;
            padding: 40px;
            background-color: white;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            font-size: 1.2em;
            line-height: 1.5;
            display: flex; 
            flex-direction: column;
            justify-content: center;
        }
        .new-section {
   			 display: flex;
			 align-items: center;
			 justify-content: space-between;
		     width: 88%;
			 margin: 3px auto;
			 padding: 15px;
			 background: #f8f8f8;
			 border-radius: 8px;
			 box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
		}

		.new-content {

              line-height: 1.5;
            padding-left: 10px;
		    width: 70%;
		   font-size: 20px;
		   color: #333;
            
		   
		}

		.new-image {
			 display: flex;
		    width: 25%;
		    
		    justify-content: center;
		     align-items: center;
		}

		.new-image img {
		    width: 100%;
		    height: auto;
		   border-radius: 5px;
		   padding-right: 10px;
		}
    </style>
</head>
<body>

<div class="container">
    <div class="image-container">
        <img src="images/about.jpg" alt="About Us Image">
    </div>
    <div class="content-container">
        <h2>About Us</h2>
        <p>South Bihar Power Distribution Company Limited (SBPDCL) is a public sector undertaking (PSU) controlled by the Government of Bihar.
         It was formed on 1st November 2012 under Section 14 of the Electricity Act of 2003, and it is a successor to the erstwhile Bihar State Electricity Board.</p>
        <p><strong>Our main objectives are:</strong></p>
        <ul>
            <li>To modernize and strengthen the distribution network.</li>
            <li>To extend the distribution to all the villages/tolas.</li>
            <li>To provide meter to all the un-metered consumers.</li>
            <li>To redresses the consumer grievances in the shortest time.</li>
        </ul>
    </div>
</div>
<div class="new-section">
    <div class="new-content">
        <p>We have established a call center for our valued consumers, where all types of complaints may be lodged.
        We are committed to provide safe, reliable, uninterrupted and quality power supply to all of the valued 
        consumers at affordable tariff.</p>
    </div>
   <div class="new-image">
   		 <img src="images/about2.jpg" alt="Call center assistance">
   </div>
       
    
</div>

</body>
</html>