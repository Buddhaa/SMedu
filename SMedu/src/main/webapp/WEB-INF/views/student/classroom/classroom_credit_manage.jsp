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

<script>
	$(document).ready(function(){
		
		$("#openSubject").val("${selectbox}");
		
		$("#openSubject").change(function(){
			var openSubjectCode = $("#openSubject").val();
			location.replace('/classroomCreditManage?openSubjectCode=' + openSubjectCode);
		});
	});
</script>
<title>시커먼스</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
			<div class="content three_quarter">
				<fieldset>
				<h1>나의 학점 관리</h1>
				</fieldset>
				<table class="table table-hover">
					<thead>
				      <tr>
				        <th>개설과목</th>
				        <th>중간고사</th>
				        <th>기말고사</th>
				        <th>출석</th>
				        <th>과제</th>
				        <th>토론</th>
				      </tr>
				    </thead>
				    <tbody>	
				    	<tr>			    
						<c:forEach var="creditList" items="${creditList}" varStatus="status">
						<c:if test="${status.index%5 ==0 }">
							<td>
								${creditList.subjectName}
							</td>
						</c:if>
							<td>
								${creditList.gradeScore}
							</td>							
						</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>