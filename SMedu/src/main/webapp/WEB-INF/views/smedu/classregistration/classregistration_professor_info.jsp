<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr>
			<td style="width:250px; height:260px;"><img src="/resources/admin/dist/img/profile.jpg" alt="" style="width: 100%; height: 100%"></td>
			<td>
				<table class="table">
					<tr>
						<td>이름</td>
						<td>${professorSelectInfo.userName }</td>
					</tr>
					<tr>
						<td>학과</td>
						<td>${professorSelectInfo.departmentName }</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>${professorSelectInfo.userGender}</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${professorSelectInfo.userEmail}</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>${professorSelectInfo.userAddress}</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>${professorSelectInfo.userBirth}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>학사</td>
			<td>${professorSelectInfo.professorBachelor }</td>
		</tr>
		<tr>
			<td>석사</td>
			<td>${professorSelectInfo.professorDoctor }</td>
		</tr>
		<tr>
			<td>박사</td>
			<td>${professorSelectInfo.professorCareer }</td>
		</tr>
	</table>
</body>
</html>