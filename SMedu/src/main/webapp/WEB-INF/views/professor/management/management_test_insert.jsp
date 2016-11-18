<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<title>SMedu</title>

<script type="text/javascript">

$(document).ready(function () {
	
	$("#returnBtn").click(function () {
		location.href="/professorSubjectSelectForExam"
	});
	$("#insertBtn").click(function () {
		//vallidation Code
		$("#examQuestionInsertForm").submit();
		alert("시험문제가 등록되었습니다.")
	});
});



</script>
</head>
<body>
<!-- <input type="hidden" name="upDir" value="C:\Users\ssolt\git\SMedu_1107\SMedu\src\main\webapp\resources\examQuestion\" /> -->
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />
	<div class="hoc container clear">
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
		<div class="content three_quarter">
			
			<form method="post" action="/examQuestionInsert" class="form-horizontal"
			id="examQuestionInsertForm" enctype="multipart/form-data">		
				
				<!-- hidden -->
				<input type="hidden" name="openSubjectCode" value="${param.openSubjectCode}">
				<input type="hidden" name="examQuestionScore" value="5">

				<!-- 중간고사 / 기말고사 select Box -->
				<div class="col-md-4">
					<select id="" name="academicCalendarCode" class="form-control">
						<option value="${midAcademicCalendarCode.academicCalendarCode }">${midAcademicCalendarCode.weeklySchedule }</option>
						<option value="${lastAcademicCalendarCode.academicCalendarCode }">${lastAcademicCalendarCode.weeklySchedule }</option>
					</select>
				</div>
				
				<br/><br/><br/>
					
				<!-- examQuestionNo input box -->	
				<label class="col-md-4 control-label">문제 번호</label>
				<small>1~20의 숫자 입력</small>
				<div class="col-xs-2">
					<input name="examQuestionNo" type="text" class="form-control input-md">
				</div>
				
				<br/><br/>
				
				<!-- examQuestionAnswer input box -->
				<label class="col-md-4 control-label">정답</label>
				<small>1~4의 숫자 입력</small>
				<div class="col-xs-2">
					<input name="examQuestionAnswer" type="text" class="form-control input-md">
				</div>
				
				<br/><br/>
				
				<!-- examQuestionFile input box -->
				<label class="col-md-4 control-label">File Upload</label>
				<div>
					<input type="file" name="examQuestionFile">
				</div>				
				
				<br/>
	
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="insertBtn" class="btn btn-default" value="시험문제 등록">
					</div>
				</div> 				
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="returnBtn" class="btn btn-default" value="뒤로가기">
					</div>
				</div>
			</form>
		</div>
	</div>
<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>