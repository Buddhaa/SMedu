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
		$("#lectureReviewFormBtn").click(function(){
			
			location.href='/lectureReviewAddFrom'
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
				<h1>수강후기</h1>		
				</fieldset>
				<table>
					<thead>
				      <tr>
				        <th>NO</th>
				        <th>수강후기글</th>
				        <th>작성자</th>
				        <th>게시일자</th>
				      </tr>
				    </thead>
					<tbody>				
					<c:forEach var="LectureReview" items="${LectureReview}" varStatus="status"> 
						<tr>
					    	<td>${status.count}</td>
					        <td><a href="/lectureReviewUpdate?boardArticleCode=${LectureReview.boardArticleCode}">${LectureReview.boardArticleTitle}</a></td>
					        <td>${LectureReview.boardArticleWriter}</td>
					        <td>${LectureReview.boardArticleDate}</td>
						</tr>			
					</c:forEach>
					</tbody>			
				</table>	
				<button type="button" class="btn btn-default" id="lectureReviewFormBtn" >수강평입력</button>			
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>