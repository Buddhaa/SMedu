<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){
	<c:forEach var="plannerStudentInfo" items="${searchView }">
		$("#${plannerStudentInfo.userName}").click(function(){
			$(opener.document).find("#userName").val($("#${plannerStudentInfo.userName}").val());	
			$(opener.document).find("#plannerStudentCode").val($("#${plannerStudentInfo.plannerStudentCode}").val());	
			self.close();
		});
	</c:forEach>
});

</script>

</head>
<body>
	
	
	
	<table class="table table-hover">
		<tr>
			<th>기수</th>
			<th>학생선택</th>
			<th>전화번호</th>
			<!-- <td>학생선택</td> -->
		</tr>
	<c:forEach var="plannerStudentInfo" items="${searchView }" varStatus="status">
		<tr>
			
			<td>${plannerStudentInfo.cardinal }기</td>
			<td>
				<input type="hidden" id="${plannerStudentInfo.plannerStudentCode}" value="${plannerStudentInfo.plannerStudentCode}">
				<input style="border:0; outline:0; background:none;  text-decoration: underline;" type="button" id="${plannerStudentInfo.userName}" value="${plannerStudentInfo.userName}">
			</td>
			<td>${plannerStudentInfo.userPhone }</td>	
		</tr>
	</c:forEach>
	</table>
</body>
</html>