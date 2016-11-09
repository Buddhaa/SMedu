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
			location.replace('/classroomAcademicActivity?openSubjectCode=' + openSubjectCode);
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
				<h2>나의 학사활동</h2>
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
				<br/>
				<br/>		
				<div>
					<table>
						<tr>
						<c:forEach var="attendList" items="${openSubjectAttendList}" varStatus="status">
								<th>
									${status.count}주차
								</th>	 						
						</c:forEach>
						</tr>
						<tr>
						<c:forEach var="attendList" items="${openSubjectAttendList}" varStatus="status">
								<td>		
									${attendList.attendCompleteConfirmation}
								</td>
						</c:forEach>
						</tr>
					</table>
				</div>
				<div>
				<c:forEach var="lectureList" items="${classroomAcademicaCtivityView}" varStatus="status">
					 <div class="panel-group" id="accordion">
					 	<div class="panel panel-default">
					      <div class="panel-heading">
					        <p class="panel-title">
					        	${lectureList.weeklySchedule}
					        	[${lectureList.academicCalendarStartDay}~${lectureList.academicCalendarEndDay}]
					        	
					        <c:if test="${status.count %5 !=0 }">								
					        	<a href="#"
					        	 onclick="javascript:window.open('/classroomLecture?lectureCode=${lectureList.lectureCode}', 'lectureCode' ,'left='+(screen.availWidth-1000)/2+',top='+(screen.availHeight-800)/2+', width=950, height=700')" style="float: right;">
								수강하기</a>
					        </c:if>	
					        
					        <c:if test="${status.count %5 ==0 }">
					        	<a href="#"
					        	 onclick="javascript:window.open('/classroomExam?lectureCode=${lectureList.lectureCode}', 'lectureCode' ,'left='+(screen.availWidth-1000)/2+',top='+(screen.availHeight-800)/2+', width=950, height=700')" style="float: right;">
								시험응시</a>
					        </c:if> 	
					        </p>
					        <p class="panel-title">
					        	${lectureList.lectureSubject}
					        </p>
					      </div>
					    </div>
					 </div>						
				</c:forEach>
				</div>			
				</fieldset>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>