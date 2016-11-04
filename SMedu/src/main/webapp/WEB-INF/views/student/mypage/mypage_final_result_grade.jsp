<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/main_sidebar.jsp" />
			<div class="content three_quarter">
			<fieldset>				
				<legend>나의정보</legend>					
				  <table class="table table-hover">
				    <thead>
						<tr>
							<th>년</th>
							<th>학기</th>
							<th>기수</th>
							<th>과목</th>
							<th>학점</th>
							<th>이수여부</th>
						</tr>
					</thead>
				    <tbody>
						<c:forEach var="finalResult" items="${finalResultGrade}">
							<tr>
								<td>${finalResult.year}</td>
								<td>${finalResult.semester}</td>
								<td>${finalResult.cardinal}</td>
								<td>${finalResult.subjectName}</td>
								<td>${finalResult.finalResult}</td>
								<td>${finalResult.completeConfirmation}</td>
							</tr>
						</c:forEach>
					</tbody>
				  </table>							
			</fieldset>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>