<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$("#payMethod").change(function(){
			
		});
	});
</script>
</head>
<body>
	<table class="table">
		<tr>
			<td>은행:</td>
			<td> 
			<select class="form-control" id="bank">
			  	 	<option value="">==선택==</option>
			  	 	<option value="">신한은행</option>
			  	 	<option value="">농협은행</option>
			  	 	<option value="">국민은행</option>
			  	 	<option value="">하나은행</option>
			  	 	<option value="">우리은행</option>
			  	 	<option value="">IBK기업은행</option>
			   	 </select>
			</td>
		</tr>
		<tr>
			<td>결제방법:</td>
			<td> 
				<select class="form-control" id="payMethod" name="payMethod">
			  	 	<option value="">==선택==</option>
			  	 	<option value="신용카드">신용카드</option>
			  	 	<option value="무통장">무통장</option>
			  	 	<option value="핸드폰결제">핸드폰결제</option>
			  	 	<option value="실시간계좌이체">실시간계좌이체</option>
			   	 </select>
			</td>
		</tr>
	</table>
	<div style="height:80px; width:600px; border:solid;">
	   			<h3 align="center">
	   			총금액:<span id="totalPay">0</span>원
	   			</h3>
	</div><br>
	<table id="card">
		
	</table>
</body>
</html>