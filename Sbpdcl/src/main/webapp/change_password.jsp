<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<style>
		
		
       .modal-form {
		    padding: 20px;
		    background-color: rgba(255,255,255,0.9);
		    border-radius: 10px;
		    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
		    position: relative;
		    z-index: 1050;
		    max-width: 500px;
		    margin: 10% auto;
		}
        .modal-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-group.center-button {
            text-align: center;
        }

        input[type="submit"] {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1976D2;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>

    <script>
        function validateForm() {
            let newPassword = document.forms["changePasswordForm"]["newPassword"].value;
            let confirmPassword = document.forms["changePasswordForm"]["confirmPassword"].value;
            if (newPassword !== confirmPassword) {
                alert("New Password and Confirm Password do not match!");
                return false;
            }
            return true;
        }
    </script>

  <div class="modal-container">	
         <form name="changePasswordForm" action="ChangePasswordServlet" method="post" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="oldPassword">Old Password:</label>
                <input type="password" id="oldPassword" name="oldPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div class="form-group center-button">
                <input type="submit" value="Change Password">
            </div>
        </form>
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="error-message"><%= msg %></div>
        <%
            }
        %>
     </div>