<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
						<!-- 학습설계 미답변 목록 -->
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
					<th>이름</th>
					<th>연락처</th>
					<th>학과</th>
					<th>문의내용</th>
					<th>문의일자</th>
					<th>답변여부</th>
				</tr>
			<c:forEach var="n" items="${nonresponseList}">
				<tr>
				    <td><a href="/planner/work/planner_learningplan_response_insert?learningPlanCode=${n.learningPlanCode}">${n.applicantName}</a></td>
				    <td>${n.applicantPhone}</td>
				    <td>${n.departmentName}</td>			   
				    <td>${n.inquireContent}</td>
				    <td>${n.inquireDate}</td>
				    <td>${n.consultCompleteConfirmation}</td> 
				</tr>
			</c:forEach>	
		</thead>
	</table>
	</form>
	<ul class="pager">
	     <li><a href="/smedu/main/main" >이전</a></li>
	     <li><a href="/planner/work/planner_learningplan_response">답변완료 목록</a></li>
 	 </ul>
	</div>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>