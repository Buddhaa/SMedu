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
			location.replace('/classroomAcademicaCtivity?openSubjectCode=' + openSubjectCode);
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
				<legend>나의 학사활동</legend>
				<div class="col-md-4">
					<select class="form-control" id="openSubject">
						<option value="">${classroomAcademicaCtivity.get(1).year}년${classroomAcademicaCtivity.get(1).semester}${classroomAcademicaCtivity.get(1).cardinal}</option>
						<c:forEach var="classroomAcademicaCtivity" items="${classroomAcademicaCtivity}"> 
							<option value="${classroomAcademicaCtivity.openSubjectCode}">${classroomAcademicaCtivity.subjectName}</option>
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
					        	<a href="/classroomLecture?lectureCode=${lectureList.lectureCode}" style="float: right;">수강하기</a>
					        </c:if>	
					        
					        <c:if test="${status.count %5 ==0 }">
					        	<a href="/classroomExam?lectureCode=${lectureList.lectureCode}" style="float: right;">시험응시</a>
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