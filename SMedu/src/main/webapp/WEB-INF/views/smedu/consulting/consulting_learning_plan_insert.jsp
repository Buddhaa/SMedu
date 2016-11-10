<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../module/top.jsp" />

<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="../module/consulting_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>맞춤학습설계</h1><hr>
	  		<form action="">
		  		<table class="table">
					<tr>
						<td>이름</td>
						<td>
							<input name="applicantName" type="text" class="form-control input-md">
						</td>
						<td>전화번호</td>
						<td>
							<input name="applicantPhone" type="text" class="form-control input-md">
						</td>
					</tr>
					<tr>
						<td>학과</td>
						<td colspan="3">
							<select class="form-control" name="departmentCode">
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
						<textarea class="form-control" rows="10" name="inquireContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							 <button class="btn btn-default" id="#">신청하기</button>
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