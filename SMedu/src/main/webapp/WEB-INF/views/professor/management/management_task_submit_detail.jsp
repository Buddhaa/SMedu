<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

	/* vallidation code... */
	
	$(document).ready(function () {
		$('#markingBtn').click(function () {
			if(isNaN($('#taskScore').val())) {
				console.log("문자");
				alert("0~15의 숫자(점수)를 입력하세요.");
				$('#taskScore').focus();
			}else if($('#taskScore').val() < 0 || $('#taskScore').val() > 15) {
				console.log("0~15외의 숫자");
				alert("0~15의 숫자(점수)를 입력하세요.");
				$('#taskScore').focus();
			}else if($('#taskScore').val() == "") {
				console.log("공백");
				alert("0~15의 숫자(점수)를 입력하세요.");
				$('#taskScore').focus();
			}else {
				$('#taskMarkingForm').submit();
			}
		});
	});

</script>
<title>시커먼스</title>
</head>
<body>
	<div class="hoc container clear">
		<div class="content three_quarter">
			<form id="taskMarkingForm" action="/professorTaskMarking" class="form-horizontal" method="post">

				<div class="form-group">
					<label class="col-md-4 control-label">과제 주제</label>
					<div class="col-md-4">
						<p class="form-control-static">${professorStudentTaskResult.taskSubject }</p>
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-md-4 control-label">제목</label>
					<div class="col-md-4">
						<input type="text" value="${professorStudentTaskResult.taskResultTitle }"
							readonly="readonly" class="form-control input-md">
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-md-4 control-label">내용</label>
					<div class="col-md-4">
						<textarea class="form-control" style="resize: none;" rows="20"
							cols="40">${professorStudentTaskResult.taskResultContent }</textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label">첨부파일</label>
					<c:if test="${professorStudentTaskResult.taskFileName != null }">
						<a href="/fileDownload?fileName=${professorStudentTaskResult.taskOriginFileName }">${professorStudentTaskResult.taskOriginFileName }(${professorStudentTaskResult.taskFileSize }kb)</a>
					</c:if>
				</div>

				<hr />

				<div class="form-group">
					<div class="col-md-4">
						<p class="form-control-static">
							<strong>과제 제출일</strong>
							${professorStudentTaskResult.taskResultDate }
						</p>
					</div>
				</div>
				
				<hr/>
				
				<!-- Hidden -->
				<input type="hidden" name="openSubjectCode" value="${param.openSubjectCode }">
				<input type="hidden" name="studentCode" value="${param.studentCode }">
				
			<c:if test="${TaskScoreAndCode.taskScoreCode == null }">
				<div class="form-group">
					
					<!-- 채점 Input Box -->
					<div class="col-xs-3">
						<input type="text" name="taskScore" id="taskScore" class="form-control" placeholder="점수 입력">
					</div>
					
					<!-- Button -->
					<input type="button" id="markingBtn" class="btn btn-default" value="채점하기">
					<small>0~15점의 점수를 입력</small>
				</div>
			</c:if>
			
			<c:if test="${TaskScoreAndCode.taskScoreCode != null }">
				<div class="form-group">
					
					<!-- 채점 Input Box -->
					<div class="col-xs-3">
						<input type="text" name="taskScore" id="taskScore" class="form-control" 
						value="${TaskScoreAndCode.taskScore }" readonly="readonly">
					</div>
				</div>
			</c:if>
			</form>
		</div>
	</div>
</body>
</html>