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
<title>시커먼스</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/main_sidebar.jsp" />
			<div class="content three_quarter">
		<fieldset>
		<legend>나의상담내역</legend>
			<label>제목:</label>
      		<input type="text" class="form-control" value="${consultingHistoryDetail.boardArticleTitle}" readonly="readonly">
			<label>내용:</label>
   			<textarea class="form-control" rows="15" readonly="readonly">${consultingHistoryDetail.boardArticleContent}</textarea>
			<hr/>
			<label>답변:</label>
   			<textarea class="form-control" rows="15" readonly="readonly">${consultingHistoryDetail.commentContent}</textarea>
   			<div style="text-align: right;">
				${consultingHistoryDetail.userName}
				${consultingHistoryDetail.commentDate}
			</div>			
		</fieldset>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>