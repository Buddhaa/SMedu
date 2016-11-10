<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	function consultUpdate(){
		consultUpdate.submit();
	}
</script>
</head>
<body>
							<!-- 상담기록 수정 -->
<form action="/planner/work/planner_consult_update.jsp" 
		method="post" name="consultUpdate" id="consultUpdate">

<input type="hidden" name="planCode" value="${planCode}">
<table>
	<tr align="center" valign="middle">
		<td colspan="5">상담기록관리</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">상담내용</div>
		</td>
		<td><input type="text" name="planContent" value="${planContent}"></td>
	</tr>
	
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">특이사항</div>
		</td>
		<td><input type="text" name="specialNote" value="${specialNote}"></td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="javascript:consultUpdate()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
</body>
</html>