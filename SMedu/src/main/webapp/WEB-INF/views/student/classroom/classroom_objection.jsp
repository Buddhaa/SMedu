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
<script>
	$(document).ready(function(){		
		$("#objectionInsertFormBtn").click(function(){		
		
			location.href='/objectionInsert'
			
		});		
	});
</script>
<title>시커먼스</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
			<div class="content three_quarter">
				<fieldset>
				<h1>이의신청</h1>			
				</fieldset>
				<table class="table">
				    <thead>
				      <tr>
				        <th>개설 과목명</th>
				        <th>이의신청 종류</th>
				        <th>제목</th>
				        <th>작성일자</th>
				        <th>답변여부</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="oneObjectionList" items="${oneObjectionView}" varStatus="status">
				    	  <c:set value="${oneObjectionList.openSubjectCode}" var="openSubjectCode"/>
					      <tr>
					        <td>${oneObjectionList.subjectName}</td>
					        <td>${oneObjectionList.objectionType}</td>
					        <td><a href="/objectionDetail?objectionCode=${oneObjectionList.objectionCode}">${oneObjectionList.objectionTitle}</a></td>
					        <td>${oneObjectionList.objectionDate}</td>
					        <c:if test="${oneObjectionList.objectionReplyDate == null}">
					        	<td>미답변</td>
					        </c:if>
					        <c:if test="${oneObjectionList.objectionReplyDate != null}">
					        	<td>답변완료</td>
					        </c:if>
					      </tr>
				      	</c:forEach>
				    </tbody>
				</table>
				<button type="button" class="btn btn-default" id="objectionInsertFormBtn" >이의신청 글쓰기</button>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>