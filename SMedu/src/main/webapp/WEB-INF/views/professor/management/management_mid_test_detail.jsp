<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />
	<div class="hoc container clear">
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
		<div class="content three_quarter">
		
		<c:forEach var="ExamQuestion" items="${midExamQuestion }">
					<img src="../../../resources/examQuestion/${ExamQuestion.examOriginFileName }">
		</c:forEach>
	
	</div>
</div>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />

</body>
</html>