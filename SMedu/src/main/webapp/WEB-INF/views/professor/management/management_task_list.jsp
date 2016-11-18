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

	$("#taskUpdateBtn").hide();
		
	$("#professorSubjectSelect").val("${openSubjectCode }").attr("selected", "selected");
	
	if ($("#professorSubjectSelect").val() == "") {
		$("#taskInsertForm").hide();
	} else {
		
		$("#taskInsertForm").show();
	}
	
	$("#professorSubjectSelect").change(function() {
		
		if ($("#professorSubjectSelect").val() == "") {
			
		} else {
			$("#professorSubjectSelectForm").submit();
		}
		
	});
	
	$("#contentUpdate").click(function () {
		$("#taskContent").attr("readonly", false);
		$("#taskUpdateBtn").show();
	});
	
	$("#subjectUpdate").click(function () {
		$("#taskSubject").attr("readonly", false);
		$("#taskUpdateBtn").show();
	});
	
	$("#taskUpdateBtn").click(function () {
		var result = confirm('정말 수정하시겠습니까?');
		
		if ($("#professorSubjectSelect").val() == "") {
			alert("과목을 선택하세요.");
		}else {
			if(result) {
				$("#taskUpdateForm").submit();
			}
		}
	});
	
	$("#taskInsertBtn").click(function() {
		if ($("#professorSubjectSelect").val() == "") {
			alert("과목을 선택하세요.");
		} else {
			
			/* vallidation Code... */
			$("#taskInsertForm").submit();			
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
				action="/professorSubjectSelectForTask" class="form-horizontal"
				method="post">
			<%-- <input type="hidden" value="${professorStudentName.userCode }" name="userCode" /> --%>
				<fieldset>
					<legend>과제 관리</legend>
						<div class="form-group">
							<label class="col-md-4 control-label">과목 선택</label>
						
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
			
			<!-- 등록된 토론이 있을때의 토론 상세보기 및 수정 form(updateForm) -->
					
		<c:if test="${professorTask.taskCode != null}">	

			<form id="taskUpdateForm"
				action="/professorTaskUpdate" class="form-horizontal"
				method="post">
			
			<input type = "hidden" id="taskCode" name="taskCode" value="${professorTask.taskCode }">	
				
				<div class="form-group">
					<label class="col-md-4 control-label">과제 주제</label>
					<div class="col-md-4">
						<input type="text" id="taskSubject" name="taskSubject" value="${professorTask.taskSubject }"
						class="form-control input-md" readonly="readonly">
					</div>
					<a href="#" id="subjectUpdate">수정</a>
				</div>
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">세부 내용</label>
					<div class="col-md-7">
						<textarea class="form-control" style="resize: none;" rows="4" id="taskContent"
						name="taskContent" readonly="readonly">${professorTask.taskContent }</textarea>
					</div>
					<a href="#" id="contentUpdate">수정</a>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label">등록일</label>
						<div class="col-md-4">
							<p class="form-control-static">${professorTask.taskRegisterDate }</p>
						</div>
				</div>
				
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="taskUpdateBtn" class="btn btn-default" value="수정하기">
					</div>
				</div>
			</form>
			</c:if>
			
			
			<!-- 등록된 토론이 없을때의 토론 등록 form(insertForm) -->
 			
			<c:if test="${professorTask.taskCode == null}">
			<form id="taskInsertForm"
				action="/professorTaskInsert" class="form-horizontal"
				method="post">
			
			<input type = "hidden" name="openSubjectCode" value="${openSubjectCode }">	
				<div class="form-group">
					<label class="col-md-4 control-label">토론 주제</label>
					<div class="col-md-4">
						<input name="taskSubject" type="text" class="form-control input-md"
							placeholder="과제주제 입력">
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">세부 내용</label>
					<div class="col-md-7">
						<textarea class="form-control" style="resize: none;" rows="4" name="taskContent" placeholder="과제내용 입력."></textarea>
					</div>
				</div>

				
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="taskInsertBtn" class="btn btn-default" value="등록하기">
					</div>
				</div>
			</form>
			</c:if> 
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>