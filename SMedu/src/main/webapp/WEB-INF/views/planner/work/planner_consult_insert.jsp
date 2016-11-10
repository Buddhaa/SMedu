<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	var page = "/planner/work/planner_consult_list";
	$(document).ready(function() {
		if($("#planContent").val() == "") {
			$("#planContent").focus();
		} else if("#specialNote") {
			 $("#specialNote").focus();
		} else {
			alert("ok")
		}
		
		$('#consultInsert').click(function() {
			$('#consultInsertForm').submit();
			$(location).attr('href',page);
	});
});

</script>
</head>
<body class="container">
								<!-- 상담입력 -->
	<div>
	<h2>상담입력</h2>
	<form action="/planner/work/planner_consult_list" 
		 method="post" name="consultInsertForm" id="consultInsertForm">
	
	<input type="hidden" id="srcPlanCode" name="srcPlanCode" value="${srcPlanCode}">
		<table class="table table-bordered">
			<tr>
				<td>담당학생이름</td>
				<td><input type="text" id="plannerStudentCode" name="plannerStudentCode" value="${plannerStudentCode}"></td>
			</tr>
			<tr>
				<td>상담내용</td>
				<td><input type="text" id="planContent" name="planContent" value="${planContent}"></td>
			</tr>
			<tr>
				<td>특이사항</td>
				<td><input type="text" id="specialNote" name="specialNote" value="${specialNote}"></td>
			</tr>
			<tr>
				<td>상담일자</td>
				<td><input type="date" id="planDate" name="planDate"  value="${planDate}"></td>
			</tr>
			<tr>
				<td colspan="2"><input id="consultInsert" type="button"  value="상담입력" ></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>