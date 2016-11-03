<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SMedu 관리자 | 로그인 페이지</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="/resources/admin/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/admin/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/resources/admin/plugins/iCheck/square/blue.css">
<!-- jQuery 2.2.3 -->
<script src="/resources/admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/resources/admin/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/resources/admin/plugins/iCheck/icheck.min.js"></script>
<script>
  var loginFalseMessage = '<c:out value='${loginFalseMessage}'/>';
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
    if(loginFalseMessage!='') {
      alert(loginFalseMessage);
    }
  });
</script>
<script>
	
</script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<b>SMedu</b>Admin
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">관리자 로그인 페이지</p>
			<!-- 관리자 로그인 폼 -->
			<form action="/admin/login/login" method="post">
				<div class="form-group has-feedback">
					<!-- 아이디 -->
					<input type="text" class="form-control" placeholder="ID" value="admin" id="userId" name="userId">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<!-- 비밀번호 -->
					<input type="password" class="form-control" placeholder="Password" value="java0000" id="userPw" name="userPw">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" checked> Remember Me </label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<!-- /.social-auth-links -->
			<a href="#">I forgot my password</a><br>
			<a href="register.html" class="text-center">Register a new membership</a>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
</body>
</html>
