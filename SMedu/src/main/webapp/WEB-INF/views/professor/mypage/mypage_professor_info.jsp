<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#selectEducational").val("${professorInfo.userEducational}")

		// 뒤로가기 버튼 click시 main 화면으로 이동
		$("#returnBtn").click(function() {
			location.href = "/smedu/main/main";
		});
		// 수정하기 버튼 click시 수정된 정보화면으로 이동
		$("#professorUpdateBtn").click(function() {
			$("#professorUpdateForm").submit();
		});
	});
</script>
<title>시커먼스</title>
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />

	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/main_sidebar.jsp" />
			
			<div class="content three_quarter">

				<form id="professorUpdateForm" action="/updateProfessorInfo"
					class="form-horizontal" method="post">

					<fieldset>

						<legend>나의 정보</legend>
						<input type="hidden" name="userCode" value="${professorInfo.userCode }"> 
						<input type="hidden" name="professorCode" value="${professorInfo.professorCode }">
						<input type="hidden" name="userState" value="${professorInfo.userState }">

						<div class="form-group">
							<label class="col-md-4 control-label">아이디</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.userId }</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">비밀번호</label>
							<div class="col-md-4">
								<input name="userPw" type="password" value="${professorInfo.userPw }" readonly="readonly" class="form-control input-md">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">학과</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.departmentName }</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">이름</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.userName }</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">생일</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.userBirth }</p>
								<span>주민등록번호 앞자리</span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">성별</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.userGender }</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">주소</label>
							<div class="col-md-4">
								<input name="userAddress" type="text" value="${professorInfo.userAddress }" class="form-control input-md">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">전화번호</label>
							<div class="col-md-4">
								<input name="userPhone" type="text" value="${professorInfo.userPhone }" class="form-control input-md">
								<span>"-"뺀후 입력하세요</span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">이메일</label>
							<div class="col-md-4">
								<input name="userEmail" type="text" value="${professorInfo.userEmail }" class="form-control input-md">
							</div>
						</div>


						<div class="form-group">
							<label class="col-md-4 control-label">최종학력</label>
							<div class="col-md-4">
								<select class="form-control" name="userEducational" id="selectEducational">
									<option value="고등학교졸업">고등학교졸업</option>
									<option value="전문대재학">전문대재학</option>
									<option value="4년제대학재학">4년제대학재학</option>
									<option value="대학원재학">대학원재학</option>
									<option value="전문대졸압">전문대졸업</option>
									<option value="4년제대학졸업">4년제대학졸업</option>
									<option value="대학원졸업">대학원졸업</option>
								</select>
							</div>
						</div>
						<hr />
						<div class="form-group">
							<label class="col-md-4 control-label">학사</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.professorBachelor }</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">석사</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.professorMaster }</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">박사</label>
							<div class="col-md-4">
								<p class="form-control-static">${professorInfo.professorDoctor }</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">주요경력</label>
							<textarea name="professorCareer" rows="5" cols="40">${professorInfo.professorCareer }</textarea>
						</div>

						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4">
								<input type="button" id="professorUpdateBtn" class="btn btn-default" value="수정하기">
								<input type="button" id="returnBtn" class="btn btn-default" value="뒤로가기">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>