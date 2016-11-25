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
<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter"> 
	<h1>학습설계 답변완료 목록</h1><hr/>
	<form action="planner/work/planner_learningplan_response"
	method="post" name="responseForm" id="responseForm">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>이름</th>
				<th>연락처</th>
				<th>학과</th>
				<th>문의내용</th>
				<th>문의일자</th>
				<th>답변내용</th>
				<th>답변일자</th>
<!-- 				<th>답변여부</th> -->
			</tr>
			
		<c:forEach var="r" items="${responseList}">
			<tr>
					<td>${r.applicantName}</td>
				    <td>${r.applicantPhone}</td>
				    <td>${r.departmentName}</td>
				    <td>${r.inquireContent}</td>
					<td>${r.inquireDate}</td>
				    <td>${r.inquireReplyContent}</td>
				    <td>${r.inquireReplyDate}</td>
<%-- 				    <td>${r.consultCompleteConfirmation}</td>  --%>
				    
			</tr>
		</c:forEach>
	</table>
	</form>
	<ul class="pager">
	    <li><a href="/planner/work/planner_learningplan_nonresponse">이전</a></li> 
 	 </ul>
 	 </div>
 	 </div>
 </div>
 	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>