<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 담당학생 리스트 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />
<div>
	<h2>담당학생 목록</h2>
	<form action="/planner/work/planner_student_list"
	method="post" name="studentListForm" id="studentListForm">
	<table class="table table-bordered">
	<thead>
		<tr>
			
			<td>기수</td>
			<td>학과</td>
			<td>담당학생</td>
		</tr>
	<c:forEach var="p" items="${plannerStudentList}">
		<tr>

			<td>${p.cardinalCode}</td>
			<td>${p.departmentName}</td>
			<td>${p.studentCode}</td>
		</tr>
	</c:forEach>
	</thead>
</table>
</form>
	<ul class="pager">
		    <li><a href="/smedu/main/main">이전</a></li>
	</ul>
</div>
</body>
</html>