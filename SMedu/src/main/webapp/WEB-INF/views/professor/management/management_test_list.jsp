<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		console.log("${fn:length(professorExam)}")
		$("#professorSubjectSelect").val("${openSubjectCode }").attr("selected", "selected");
		
		if ($("#professorSubjectSelect").val() == "") {
			$("#insertAndSelect").hide();
		} else {
			
			$("#insertAndSelect").show();
		}
		
		$("#professorSubjectSelect").change(function() {
			
			console.log("${fn:length(professorExam)}")
			if ($("#professorSubjectSelect").val() == "") {
				//location.reload();
			} else {
				$("#professorSubjectSelectForm").submit();
			}
		});
		
		$("#examQuestionInsertBtn").click(function () {
			
			$("#examQuestionInsertForm").submit();
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
				action="/professorSubjectSelectForExam" class="form-horizontal"
				method="post">
			<%-- <input type="hidden" value="${userPlusInfo.professorCode}" name="professorCode" /> --%>
				<fieldset>

					<legend>시험지 관리</legend>
					
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
			<!-- 등록된 시험문제가 20문제 미만일 경우 시험문제 등록 폼  -->
			<c:if test="${fn:length(professorExam) lt 20}">
				<div id="insertAndSelect">
				<hr/>
					<p><a href="/examQuestionInsertView?openSubjectCode=${openSubjectCode }"><font style="font-size:30px;">시험문제 등록</font></a></p>
				<hr/>
					<p>
						<a href="/midExamQuestionDetail?openSubjectCode=${openSubjectCode }"><font style="font-size:30px;">시험문제 조회(중간고사)</font></a>
						&nbsp;	&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/finalExamQuestionDetail?openSubjectCode=${openSubjectCode }"><font style="font-size:30px;">시험문제 조회(기말고사)</font></a>
					</p>
				</div>

			</c:if>
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>