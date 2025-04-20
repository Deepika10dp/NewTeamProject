<%@ page language="java" contentType="text/html; charset=UTF-8" %>

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
    <table>
        <tr>
            <td>Old Password:</td>
            <td><input type="password" name="oldPassword" required></td>
        </tr>
        <tr>
            <td>New Password:</td>
            <td><input type="password" name="newPassword" required></td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td><input type="password" name="confirmPassword" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Change Password"></td>
        </tr>
    </table>
</form>

<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <p style="color: red;"><%= msg %></p>
<%
    }
%>
