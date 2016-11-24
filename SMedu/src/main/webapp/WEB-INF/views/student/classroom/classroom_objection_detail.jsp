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
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
			<div class="content three_quarter">
				    <div class="form-group">
				      <label for="usr">제목:</label>
				      <input type="text" class="form-control"  value="${objectionList.objectionTitle}" readonly="readonly">
				      
				      <label for="usr">이의신청 분류:</label>
				      <input type="text" class="form-control"  value="${objectionList.objectionType}" readonly="readonly">
				 
				      <label for="comment">내용:</label>
				      <textarea class="form-control" rows="15" readonly="readonly">${objectionList.objectionContent}</textarea>
				      <span>문의일자 : ${objectionList.objectionDate}</span>
				 
				      <c:if test="${objectionList.objectionReply != null}">				      
					      <hr/>
					      <label for="usr">답변:</label>
					      <textarea class="form-control" rows="15" readonly="readonly">${objectionList.objectionReply}</textarea>
					      <span>답변일자 : ${objectionList.objectionReplyDate}</span>
				      </c:if>
				    </div>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>