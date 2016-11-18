<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function () {
		
		$("#lectureUpdateBtn").click(function () {
			
			$("#lectureUpdateForm").submit();
			
		});
	
	});

</script>
<title>시커먼스</title>
</head>
<body>
<div class="hoc container clear">
		<div class="content three_quarter">
			<form id="lectureUpdateForm" action="/professorLectureUpdate" class="form-horizontal" method="post">

				<input type="hidden" name="lectureCode" value="${lectureDomain.lectureCode }">
				
				<div class="form-group">
					<label class="col-md-4 control-label">강의 주제</label>
					<div class="col-md-4">
						<input type="text" name="lectureSubject" class="form-control input-md" value="${lectureDomain.lectureSubject }">
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-md-4 control-label">세부내용</label>
					<div class="col-md-4">
						<input type="text" name="lectureContent" class="form-control input-md" value="${lectureDomain.lectureContent }">
					</div>
				</div>

				<hr />
				<div class="form-group">
					<label class="col-md-4 control-label">강의 링크</label>
					<div class="col-md-4">
						<input type="text" name="lectureLink" class="form-control input-md" value="${lectureDomain.lectureLink }">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label">강의 시간</label>
					<div class="col-md-4">
						<input type="text" name="lectureTime" class="form-control input-md" value="${lectureDomain.lectureTime }">
					</div>
				</div>
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="lectureUpdateBtn" class="btn btn-default" value="수정">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>