<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>시커먼스</title>
</head>
<body>
	<div class="hoc container clear">
	<div class="content three_quarter">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>성적평가항목</th>
				<th>점수</th>
				<th>참여여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="professorStudentGrade" items="${professorStudentGrade }">
				<tr>
					<td>${professorStudentGrade.gradeEvaluationCategory }</td>
					<td>${professorStudentGrade.gradeScore }</td>
					<td>${professorStudentGrade.participationState }</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	</div>
</div>
</body>
</html>