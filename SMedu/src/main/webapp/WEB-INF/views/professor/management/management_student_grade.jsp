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
				action="/professorStudentInfoSelect" class="form-horizontal"
				method="post">
			<%-- <input type="hidden" value="${userPlusInfo.professorCode}" name="professorCode" /> --%>
				<fieldset>

					<legend>학생성적조회</legend>
					
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
						<th>전화번호</th>
						<th>주소</th>
						<th>E-mail</th>
						<th>성적조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="professorStudentInfo"
						items="${professorStudentInfo }">
						<tr>
							<td>${professorStudentInfo.userName }</td>
							<td>${professorStudentInfo.userPhone }</td>
							<td>${professorStudentInfo.userAddress }</td>
							<td>${professorStudentInfo.userEmail }</td>
							<td>
								<a href="#"
								onclick="javascript:window.open('/professorStudentGradeSelect?userCode=${professorStudentInfo.userCode }', 'studentGrade', 'left='+(screen.availWidth-400)/2+',top='+(screen.availHeight-360)/2+', width=400, height=330')">
								조회</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-4 col-sm-offset-2">
				<div id="imaginary_container">
					<form action="/professorStudentInfoSelect" id="studentSearchForm" method="POST">
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