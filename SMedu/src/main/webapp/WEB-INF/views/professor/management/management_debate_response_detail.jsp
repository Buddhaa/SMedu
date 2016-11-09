<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
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
				
				<div class="form-group">
					<div class="col-xs-3">
						<input type="text" name="" id="" class="form-control" placeholder="점수 입력">
					</div>
					
					<!-- Button -->
					<input type="button" id="" class="btn btn-default" value="채점하기">
				</div>	
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