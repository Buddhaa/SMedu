<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#professorSubjectSelect").val("${openSubjectCode }").attr("selected", "selected");
		
		$("#professorSubjectSelect").change(function() {

			if ($("#professorSubjectSelect").val() == "") {
				//location.reload();
			} else {
				$("#professorSubjectSelectForm").submit();
			}
		});
		
		$('#searchBtn').click(function () {

			$('#studentSearchForm').submit();

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
				action="/professorStudentGradeManageSelect" class="form-horizontal"
				method="post">
			<%-- <input type="hidden" value="${professorStudentName.userCode }" name="userCode" /> --%>
				<fieldset>
					<legend>학생성적관리</legend>
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
			
			<table class="table table-hover">
				<thead>
					<tr>
						<th>이름</th>
						<th>과제</th>
						<th>토론</th>
						<th>중간</th>
						<th>기말</th>
						<th>출석</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="professorStudentNameAndCode"
						items="${professorStudentNameAndCode }">
						<tr>
							<td>${professorStudentNameAndCode.userName }</td>
							<td><a href="#"
							onclick="javascript:window.open('/professorStudentTaskResultDetail?openSubjectCode=${professorStudentNameAndCode.openSubjectCode }&studentCode=${professorStudentNameAndCode.studentCode }', 'studentTaskResult', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')">과제제출물</a></td>
							<td><a href="#"
							onclick="javascript:window.open('/professorStudentDebateResponseDetail?openSubjectCode=${professorStudentNameAndCode.openSubjectCode }&studentCode=${professorStudentNameAndCode.studentCode }', 'studentDebateResponse', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')">토론답변</a></td>
							<td><a href="#">답안지</a></td>
							<td><a href="#">답안지</a></td>
							<td><a href="#"
							onclick="javascript:window.open('/professorStudentAttendInfoDetail?openSubjectCode=${professorStudentNameAndCode.openSubjectCode }&studentCode=${professorStudentNameAndCode.studentCode }', 'studentAttendInfo', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530, ')">출석부</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="col-sm-4 col-sm-offset-2">
				<div id="imaginary_container">
					<form action="/professorStudentGradeManageSelect" id="studentSearchForm"
						method="POST">
						<div class="input-group stylish-input-group">
							<input type="hidden" name="openSubjectCode" value="${openSubjectCode }">
							<input type="text" class="form-control" placeholder="NameSearch" id="searchWord" name="searchWord">
							<span class="input-group-addon">
								<button type="button" id="searchBtn">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>