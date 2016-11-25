<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		$("#userName").val()
		
		$("#returnBtn").click(function() { //뒤로가기
			location.href = "/planner/work/planner_consult_list";
			});
		
			$('#consultInsert').click(function(){ //[등록] 클릭시
			    if($('#userName').val() == "") {
			    	alert('담당학생을 선택하세요');
			    	$('#userName').focus();
			    } else if($('#planContent').val() == "") {
			    	alert('상담내용을 입력하세요');
			    	$('#planContent').focus(); 		
			    } else if($('#specialNote').val() == "") {
			    	alert('특이사항을 입력하세요');
			    	$('#specialNote').focus(); 	
			    } else if($('#planDate').val() == "") {
			    	alert('상담일자를 선택하세요');
			    	$('#planDate').focus(); 	
			    } else {
			    	$('#consultInsertForm').submit();
			    }
			});
			
			$('#searchPopUp').click(function () {
				window.open('/studentSearchView','userSearchPopUp','left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')
			});
	});

</script>
</head>
<body>
										<!-- 상담 등록 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter">

				<form action="/planner/work/planner_consult_list"  
					id="consultInsertForm" class="form-horizontal" method="post">
				
			
					<input type="hidden" name="plannerStudentCode" id="plannerStudentCode" value="${consultStudent.plannerStudentCode}"> 
					<fieldset>
						<legend>상담 등록</legend>
						
						<div class="form-group">
							<label class="col-md-4 control-label">담당학생이름</label>
							 <div class="col-md-4">
								<input type="text" name="userName" id="userName" class="form-control input-md" readonly="readonly">
							</div>
							
							<input type="button"  id="searchPopUp"  class="btn btn-primary" value="검색"> 
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
								<input type="button" id="consultInsert" class="btn btn-default" value="등록">
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