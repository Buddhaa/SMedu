<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function () {
		opener.parent.location.reload();
		$("#lectureUpdateBtn").click(function () {
			
			$("#lectureDetailForm").submit();
		
		});
		
		if($("#lectureSubject").val() == '중간고사') {
			$("#lectureUpdateBtn").hide();
		}else if($("#lectureSubject").val() == '기말고사') {
			$("#lectureUpdateBtn").hide();
		}
	
	});

</script>
<title>시커먼스</title>
</head>
<body>
<div class="hoc container clear">
		<div class="content three_quarter">
			<form id="lectureDetailForm" action="/professorLectureUpdateForm" class="form-horizontal" method="post">

				<input type="hidden" name="lectureCode" value="${professorLetureDetail.lectureCode }">
				<input type="hidden" id="lectureSubject" name="lectureSubject" value="${professorLetureDetail.lectureSubject }">
				<input type="hidden" name="lectureLink" value="${professorLetureDetail.lectureLink }">
				<input type="hidden" name="lectureTime" value="${professorLetureDetail.lectureTime }">
				
				<div class="form-group">
					<label class="col-md-4 control-label">강의 주제</label>
					<div class="col-md-4">
						<p class="form-control-static">${professorLetureDetail.lectureSubject }</p>
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-md-4 control-label">세부내용</label>
					<div class="col-md-4">
						<input type="text" name="lectureContent" value="${professorLetureDetail.lectureContent }"
							readonly="readonly" class="form-control input-md">
					</div>
				</div>

				<hr />
				
				<c:if test="${professorLetureDetail.lectureSubject == '중간고사'}">
					<strong>중간고사기간 에는 별도의 강의가 없습니다.</strong>
				</c:if>
				
				<c:if test="${professorLetureDetail.lectureSubject == '기말고사'}">
					<strong>기말고사기간 에는 별도의 강의가 없습니다.</strong>
				</c:if>
				
				<c:if test="${professorLetureDetail.lectureSubject != '기말고사' and professorLetureDetail.lectureSubject != '중간고사'}">
				<iframe width="560" height="315" src="${professorLetureDetail.lectureLink }" ></iframe>
				</c:if>
				
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="button" id="lectureUpdateBtn" class="btn btn-default" value="강의 수정">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>