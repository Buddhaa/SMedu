<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />
<!-- 학습설계 답변완료 목록 -->
<div>
	<h2>학습설계 답변완료 목록</h2>
	<form action="/planner/work/planner_learningplan_response"
	method="post" name="responseForm" id="responseForm">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td>신청자이름</td>
				<td>신청자연락처</td>
				<td>문의내용</td>
				<td>문의일자</td>
				<td>답변내용</td>
				<td>답변일자</td>
				<td>학습설계완료여부</td>
			</tr>
			
		<c:forEach var="r" items="${responseList}">
			<tr>
					<td>${r.applicantName}</td>
				    <td>${r.applicantPhone}</td>
				    <td>${r.inquireContent}</td>
				    <td>${r.inquireDate}</td>
				    <td>${r.inquireReplyContent}</td>
				    <td>${r.inquireReplyDate}</td>
				    <td>${r.consultCompleteConfirmation}</td> 
				    <td></td>
			</tr>
		</c:forEach>
	</table>
	</form>
	<ul class="pager">
	    <li><a href="/planner/work/planner_learningplan_nonresponse">이전</a></li> 
 	 </ul>
 	 </div>
</body>
</html>