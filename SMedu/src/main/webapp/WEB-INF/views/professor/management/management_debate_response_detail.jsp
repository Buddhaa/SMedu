<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
	/* vallidation code... */	
	
	$(document).ready(function () {
		$('#markingBtn').click(function () {
			if(isNaN($('#debateScore').val())) {
				console.log("문자");
				alert("0~15의 숫자(점수)를 입력하세요.");
				$('#debateScore').focus();
			}else if($('#debateScore').val() < 0 || $('#debateScore').val() > 15) {
				console.log("0~15외의 숫자");
				alert("0~15의 숫자(점수)를 입력하세요.");
				$('#debateScore').focus();
			}else if($('#debateScore').val() == "") {
				console.log("공백");
				alert("0~15의 숫자(점수)를 입력하세요.");
				$('#debateScore').focus();
			}else {
				$('#debateMarkingForm').submit();
			}
		});
	});
	

</script>
<title>시커먼스</title>
</head>
<body>
	<div class="hoc container clear">
		<div class="content three_quarter">
			<form id="debateMarkingForm" action="/professorDebateMarking" class="form-horizontal" method="post">
				<div class="form-group">
					<label class="col-md-4 control-label">토론 주제</label>
					<div class="col-md-4">
						<p class="form-control-static">${professorStudentDebateSubjectAndContent.debateSubject }</p>
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">본문</label>
					<div class="col-md-4">
						<textarea class="form-control" style="resize: none;" rows="5"
							cols="10" readonly="readonly">${professorStudentDebateSubjectAndContent.debateContent }</textarea>
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label class="col-md-4 control-label">토론 답변</label>
					<div class="col-md-4">
						<c:forEach var="DebateCommentAndDate" items="${professorStudentDebateCommentAndDate }">
							<c:if test="${studentCode == DebateCommentAndDate.studentCode }">
								<div class="form-group">
									<label style="resize: none; color:blue;" class="col-md-4 control-label">작성자 ${DebateCommentAndDate.userName }</label>
									<div class="col-md-4">
										<textarea class="form-control" rows="5" cols="10" readonly="readonly"
										style="resize: none; font-weight:bold; border-color: blue;">${DebateCommentAndDate.debateComment }</textarea>
										${DebateCommentAndDate.debateRegisterDate }
									</div>								
								</div>
							</c:if>
							<c:if test="${studentCode != DebateCommentAndDate.studentCode }">
								<div class="form-group">
									<label class="col-md-4 control-label">작성자 ${DebateCommentAndDate.userName }</label>	
									<div class="col-md-4">
										<textarea class="form-control" style="resize: none;" rows="5"
								cols="10" readonly="readonly">${DebateCommentAndDate.debateComment }</textarea>
								${DebateCommentAndDate.debateRegisterDate }
									</div>		
								</div>
							</c:if>
							<hr/>
						</c:forEach>
				
				<!-- Hidden -->
				<input type="hidden" name="openSubjectCode" value="${param.openSubjectCode }">
				<input type="hidden" name="studentCode" value="${param.studentCode }">
								
			<c:if test="${debateScoreAndCode.debateScoreCode == null }">	
				<div class="form-group">
					
					<!-- 채점 Input Box -->
					<div class="col-xs-3">
						<input type="text" name="debateScore" id="debateScore" class="form-control" placeholder="점수 입력">
					</div>
					
					<!-- Button -->
					<input type="button" id="markingBtn" class="btn btn-default" value="채점하기">
					<small>0~15점의 점수를 입력</small>
				</div>
			</c:if>

			<c:if test="${debateScoreAndCode.debateScoreCode != null }">
				<div class="form-group">
					<div class="col-xs-3">
						<input type="text" name="debateScore" id="debateScore" class="form-control" 
						value="점수 : ${debateScoreAndCode.debateScore } 점" readonly="readonly">
					</div>
				</div>
			</c:if>
					</div>
				</div>				
			</form>
		</div>
	</div>
</body>
</html>



<%-- 


<c:forEach var="DebateCommentAndDate" items="${professorStudentDebateCommentAndDate }">
	<c:if test="${studentCode == DebateCommentAndDate.studentCode }">
		<span style="color:blue;"><Strong>${DebateCommentAndDate.userName }</Strong></span>
		<Strong>${DebateCommentAndDate.debateComment }</Strong>
	</c:if>
	<c:if test="${studentCode != DebateCommentAndDate.studentCode }">
			${DebateCommentAndDate.userName }
			${DebateCommentAndDate.debateComment }
	</c:if>

	${DebateCommentAndDate.debateRegisterDate }
	<br/>
</c:forEach>
 --%>