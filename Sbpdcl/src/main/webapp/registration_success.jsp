<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef;
            text-align: center;
            padding-top: 100px;
        }
        .card {
            background: #fff;
            border-radius: 10px;
            display: inline-block;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        h2 {
            color: #2c3e50;
        }
        p {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>
   <!-- Registration Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content text-center">
      <div class="modal-header">
        <h5 class="modal-title">Registration Successful!</h5>
      </div>
      <div class="modal-body">
        <p><strong>User ID:</strong> ${userId}</p>
        <p><strong>Password:</strong> ${password}</p>
        <small>Make sure to take a screenshot or note them down for future logins.</small>
      </div>
      <div class="modal-footer">
        <button id="okBtn" class="btn btn-primary">OK</button>
      </div>
    </div>
  </div>
</div>
<script>
    $(document).ready(function () {
        $('#successModal').modal('show');

        $('#okBtn').on('click', function () {
            $('#successModal').modal('hide');
            window.location.href = 'index.html';
        });
    });
</script>
</body>
</html>