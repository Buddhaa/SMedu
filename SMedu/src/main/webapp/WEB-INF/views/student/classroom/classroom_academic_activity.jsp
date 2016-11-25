<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#openSubject").val("${selectbox}");
		
		$("#openSubject").change(function(){
			var openSubjectCode = $("#openSubject").val();
			location.replace('/classroomAcademicActivity?openSubjectCode=' + openSubjectCode);
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
				<h2>나의 학사활동</h2>
				<div class="col-md-5" style="padding-left:0;">
					<label class="control-label">과목선택</label>
					<select class="form-control" id="openSubject">
						<c:forEach var="openSubjectSelect" items="${openSubjectSelect}" varStatus="status">
							<c:if test="${status.count eq 1 }">
								<option value="">${openSubjectSelect.year}년${openSubjectSelect.semester}학기${openSubjectSelect.cardinal}기</option>
							</c:if>
							<option value="${openSubjectSelect.openSubjectCode}">${openSubjectSelect.subjectName}</option>
						</c:forEach>
					</select>
				</div>	
				<div style="margin-top: 15%">
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
									<c:choose>	
										<c:when test="${attendList.attendCompleteConfirmation == 'T'}">
											O
										</c:when>
										<c:when test="${attendList.attendCompleteConfirmation == 'F'}">
											X
										</c:when>
									</c:choose>
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
					        	 onclick="javascript:window.open('/classroomLecture?openSubjectCode=${lectureList.openSubjectCode}&lectureCode=${lectureList.lectureCode}', 'lectureCode' ,'left='+(screen.availWidth-1000)/2+',top='+(screen.availHeight-800)/2+', width=1000, height=650')" style="float: right;">
					        	 <button>수강</button>
								</a>
					        </c:if>	
					        
					        <c:if test="${status.count %5 ==0 }">
					        	<a href="#"
					        	 onclick="javascript:window.open('/classroomExam?openSubjectCode=${lectureList.openSubjectCode}&lectureCode=${lectureList.lectureCode}', 'lectureCode' ,'left='+(screen.availWidth-1000)/2+',top='+(screen.availHeight-800)/2+', width=950, height=700')" style="float: right;">
								<button>시험응시</button></a>
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