<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
			<div class="content three_quarter">
				<fieldset>
				<h1>나의 수강후기</h1>			
				</fieldset>
				<div style="margin-top: 3%">
					<input type="text" class="form-control" value="${lectureReviewBoard.boardArticleTitle}" readonly="readonly">
				</div>
				<div style="margin-top: 3%">
					<textarea class="form-control" rows="8" readonly="readonly">${lectureReviewBoard.boardArticleTitle}</textarea>
				</div>
				<div>
					작성일자 : ${lectureReviewBoard.boardArticleDate}
				</div>
			</div>				
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>