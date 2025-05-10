<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String appId = request.getParameter("app_id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify Documents - Application ID: <%= appId %></title>
    <style>
        body { font-family: Arial; padding: 20px; }
        .container { width: 60%; margin: auto; border: 1px solid #ccc; padding: 20px; border-radius: 8px; }
        label { display: block; margin-top: 20px; font-weight: bold; }
        textarea { width: 100%; height: 100px; margin-top: 10px; }
        button { margin-top: 20px; padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 4px; }
    </style>
</head>
<body>

<div class="container">
    <h2>Document Verification</h2>
    <form action="DocumentVerificationServlet" method="post">
        <input type="hidden" name="app_id" value="<%= appId %>" />

        <label for="jee_remarks">JEE Remarks</label>
        <textarea name="jee_remarks" required placeholder="Enter your verification remarks here..."></textarea>

        <button type="submit">Verify and Forward to MI</button>
    </form>
</div>

</body>
</html>
