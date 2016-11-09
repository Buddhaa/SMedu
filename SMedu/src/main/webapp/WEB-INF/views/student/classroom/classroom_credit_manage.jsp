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
		$("#openSubject").change(function(){
			var openSubjectCode = $("#openSubject").val();
			location.replace('/classroomCreditManage?openSubjectCode=' + openSubjectCode);
		});
	});
</script>

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
				<div class="col-md-4">
					<select class="form-control" id="openSubject">
						<c:forEach var="openSubjectSelect" items="${openSubjectSelect}" varStatus="status">
									<c:if test="${status.count eq 1}">
										<option value="">${openSubjectSelect.year}년-${openSubjectSelect.semester}학기-${openSubjectSelect.cardinal}기</option>
									</c:if>
									
						</c:forEach>
						<c:forEach var="openSubjectSelect" items="${openSubjectSelect}"> 
								<option value="${openSubjectSelect.openSubjectCode}">${openSubjectSelect.subjectName}</option>
						</c:forEach>
					</select>
				</div>
				
				<!-- 본문 -->
				<table>
						<tr>
						<c:forEach var="gradeDomainList" items="${gradeDomainList}" varStatus="status">
								<th>
									${gradeDomainList.gradeEvaluationCategory}
								</th>	 						
						</c:forEach>
						</tr>
						<tr>
						<c:forEach var="gradeDomainList" items="${gradeDomainList}" varStatus="status">
								<td>		
									${gradeDomainList.gradeScore}
								</td>
						</c:forEach>
						</tr>
					</table>
				
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>