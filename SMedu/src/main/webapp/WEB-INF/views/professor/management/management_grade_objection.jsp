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
				action="/professorStudentObjectionSelect" class="form-horizontal">
			<%-- <input type="hidden" value="${userPlusInfo.professorCode}" name="professorCode" /> --%>
				<fieldset>

					<legend>성적이의신청관리</legend>
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
						<th>이의신청 종류</th>
						<th>이름</th>
						<th>제목</th>
						<th>이의신청일</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="StudentObjectionInfo"
						items="${professorStudentObjectionInfo }">
						<tr>
								<td>${StudentObjectionInfo.objectionType }</td>
								<td>${StudentObjectionInfo.userName }</td>
							<c:if test="${StudentObjectionInfo.objectionReply == null}">	
								<td>
									<a href="#"
									onclick="javascript:window.open('/professorStudentObjectionDetail?objectionCode=${StudentObjectionInfo.objectionCode }', 'studentObjection', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')">
									${StudentObjectionInfo.objectionTitle }</a>
								</td>
							</c:if>
							<c:if test="${StudentObjectionInfo.objectionReply != null}">
								<td>	
									<a href="#"
									onclick="javascript:window.open('/professorStudentObjectionReplyDetail?objectionCode=${StudentObjectionInfo.objectionCode }', 'studentObjection', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')">
									${StudentObjectionInfo.objectionTitle }</a>
								</td>							
							</c:if>
								<td>${StudentObjectionInfo.objectionDate }</td>
							<c:if test="${StudentObjectionInfo.objectionReply == null}">	
								<td>미답변</td>
							</c:if>
							<c:if test="${StudentObjectionInfo.objectionReply != null}">	
								<td>답변완료</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>