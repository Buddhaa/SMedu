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
		
		$("#objectionAddBtn").click(function(){
			if($("#objectionTitle").val() == ""){
				alert("이의신청 제목을 입력하세요");
				
			}else if($("#openSubject").val() == ""){
				alert("이의신청 과목을 선택하세요");	
				
			}else if($("#objectionType").val() == ""){
				alert("이의신청 분류를 선택하세요");
				
			}else if($("#objectionContent").val() == ""){
				alert("이의신청 내용을 적어주세요");
				
			}else{
				$("#objectionAddForm").submit();
			}
		});	
		
		$("#objectionAddCancel").click(function(){	
			location.href='/classroomObjection'
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
				<legend>나의 학사활동</legend>			
				</fieldset>
				<form id="objectionAddForm" action="/objectionAdd" method="POST">
				    <div class="form-group">
				    
				      <label for="usr">제목:</label>
				      <input type="text" class="form-control" name="objectionTitle" id="objectionTitle">
				      
					  <label class="control-label">과목선택</label>
		  			  <select class="form-control" id="openSubject" name="openSubjectCode">
						  <c:forEach var="openSubjectSelect" items="${openSubjectSelect}" varStatus="status">
							  <c:if test="${status.count eq 1 }">
								  <option value="">${openSubjectSelect.year}년${openSubjectSelect.semester}학기${openSubjectSelect.cardinal}기</option>
							  </c:if>
							  <option value="${openSubjectSelect.openSubjectCode}">${openSubjectSelect.subjectName}</option>
						  </c:forEach>
					  </select>
					  
				      <label for="usr">이의신청 분류:</label>
				      <select class="form-control" name="objectionType" id="objectionType">
				      	<option value="">이의신청 분류</option>
				      	<option value="출석">출석</option>
				      	<option value="과제">과제</option>
				      	<option value="토론">토론</option>
				      	<option value="중간고사">중간고사</option>
				      	<option value="기말고사">기말고사</option>
				      </select>
				    </div>
				    
				    <div class="form-group">
				      <label for="comment">내용:</label>
				      <textarea class="form-control" rows="15" id="objectionContent" name="objectionContent"></textarea>
				    </div>
		  		</form>				
		  		<button type="button" class="btn btn-primary btn-block" id="objectionAddBtn">이의신청 제출</button>
		  		<button type="button" class="btn btn-primary btn-block" id="objectionAddCancel">취소</button>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>