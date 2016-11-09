<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>시커먼스</title>
</head>
<body>
	<div class="hoc container clear">
		<div class="content three_quarter">
			<form id="" action="" class="form-horizontal" method="post">

				<div class="form-group">
					<label class="col-md-4 control-label">과제 주제</label>
					<div class="col-md-4">
						<p class="form-control-static">${professorStudentTaskResult.taskSubject }</p>
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-md-4 control-label">제목</label>
					<div class="col-md-4">
						<input type="text" value="${professorStudentTaskResult.taskResultTitle }"
							readonly="readonly" class="form-control input-md">
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-md-4 control-label">내용</label>
					<div class="col-md-4">
						<textarea class="form-control" style="resize: none;" rows="20"
							cols="40">${professorStudentTaskResult.taskResultContent }</textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label">첨부파일</label>
					<c:if test="${professorStudentTaskResult.taskFileName != null }">
						<a href="#">${professorStudentTaskResult.taskOriginFileName }(${professorStudentTaskResult.taskFileSize }kb)</a>
					</c:if>
				</div>

				<hr />

				<div class="form-group">
					<div class="col-md-4">
						<p class="form-control-static">
							<strong>과제 제출일</strong>
							${professorStudentTaskResult.taskResultDate }
						</p>
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<div class="col-xs-3">
						<input type="text" name="" id="" class="form-control" placeholder="점수 입력">
					</div>
					
					<!-- Button -->
					<input type="button" id="" class="btn btn-default" value="채점하기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>