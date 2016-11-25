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
		var check = "${check}"
		
		if(check != ''){
			alert(check);
			location.replace('/classroomTaskJoin');
		}
		
		$("#openSubject").change(function(){
			var openSubjectCode = $("#openSubject").val();
			location.replace('/classroomTaskJoin?openSubjectCode=' + openSubjectCode);
		});
		
		$("#taskResultAdd").click(function(){
			if($("#taskFile").val() == ""){
				alert("과제 파일을 등록해주세요");
			}else{
				$("#taskResultAddForm").submit();
			}
		});
	});
</script>

<style>

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}
</style>
<title>시커먼스</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
			<div class="content three_quarter">
				<fieldset>
					<h1>과제 참여</h1>
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
					<div>
						<c:if test="${oneTaskView.taskList ne null}">
							<form id="taskResultAddForm" action="/taskResultAdd" method="POST" enctype="multipart/form-data">
								<input type="hidden" value="${oneTaskView.taskList.taskCode}" name="taskCode">
								<div class="form-group" style="margin-top: 3%">
							      <label for="usr">주제:</label>
							      <input type="text" class="form-control" value="${oneTaskView.taskList.taskSubject}" readonly="readonly">
							    </div>
							    
							    <label for="usr">내용:</label>
							    <textarea class="form-control" rows="3" readonly="readonly" name="taskContent">${oneTaskView.taskList.taskContent}</textarea>
								<hr/>
							   	<div>
							   		<c:if test="${oneTaskView.taskResultList eq null}">
									    <div style="text-align: center;"><h1>과제제출하기</h1></div>
									    <div class="form-group">
									      <label for="usr">제목:</label>
									      <input type="text" class="form-control" name="taskResultTitle" >
									    </div>
									    <label for="usr">내용:</label>
									    <textarea class="form-control" rows="15" name="taskResultContent"></textarea>
									   	<hr/>
									   	<input type="file" name="taskFile" id="taskFile">
									   	<button type="button" id="taskResultAdd" class="btn btn-primary btn-lg btn-block">과제 제출하기</button>
								   	</c:if>
							   	</div>
						    </form>
						</c:if>	
					    <label for="usr"></label>
					    <c:if test="${oneTaskView.taskResultList ne null}">
						    <div style="text-align: center;"><h1>제출한 과제 목록</h1></div>
						    <table class="table table-striped">
						    	<thead>
						    		<tr>
						    			<th>과제제출 제목</th>
						    			<th>과제제출 날짜</th>
						    		</tr>
						    	</thead>
						    	<tbody>
					       			<tr>
				    					<td><a href="/taskSubmitUpdate?taskResultCode=${oneTaskView.taskResultList.taskResultCode}">${oneTaskView.taskResultList.taskResultTitle}</a></td>
				    					<td>${oneTaskView.taskResultList.taskResultDate}</td>
				    				</tr>
						    	</tbody>	
						    </table>
					    </c:if>	
					</div>
				</fieldset>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>