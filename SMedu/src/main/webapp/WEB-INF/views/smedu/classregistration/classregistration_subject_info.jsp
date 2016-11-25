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
			<td>구분</td>
			<td>${subjectSelectInfo.subjectSort }</td>
			<td>과목명</td>
			<td>${subjectSelectInfo.subjectName }</td>
		</tr>
		<tr>
			<td>학점</td>
			<td>${subjectSelectInfo.subjectCredit }</td>
			<td>수강료</td>
			<td>${subjectSelectInfo.subjectPay }</td>
		</tr>
		<tr>
			<td colspan="4">과목개요</td>
		</tr>
		<tr>
			<td colspan="4"><pre style="overflow: auto;  white-space: pre-wrap;">${subjectSelectInfo.subjectSummary }</pre></td>
		</tr>
		<tr>
			<td colspan="4">과목목표</td>
		</tr>
		<tr>
			<td colspan="4"><pre style="overflow: auto;  white-space: pre-wrap;">${subjectSelectInfo.subjectGoal }</pre></td>
		</tr>
	</table>
</body>
</html>