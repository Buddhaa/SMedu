<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function StatusText() {
	window.status ="나타낼문구";
	setTimeout("StatusText()", 0);
}
StatusText();
</script>

<title>시커먼스</title>
</head>
<body>
	<font style="font-weight: bold; font-size: 20px">${professorStudentName.userName }
		님의 ${professorOpenSubjectName.subjectName } 과목 출석부 </font>
	<br />
	<br />

	<table class="table table-hover">
		<tr>
			<th>주차일정</th>
			<th>수강시간</th>
			<th>출석날짜</th>
			<th>수강여부</th>
			<th>출석점수</th>
		</tr>

		<c:set var="sum" value="0" />
		<c:forEach var="weeklySchedule"
			items="${professorStudentWeeklySchedule }">

			<c:forEach var="StudentAttendInfo"
				items="${professorStudentAttendInfo }">

				<c:if
					test="${weeklySchedule.academicCalendarCode == StudentAttendInfo.academicCalendarCode }">
					<tr>
						<td>${weeklySchedule.weeklySchedule }</td>
						<td>${StudentAttendInfo.attendLectureTime }</td>
						<td>${StudentAttendInfo.attendDate }</td>
						<td>${StudentAttendInfo.attendCompleteConfirmation }</td>
						<td>${StudentAttendInfo.attendScore }</td>
					</tr>
					<c:set var="sum" value="${sum + StudentAttendInfo.attendScore}" />
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
	<div class="form-group">
		<div class="col-xs-3">
			<input type="text" name="" id="" class="form-control" value="${sum }"
				placeholder="점수 입력">
		</div>

		<!-- Button -->
		<input type="button" id="" class="btn btn-default" value="채점하기">
	</div>
</body>
</html>