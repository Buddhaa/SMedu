<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#replyBtn").click(function() {
			$("#objectionReplyForm").submit();
			
		});
	});

</script>
<title>시커먼스</title>
</head>
<body>
	<div class="wrapper row3">
	<div class="hoc container clear">
		<div class="content three_quarter">
			<form id="objectionReplyForm" action="/professorStudentObjectionReply"
					class="form-horizontal" method="post">		
				
				<input type="hidden" name="objectionCode" value="${professorStudentObjection.objectionCode }">
				<fieldset>
					<legend>이의신청 답변</legend>
					
						<div class="form-group">
							<label class="col-md-4 control-label">제목</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorStudentObjection.objectionTitle }</p>
							</div>
						</div>
						
						<hr/>
						
						<div class="form-group">
							<label class="col-md-4 control-label">내용</label>
							<div class="col-md-4">
								<textarea class="form-control" style="resize: none;" rows="20"
									cols="40" name="objectionReply">${professorStudentObjection.objectionContent } 

=============== 이의신청일 : ${professorStudentObjection.objectionDate } ===============

답변 내용
								</textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-4">
								<input type="button" id="replyBtn" class="btn btn-default" value="답변하기">
							</div>
						</div>
				</fieldset>
			</form>
		</div>
	</div>
	</div>
</body>
</html>