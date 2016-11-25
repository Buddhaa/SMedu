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
							<!-- 상담 목록 (플래너가 연락) -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>상담내역</h1><hr/>
	<form action="/planner/work/planner_consult_list" 
	method="post" name="consultListForm" id="consultListForm">
	<table class="table table-bordered">
		<thead>
				<tr>
					<th>담당학생이름</th>
					<th>상담내용</th>
					<th>특이사항</th>
					<th>상담일자</th>
				</tr>
			<c:forEach var="c" items="${consultList}">
				<tr>
					<td><a href="/planner/work/planner_consult_update?planCode=${c.planCode}">${c.userName}</a></td>
				    <td>${c.planContent}</td>
				    <td>${c.specialNote}</td>
				    <td>${c.planDate}</td> 
				</tr>
			</c:forEach>
		</thead>
	</table>
	</form>
	<ul class="pager">
		    <li><a href="/smedu/main/main">이전</a></li>
		    <li><a href="/planner/work/planner_consult_insert">상담등록</a></li>
	</ul>	  		
	</div>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
	
</body>
</html>