<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

	var page = "/planner/work/planner_learningplan_response";
	$(document).ready(function(){
		$('#responseInsert').click(function(){
			$('#responseInsertForm').submit();
			$(location).attr('href',page);
	});
});
// 	var page = "/planner/work/planner_learningplan_response";
// 	function checkSubmit() {
// 		alert("submit 클릭!");
// 		$(location).attr('href',page);
// 	}

</script>
</head>
<body>
					<!-- 학습설계 답변 입력 -->
<div>
<h2>학습설계 답변 입력</h2>
<form action="/planner/work/planner_learningplan_response_insert" onsubmit="return checkSubmit()"
	method="post" name="responseInsertForm" id="responseInsertForm">
	
	<table class="table table-bordered">	
			
		<tr>
			<td>신청자이름</td>
			<td><input type="text" name="applicantName"  value="${learningPlan.applicantName}"></td> 
		</tr>	
		
		<tr>
			<td>신청자연락처</td>
			<td><input type="text" name="applicantPhone" value="${learningPlan.applicantPhone}"></td>

		</tr>	
		
		<tr>
			<td>문의내용</td>
			<td><input type="text" name="inquireContent"  value="${learningPlan.inquireContent}"></td>
		</tr>
			
		<tr>
			<td>답변내용</td>
			<td><input type="text" name="inquireReplyContent"></td>
		</tr>
		<tr>
			<td>답변일자</td>
			<td><input type="date" name="inquireReplyDate"></td>
		</tr>
		<tr>
			<td>학습설계완료여부</td>
			<td><input type="text" name="consultCompleteConfirmation"></td>
		</tr>
		
		<tr>
			<td colspan="2">
<!-- 		<input id="responseInsert" type="button"  value="학습설계 답변등록" > -->
<!-- 		<input type="button" value="학습설계 답변등록" onClick="location.href='/planner/work/planner_learningplan_response';"> -->
			<input type="submit" value="학습설계 답변등록" onClick="location.href='/planner/work/planner_learningplan_response';">
		</td>
		</tr>
	</table>
</form>
	<ul class="pager">
	     <li><a href="/smedu/main/main">이전</a></li>
 	 </ul>
</div>
</body>
</html>