<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
							<!-- 상담기록 리스트 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>상담기록 목록</h1><hr/>
	<form action="/planner/work/planner_consult_list"
	method="post" name="consultListForm" id="consultListForm">
	<table class="table table-bordered">
		<thead>
				<tr>
					<td>담당학생이름</td>
					<td>상담내용</td>
					<td>특이사항</td>
					<td>상담일자</td>
				</tr>
			<c:forEach var="c" items="${consultList}">
				<tr>
				    <td>${c.plannerStudentCode}</td>
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
		    <li><a href="/planner/work/planner_consult_insert">상담입력</a></li>
	</ul>
		  		
		</div>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
	
</body>
</html>