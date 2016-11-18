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

		$("#debateUpdateBtn").hide();
		
		$("#professorSubjectSelect").val("${openSubjectCode }").attr("selected", "selected");
			
		if ($("#professorSubjectSelect").val() == "") {
				$("#debateInsertForm").hide();
			} else {
				
				$("#debateInsertForm").show();
			}
		
		$("#professorSubjectSelect").change(function() {
			
			if ($("#professorSubjectSelect").val() == "") {

			} else {
				$("#professorSubjectSelectForm").submit();
			
			}
			
		});
		
		$("#contentUpdate").click(function () {
			$("#debateContent").attr("readonly", false);
			$("#debateUpdateBtn").show();
		});
		
		$("#subjectUpdate").click(function () {
			$("#debateSubject").attr("readonly", false);
			$("#debateUpdateBtn").show();
		});
		
		$("#debateUpdateBtn").click(function () {
			var result = confirm('정말 수정하시겠습니까?');
			
			if ($("#professorSubjectSelect").val() == "") {
				alert("과목을 선택하세요.");
			} else {
				if(result) {
					$("#debateUpdateForm").submit();
				}
			}
		});
		
		$("#debateInsertBtn").click(function() {
			if ($("#professorSubjectSelect").val() == "") {
				alert("과목을 선택하세요.");
			} else {
				
				/* vallidation Code... */
				$("#debateInsertForm").submit();			
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
				action="/professorSubjectSelectForDebate" class="form-horizontal"
				method="post">
			<%-- <input type="hidden" value="${professorStudentName.userCode }" name="userCode" /> --%>
				<fieldset>
					<legend>토론 관리</legend>
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
					
		<c:if test="${professorDebate.debateCode != null}">	

			<form id="debateUpdateForm"
				action="/professorDebateUpdate" class="form-horizontal"
				method="post">
			
			<input type = "hidden" id="debateCode" name="debateCode" value="${professorDebate.debateCode }">	
				
				<div class="form-group">
					<label class="col-md-4 control-label">토론 주제</label>
					<div class="col-md-4">
						<input type="text" id="debateSubject" name="debateSubject" value="${professorDebate.debateSubject }"
						class="form-control input-md" readonly="readonly">
					</div>
					<a href="#" id="subjectUpdate">수정</a>
				</div>
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">세부 내용</label>
					<div class="col-md-7">
						<textarea class="form-control" style="resize: none;" rows="4" id="debateContent"
						name="debateContent" readonly="readonly">${professorDebate.debateContent }</textarea>
					</div>
					<a href="#" id="contentUpdate">수정</a>
				</div>
				<%-- ${professorDebate.debateCode } --%>
				
				<div class="form-group">
					<label class="col-md-4 control-label">등록일</label>
						<div class="col-md-4">
							<p class="form-control-static">${professorDebate.debateRegisterDate }</p>
						</div>
				</div>
				
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="debateUpdateBtn" class="btn btn-default" value="수정하기">
					</div>
				</div>
			</form>
			</c:if>
			
			
				<!-- 등록된 토론이 없을때의 토론 등록 form(insertForm) -->
 			
			<c:if test="${professorDebate.debateCode == null}">
			<form id="debateInsertForm"
				action="/professorDebateInsert" class="form-horizontal"
				method="post">
			
			<input type = "hidden" name="openSubjectCode" value="${openSubjectCode }">
			
				
				<div class="form-group">
					<label class="col-md-4 control-label">토론 주제</label>
					<div class="col-md-4">
						<input name="debateSubject" type="text" class="form-control input-md"
							placeholder="토론주제 입력">
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">세부 내용</label>
					<div class="col-md-7">
						<textarea class="form-control" style="resize: none;" rows="4" name="debateContent" placeholder="토론내용 입력."></textarea>
					</div>
				</div>
				
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="debateInsertBtn" class="btn btn-default" value="등록하기">
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