<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	 
	 $("#paySubjectDeleteBtn").click(function(){
		 var check = $(".check");
			//체크값 확인 변수 
			var sum = 0;
			//반복문을 통해 check크기만큼 반복 
			for (var i = 0; i < check.length; i++) {
				//만약 check중 하나라도 체크가 되어있지 않으면 
				if (check[i].checked == true) {
					sum += 1;
				}
			}
/* 			console.log(sum);
			console.log(check.length); */
			if (sum != 0) {
				$("#paySubjectDeleteForm").submit();
			}
	 });
	
	
	$(".check").click(function(){
		var idx = $(this).index();
		var totalPay = Number($('#totalPay').text());
		var totalCredit = Number($('#totalCredit').text());
		var thisPay = Number($('.pay').eq(idx).text());
		var thisCredit = Number($('.credit').eq(idx).text());
		
		if($(this).is(':checked')){
			 $('#totalPay').text(totalPay+thisPay);
			 $('#totalCredit').text(totalCredit+thisCredit);
		 }else{
			 $('#totalPay').text(totalPay-thisPay); 
			 $('#totalCredit').text(totalCredit-thisCredit);
		 }
	 });
});
</script>
</head>
<body>
<jsp:include page="../module/top.jsp" />

<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="../module/classregistration_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>신청/결제</h1><hr>
			<table class="table">
				<tr>
					<td></td>
					<td>구분</td>
					<td>과목명</td>
					<td>학점</td>
					<td>수강료</td>
					<td>수강신청날짜</td>
					<td>결제상태</td>
				</tr>
		  <form id="paySubjectDeleteForm" class="form-horizontal" action="/smedu/classregistration/classregistrationPaySubjectDelete" method="post">
		  <c:forEach var="payHistoryList" items="${payHistoryList}">
		  		<tr>
		  			<td>
		  				<input type="checkbox" class="check" name="classRegistrationCode" value="${payHistoryList.classRegistrationCode}">
		  			
		  			</td>
					<td>${payHistoryList.subjectSort}</td>
					<td>${payHistoryList.subjectName}</td>
					<td class="credit">${payHistoryList.subjectCredit}</td>
					<td class="pay">${payHistoryList.classRegistrationAmount}</td>
					<td>${payHistoryList.classRegistrationDate}</td>
					<td>${payHistoryList.payState}</td>
				</tr>
		  </c:forEach>
		  </form>
		  
			<tr>
				<td colspan="7"><input type="button" id="paySubjectDeleteBtn" value="수강과목삭제" class="btn btn-default">	</td>
			</tr>
			
			</table>
			<div style="height:80px; width:730px; border:solid;">
	   			<h3 align="center">
	   			이수학점:<span id="totalCredit">0</span>&nbsp;
	   			총금액:<span id="totalPay">0</span>원
	   			</h3>
	   		</div><br>
	   		
	   		<div class="fl_right">
	   			<a href="#"
				onclick="javascript:window.open('/smedu/classregistration/classregistrationPaySubjectMethod?classRegistrationCode=', 'subjectCode', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')">
				<input type="button" value="결제" class="btn btn-default" style="width: 150px; height: 50px;">
				</a>
	   		</div>
			
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>
