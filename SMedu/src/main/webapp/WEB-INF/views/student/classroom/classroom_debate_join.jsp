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
		
		$("#openSubject").val("${selectbox}");
		
		$("#openSubject").change(function(){
			var openSubjectCode = $("#openSubject").val();
			location.replace('classroomDebateJoin?openSubjectCode=' + openSubjectCode);
		});
		
		$("#debateResultAddBtn").click(function(){
			if($("#debateComment").val() == ""){
				alert("토론등록시에는 내용이 있어야 합니다.");
			}else{
				$("#debateResultAddForm").submit();
			}
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
				<h1>토론 참여</h1>					
				<div class="col-md-5" style="padding-left:0;">
					<label>과목선택</label>
					<select class="form-control" id="openSubject">
						<c:forEach var="openSubjectSelect" items="${openSubjectSelect}" varStatus="status">
							<c:if test="${status.count eq 1 }">
								<option value="">${openSubjectSelect.year}년${openSubjectSelect.semester}학기${openSubjectSelect.cardinal}기</option>
							</c:if>
							<option value="${openSubjectSelect.openSubjectCode}">${openSubjectSelect.subjectName}</option>
						</c:forEach>
					</select>
				</div>	
				<br/>
				<br/>
				<c:if test="${oneDebateList.oneDebateList ne null}">
					<div class="form-group" style="margin-top: 3%">
				      <label for="usr">주제:</label>
				      <input type="text" class="form-control" value="${oneDebateList.oneDebateList.debateSubject}" readonly="readonly">
				    </div>
				
					<label for="usr">내용:</label>
				    <textarea class="form-control" rows="10" readonly="readonly">${oneDebateList.oneDebateList.debateContent}</textarea>
				   	<hr/>
					<h1>토론장</h1>
					<c:forEach var="debateResultList" items="${oneDebateList.debateResultList}">
						<input type="hidden" value="${debateResultList.userCode}"/>
						<c:choose>
							<c:when test="${debateResultList.userCode eq userInfo.userCode}">
								<div style="font-weight:bold;">
									<div>
										<span>작성자 :${debateResultList.userName}</span>
									</div> 	
									<div>
										${debateResultList.debateComment}
									</div>
									<div style="text-align: right;">
										<span>작성일 :${debateResultList.debateRegisterDate}</span>
									</div>
								</div>
							</c:when>
							<c:when test="${debateResultList.userCode ne userInfo.userCode}">
								<div>
									<div>
										<span>작성자 :${debateResultList.userName}</span>
									</div> 	
									<div>
										${debateResultList.debateComment}
									</div>
									<div style="text-align: right;">
										<span>작성일 :${debateResultList.debateRegisterDate}</span>
									</div>
								</div>
							</c:when>
						</c:choose>				
					</c:forEach>
					<hr/>
					<form id="debateResultAddForm" action="/debateResultAdd" method="post">
						<input type="hidden" name="debateCode" value="${oneDebateList.oneDebateList.debateCode}">
						<div class="form-group">
							<label for="comment">토론 글쓰기:</label>
							<textarea class="form-control" rows="5" id="debateComment" name="debateComment"></textarea>
						</div>
					</form>		
					<button type="button" id="debateResultAddBtn" class="btn">토론등록</button>			
				</c:if>				
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>