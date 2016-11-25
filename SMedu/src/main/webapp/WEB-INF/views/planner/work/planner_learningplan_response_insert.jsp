<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		$("#returnBtn").click(function() { //뒤로가기
			location.href = "/planner/work/planner_learningplan_nonresponse"; 
		});
			$('#responseInsert').click(function(){ //[등록] 클릭시
			    if($('#inquireReplyContent').val() == "") {
			    	alert('답변을 입력하세요');
			    	$('#inquireReplyContent').focus();
			    } else if($('#inquireReplyDate').val() == "") {
			    	alert('답변일자를 선택하세요');
			    	$('#inquireReplyDate').focus(); 			
			    } else {
			    	$('#responseInsertForm').submit();
			    	
			    }
			});
	});

</script>
</head>
<body>
					<!-- 학습설계 답변 등록 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter">    				
				<form action = "/planner/work/planner_learningplan_response_insert" id="responseInsertForm" class="form-horizontal" method="post">
					<input type="hidden" name="learningPlanCode" value="${responseInsert.learningPlanCode}">
					<fieldset>
						<legend>학습설계 답변 등록</legend>
						
						<div class="form-group">
							<label class="col-md-4 control-label">신청자이름</label>
							<div class="col-md-4">
								<p class="form-control-static">${responseInsert.applicantName}</p>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-4 control-label">신청자연락처</label>
							<div class="col-md-4">
								<p class="form-control-static">${responseInsert.applicantPhone}</p>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-4 control-label">학과</label>
							<div class="col-md-4">
								<p class="form-control-static">${responseInsert.departmentName}</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">문의내용</label>
							<div class="col-md-4">
								<p class="form-control-static">${responseInsert.inquireContent}</p>
							</div>
						</div>
					
						
						<div class="form-group">
							<label class="col-md-4 control-label">답변내용</label>
							<div class="col-md-4">
								<input name="inquireReplyContent" id="inquireReplyContent" type="text"  class="form-control input-md">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">답변일자</label>
							<div class="col-md-4">
								<input name="inquireReplyDate" id="inquireReplyDate" type="date"  class="form-control input-md">
							</div>
						</div>

					
						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="signup_recruiter"></label>
							<div class="col-md-4">
								<input type="button" id="returnBtn" class="btn btn-info" value="이전">
								<input type="button" id="responseInsert" class="btn btn-success" value="등록">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>