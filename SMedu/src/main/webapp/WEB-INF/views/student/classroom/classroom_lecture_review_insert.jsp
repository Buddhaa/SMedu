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
		$("#lectureReviewAddBtn").click(function(){
			if($("#boardArticleTitle").val() == ""){
				alert("제목을 입력하세요")
			}else if($("#boardArticleContent").val() == ""){
				alert("내용을 입력하세요")
			}else{
				$("#lectureReviewAddForm").submit();
			}
		});		
		$("#lectureReviewCancelBtn").click(function(){
			location.replace('/classroomLectureReview');
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
				 <form id="lectureReviewAddForm" action="/lectureReviewAdd" method=POST>
				 <div class="form-group">
		    			<label>제목:</label>
				    	<input type="text" class="form-control" id="boardArticleTitle" name="boardArticleTitle">
				    </div>
				    <div class="form-group">
				    	<label>내용:</label>
				    	<textarea class="form-control" rows="15" id="boardArticleContent" name="boardArticleContent"></textarea>
				    </div>
				  </form>
				  <button type="button" class="btn btn-primary btn-block" id="lectureReviewAddBtn">등    록</button>
				  <button type="button" class="btn btn-primary btn-block" id="lectureReviewCancelBtn">취    소</button>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>