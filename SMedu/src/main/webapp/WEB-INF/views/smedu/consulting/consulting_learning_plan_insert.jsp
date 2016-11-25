<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
      $("#consultingLearningPlanBtn").click(function(){
		if($("#applicantName").val() == "" || !(isNaN($("#applicantName").val()))) {
  			alert("이름을 입력하세요")
  		}  
    	else if($("#applicantPhone").val() == "" || (isNaN($("#applicantPhone").val()))) {
    		alert("전화번호를 입력하세요")
  		} 
    	else if($("#departmentCode").val() == "") {
    		alert("학과를 선택하세요")
  		} 
		else if($("#inquireContent").val() == "") {
			alert("문의내용을 입력하세요")
		} 
		else {
			$("#consultingLearningPlanForm").submit();
		}
	});
	
});
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../module/top.jsp" />

<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="../module/consulting_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>맞춤학습설계</h1><hr>
		  	<div align="center">
		  	<img alt="" src="/resources/smedu/images/demo/backgrounds/consulting_learning_plan1.gif" >
		  	<img alt="" src="/resources/smedu/images/demo/backgrounds/consulting_learning_plan2.gif" >
		  	<img alt="" src="/resources/smedu/images/demo/backgrounds/consulting_learning_plan3.gif" >
		  	<img alt="" src="/resources/smedu/images/demo/backgrounds/consulting_learning_plan4.gif" >
	  		</div>
	  		<br>
	  		<form id="consultingLearningPlanForm" action="/smedu/consulting/consultingLearningPlanInsert" method="post">
		  		<table class="table">
					<tr>
						<td>이름</td>
						<td>
							<input id="applicantName" name="applicantName" type="text" class="form-control input-md">
						</td>
						<td>전화번호</td>
						<td>
							<input id="applicantPhone" name="applicantPhone" type="text" class="form-control input-md">
						</td>
					</tr>
					<tr>
						<td>학과</td>
						<td colspan="3">
							<select class="form-control" name="departmentCode" id="departmentCode">
						    	<option value="">==선택==</option>
						    	<c:forEach var="department" items="${departmentList}"> 
						 			<option value="${department.departmentCode}">${department.departmentName}</option>
						 		</c:forEach>
			   				</select>
						</td>
					</tr>
					<tr>
						<td>문의내용</td>
						<td colspan="3">
						<textarea class="form-control" rows="10" name="inquireContent" id="inquireContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							 <input type="button" class="btn btn-default" id="consultingLearningPlanBtn" value="신청하기">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>