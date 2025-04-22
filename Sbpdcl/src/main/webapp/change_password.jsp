<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<style>
    .form-group {
        margin-bottom: 15px;
    }
    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    input[type="password"] {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }
    .form-group.center-button {
    	text-align: center;
    }
     input[type="submit"] {
     	width: auto;
        padding: 6px 12px;
        box-sizing: border-box;
        cursor: pointer;
        font-size: 13px;
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
    <p style="color: red;"><%= msg %></p>
<%
    }
%>