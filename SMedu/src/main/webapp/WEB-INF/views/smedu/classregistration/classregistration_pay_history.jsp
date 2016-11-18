<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<jsp:include page="../module/classregistration_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>결제 이력</h1><hr>
		  <table class="table">
				<tr>
					<td>강의명</td>
					<td>수강료</td>
					<td>수강신청날짜</td>
					<td>결제상태</td>
				</tr>
		  <c:forEach var="payHistoryList" items="${payHistoryList}">
		  		<tr>
					<td>${payHistoryList.subjectName}</td>
					<td>${payHistoryList.classRegistrationAmount}</td>
					<td>${payHistoryList.classRegistrationDate}</td>
					<c:if test="${payHistoryList.payState == 'T'}">
					<td>결제완료</td>
					</c:if>
					<c:if test="${payHistoryList.payState == 'F'}">
					<td>결제대기</td>
					</c:if>
				</tr>
		  </c:forEach>
			</table>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>
