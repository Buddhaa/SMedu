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
<!-- 상담기록 리스트 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>학습설계 미답변 목록</h1><hr/>
	<form action="/planner/work/planner_learningplan_nonresponse"
	method="post" name="nonresponseForm" id="nonresponseForm">
	<table class="table table-bordered">
		<thead>
				<tr>
					<td>신청자이름</td>
					<td>신청자연락처</td>
					<td>문의내용</td>
					<td>문의일자</td>
					<td>학습설계완료여부</td>
				</tr>
			<c:forEach var="n" items="${nonresponseList}">
				<tr>
				    <td><a href="/planner/work/planner_learningplan_response_insert?learningPlanCode="${n.learningPlanCode}">${n.applicantName}</a></td>
				    <td>${n.applicantPhone}</td>
				    <td>${n.inquireContent}</td>
				    <td>${n.inquireDate}</td>
				    <td>${n.consultCompleteConfirmation}</td> 
				</tr>
			</c:forEach>	
		</thead>
	</table>
	</form>
	<ul class="pager">
	     <li><a href="/smedu/main/main">이전</a></li>
	     <li><a href="/planner/work/planner_learningplan_response">답변목록 이동</a></li>
 	 </ul>
	</div>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>