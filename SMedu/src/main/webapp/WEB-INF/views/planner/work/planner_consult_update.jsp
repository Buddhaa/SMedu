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
			location.href = "/planner/work/planner_consult_list";
			});
			$('#consultUpdate').click(function(){ //[수정] 클릭시
			    if($('#planContent').val() == "") {
			    	alert('상담내용을 입력하세요');
			    	$('#planContent').focus();
			    } else if($('#specialNote').val() == "") {
			    	alert('특이사항을 입력하세요');
			    	$('#specialNote').focus(); 
			    } else if($('#planDate').val() == "") {
			    	alert('상담일자를 선택하세요');
			    	$('#planDate').focus(); 
			    } else {
			    	$('#consultUpdateForm').submit();
			    }
			});
	});

</script>
</head>
<body>
					<!-- 상담내역 수정하기 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter">
    	
				<form action ="/planner/work/planner_consult_update" id="consultUpdateForm" class="form-horizontal" method="post">
					<input type="hidden" name="planCode" value="${consultUpdate.planCode}">
					<input type="hidden" name="plannerStudentCode" value="${consultUpdate.plannerStudentCode}">
			
					<fieldset>
						<legend>상담내역 수정하기</legend>
						
						<div class="form-group">
							<label class="col-md-4 control-label">담당학생이름</label>
							<div class="col-md-4">
								<p class="form-control-static">${consultUpdate.userName}</p>
							</div>
						</div>
					
										
						<div class="form-group">
							<label class="col-md-4 control-label">상담내용</label>
							<div class="col-md-4">
								<textarea rows="5" cols="30" name="planContent" id="planContent" class="form-control input-md"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">특이사항</label>
							<div class="col-md-4">
								<input name="specialNote" id="specialNote" type="text"  class="form-control input-md">
							</div>
						</div>

 						<div class="form-group">
							<label class="col-md-4 control-label">상담일자</label>
							<div class="col-md-4">
								<input name="planDate" id="planDate" type="date"  class="form-control input-md">
							</div>
						</div>
					
						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="signup_recruiter"></label>
							<div class="col-md-4">
								<input type="button" id="returnBtn" class="btn btn-default" value="이전">
								<input type="button" id="consultUpdate" class="btn btn-default" value="수정하기">
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