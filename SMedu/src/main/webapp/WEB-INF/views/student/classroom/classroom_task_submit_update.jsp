<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>
	$(document).ready(function(){
		
		$("#taskResultUpdateAdd").click(function(){
			$("#taskResultUpdateForm").submit();	
		});
		
		$("#taskResultUpdateCancel").click(function(){
			location.replace('/classroomTaskJoin');
		});		
	});
</script>
<title>시커먼스</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
			<div class="content three_quarter">
				<fieldset>
				<h1>과제수정</h1>
					<form id="taskResultUpdateForm" action="/taskResultUpdate" enctype="multipart/form-data" method="post">
						<input type="hidden" value="${taskSubmitUpdateDetail.taskResultCode}" name="taskResultCode">						
						<input type="hidden" value="${taskSubmitUpdateDetail.taskOriginFileName}" name="taskOriginFileName">						
						<div class="form-group">
							<label for="usr">제목:</label>
							<input type="text" class="form-control" value="${taskSubmitUpdateDetail.taskResultTitle}" name="taskResultTitle">
						</div>
						
						<div class="form-group">
							<label for="usr">내용:</label>
							<textarea class="form-control" rows="15" name="taskResultContent">${taskSubmitUpdateDetail.taskResultContent}</textarea>
						</div>
						
						<input type="hidden" value="${taskSubmitUpdateDetail.taskFileName}" name="taskFileName">
						<input type="hidden" value="${taskSubmitUpdateDetail.taskFileExt}" name="taskFileExt">
						<div>
							<input type="file" name="taskFile">
							<span>제출된 파일 : ${taskSubmitUpdateDetail.taskOriginFileName}</span>
						</div>
					</form>
					<button type="button" id="taskResultUpdateAdd" class="btn btn-primary btn-lg btn-block">과제 수정하기</button>	
					<button type="button" id="taskResultUpdateCancel" class="btn btn-primary btn-lg btn-block">취소</button>	
				</fieldset>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>