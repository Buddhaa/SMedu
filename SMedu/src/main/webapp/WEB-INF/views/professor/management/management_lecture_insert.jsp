<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>SMedu</title>
<script type="text/javascript">

$(document).ready(function () {
	
	console.log("${fn:length(lectureAcademicCalendarCode)} ")
	console.log($('#academicCalendarCode').val())
	
	/* vallidation code...아직 미완성 */
	
	$('#lectureInsertBtn').click(function () {
		
		console.log("${fn:length(lectureAcademicCalendarCode)} ")	
		
		<c:forEach var="lectureAcademicCalendarCode" items="${lectureAcademicCalendarCode}">
			if($('#academicCalendarCode').val() == "${lectureAcademicCalendarCode.academicCalendarCode}") {
				
				console.log("중복")
				alert("이미 해당 주차에 강의가 등록되어 있습니다.")
			
			}else{
				$('#lectureInsertForm').submit();
			}
			
		</c:forEach>
	});
});

</script>
</head>
<body>

	<div class="hoc container clear">
		<div class="content three_quarter">
			<form id="lectureInsertForm" action="/professorLectureInsert" class="form-horizontal" method="post">
			
				<input type="hidden" name="openSubjectCode" value="${param.openSubjectCode}">
				<br />
				<div class="col-xs-4">
					<select id="academicCalendarCode" name="academicCalendarCode"
						class="form-control">
						<c:forEach var="academicCalendar" items="${academicCalendar }">
							<option value="${academicCalendar.academicCalendarCode }">${academicCalendar.weeklySchedule }</option>
						</c:forEach>
					</select>
				</div>
				<br/>
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">강의 주제</label>
					<div class="col-md-4">
						<input name="lectureSubject" type="text" class="form-control input-md"
							placeholder="강의주제 입력">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">세부 내용</label>
					<div class="col-md-4">
						<textarea class="form-control" rows="5" cols="10"
							style="resize: none;" name="lectureContent" placeholder="강의내용 입력"></textarea>
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">강의 링크</label>
					<div class="col-md-4">
						<input name="lectureLink" type="url" class="form-control input-md"
							placeholder="강의링크 입력">
					</div>
				</div>
				
				<div class="form-group">
					<div>
					<label class="col-md-4 control-label">강의 시간</label>
					</div>
					<div class="col-xs-4"><small>00(시):00(분):00(초) 로 입력</small>
						<input name="lectureTime" type="text" class="form-control input-md" value="00:00:00">
					</div>
				</div>
				
				<hr/>
				
					<!-- button -->			
				<div class="form-group">	
					<div class="col-md-4">
					<input type="button" id="lectureInsertBtn" class="btn btn-default" value="등록하기">
					</div>
				</div>	
			</form>
		</div>
	</div>
</body>
</html>