<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#cardinalSelect").val("${cardinalCode}").attr("selected", "selected");
		$("#openSubjectSelect").val("${openSubjectCode}").attr("selected", "selected");
		
		
		
		$("#cardinalSelect").change(function() {
			
			var cardinalCode = $("#cardinalSelect").val();
						
			location.replace('/planner/work/planner_student_list?cardinalCode='+cardinalCode);
		
		});
		
		$("#openSubjectSelect").change(function() {
			
			var cardinalCode = $("#cardinalSelect").val();
			var openSubjectCode = $("#openSubjectSelect").val();
				
			location.replace('/planner/work/planner_student_list?cardinalCode='+cardinalCode+'&openSubjectCode='+openSubjectCode);
			
		});

	});
	
</script>

<body>
					<!-- 담당학생 목록 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter"> 
			<h1>담당학생 목록</h1><hr/>
			
	<form action="planner/work/planner_student_list" method="post" 
			id="studentListForm">
	
	<fieldset>
		<legend>담당학생 목록</legend>
			<div class="form-group">
				<label class="col-md-2 control-label">기수 선택</label>
			<div class="col-md-4">
				<select id="cardinalSelect" name="cardinalCode" class="form-control">
					<option value="">=======선택=======</option>				
						<c:forEach var="cardinal" items="${cardinalList}">
							<option value="${cardinal.cardinalCode}">${cardinal.year}년${cardinal.semester}학기${cardinal.cardinal}기수</option>
						</c:forEach>	
				</select>
			</div>
		</div>
			<hr/>
			<div class="form-group">
				<label class="col-md-2 control-label">과목 선택</label>
			<div class="col-md-4">
				<select id="openSubjectSelect" name="openSubjectCode" class="form-control">
					<option value="">=======선택=======</option>				
						<c:forEach var="openSubject" items="${openSubjectList}">
							<option value="${openSubject.openSubjectCode}">${openSubject.subjectName}</option>
						</c:forEach>	
				</select>
			</div>
		</div>
		<hr/>
			<div class="form-group">
				<h2></h2>
			</div>
	</fieldset>
	</form>
	
 <table class="table table-hover">
	<thead>
		<tr>	
			<th>기수</th>
			<th>학과</th>
			<th>학생이름</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="student" items="${studentList}">
				
			<tr>
				<td>${student.year}년${student.semester}학기${student.cardinal}기수</td>
				<td>${student.departmentName}</td>
				<td>${student.userName}</td>				
				<td><a href="#"
							onclick="javascript:window.open('/planner/work/planner_student_detail?studentCode=${student.studentCode}&cardinalCode=${cardinalCode}&openSubjectCode=${openSubjectCode}','windowpopup', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=700, height=530')">조회</a>
				</td>
							
			</tr>
		</c:forEach>
		</tbody>
	
</table> 						

	<ul class="pager">		
		<li><a href="/smedu/main/main">이전</a></li>
	</ul>
	</div>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>