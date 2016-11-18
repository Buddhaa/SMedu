<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		if($("#lecture tr").length == 11) {
			$("#lectureInsertBtn").hide();
		}else{
			$("#lectureInsertBtn").show();
		}
		
		$("#professorSubjectSelect").val("${openSubjectCode }").attr("selected", "selected");
		
		if ($("#professorSubjectSelect").val() == "") {
			$("#lectureInsertBtn").hide();
		}
		
		$("#professorSubjectSelect").change(function() {

			if ($("#professorSubjectSelect").val() == "") {
				//location.reload();
			} else {
				$("#professorSubjectSelectForm").submit();
			}
		});
		

		
		$("#lectureInsertBtn").click(function() {
			
			window.open('/professorLectureInsert?openSubjectCode=${openSubjectCode }', 'lectureInsertPopUp', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530, ')

		});
	});
	
</script>

<title>시커먼스</title>
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />
	<div class="hoc container clear">

		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />

		<div class="content three_quarter">

			<form id="professorSubjectSelectForm"
				action="/professorLectureListSelect" class="form-horizontal"
				method="post">

				<fieldset>
					<legend>강의관리</legend>
						<div class="form-group">
							<label class="col-md-2 control-label">과목 선택</label>
						
							<div class="col-md-4">
								<select id="professorSubjectSelect" name="openSubjectCode"
									class="form-control">
									<option value="">=======선택=======</option>
									
									<c:forEach var="professorSubject" items="${professorSubject }">
										<option value="${professorSubject.openSubjectCode }">${professorSubject.subjectName }</option>
									</c:forEach>								
								</select>	
							</div>
						</div>
				</fieldset>
			</form>
			
			<table class="table table-hover" id="lecture">
				<thead>
					<tr>
						<th>주차</th>
						<th>주제</th>
						<th>강의시간</th>
						<th>등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Lecture"
						items="${professorLectureList }">
						<tr>
							<td>${Lecture.weeklySchedule }</td>
							<td><a href="#"
							onclick="javascript:window.open('/professorLetureDetail?lectureCode=${Lecture.lectureCode }', 'studentTaskResult', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-600)/2+', width=600, height=550')">
							${Lecture.lectureSubject }</a></td>
							<td>${Lecture.lectureTime }</td>
							<td>${Lecture.lectureRegisterDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			
			<!-- Button -->
				<div class="form-group">
					<div class="col-md-4">
						<input type="button" id="lectureInsertBtn" class="btn btn-default" value="강의등록">
					</div>
				</div>		

		</div>
	</div>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>