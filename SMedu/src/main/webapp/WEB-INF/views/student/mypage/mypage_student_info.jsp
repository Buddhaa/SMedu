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
	$("#selectEducational").val("${studentInfo.student.userEducational}");
	$("#studentPath").val("${studentInfo.student.studentPath}");
	$("#studentGoal").val("${studentInfo.student.studentGoal}");
	
	$("#returnBtn").click(function(){
		location.replace('/')
	});
	
	$("#studentUpdateBtn").click(function(){
		$("studentUpdateForm").submit();
	});
});
</script>
<title>시커먼스</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />		
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/main_sidebar.jsp" />
			<div class="content three_quarter">
	<form id="studentUpdateForm" class="form-horizontal" action="/updateStudentInfo" method="post">
		<fieldset>
		<input name="passwordinput" type="hidden" value="학생">
		<legend>나의정보</legend>
		<div class="form-group">
		  <label class="col-md-4 control-label">아이디</label>  
		  <div class="col-md-4">
		  	<p class="form-control-static">${studentInfo.student.userId}</p>
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">비밀번호</label>  
		  <div class="col-md-4">
		  	<input name="userPw" type="password" class="form-control input-md" value="${studentInfo.student.userPw}" readonly="readonly">
		  </div>
		</div>	
		<div class="form-group">
		  <label class="col-md-4 control-label">학과</label>
		  <div class="col-md-4">
		  	<p class="form-control-static">${studentInfo.student.departmentName}</p>
		  </div>
		</div>	
		<div class="form-group">
		  <label class="col-md-4 control-label">이름</label>
		  <div class="col-md-4">
		 	 <p class="form-control-static">${studentInfo.student.userName}</p>
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">생일</label>
		  <div class="col-md-4">
		  	<p class="form-control-static">${studentInfo.student.userBirth}</p>
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">성별</label>
		  <div class="col-md-4">
		  	<p class="form-control-static">${studentInfo.student.userGender}</p>
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">주소</label>
		  <div class="col-md-4">
		    <input name="userAddress" type="text" class="form-control input-md" value="${studentInfo.student.userAddress}">
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">전화번호</label>
		  <div class="col-md-4">
		    <input name="userPhone" type="text" class="form-control input-md" value="${studentInfo.student.userPhone}">    
		    <span>"-"뺀후 입력하세요</span>
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">이메일</label>
		  <div class="col-md-4">
		    <input name="userEmail" type="text" class="form-control input-md" value="${studentInfo.student.userEmail}">
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">최종학력</label>
		  <div class="col-md-4">
		  	 <select class="form-control" id="selectEducational" name="userEducational">
		    	<option value="고등학교졸업">고등학교졸업</option>
		    	<option value="전문대재학">전문대재학</option>
		    	<option value="4년제대학재학">4년제대학재학</option>
		    	<option value="대학원재학">대학원재학</option>
		    	<option value="전문대졸업">전문대졸업</option>
		    	<option value="4년제대학졸업">4년제대학졸업</option>
		    	<option value="대학원졸업">대학원졸업</option>
		   	 </select>
		  </div>
		</div>
		<hr>
		<div class="form-group">
		  <label class="col-md-4 control-label">알게된경로</label>
		  <div class="col-md-4">
		    <select class="form-control" id="studentPath" name="studentPath">
		    	<option value="인터넷광고">인터넷광고</option>
		    	<option value="지역신문">지역신문</option>
		    	<option value="지인소개">지인소개</option>
		    	<option value="협력기관">협력기관</option>
		    	<option value="홍보물">홍보물</option>
		   	 </select>
		  </div>
		</div>	
		<div class="form-group">
		  <label class="col-md-4 control-label">학위취득목적</label>
		  <div class="col-md-4">
		    <select class="form-control" id="studentGoal" name="studentGoal">
		    	<option value="학위취득">학위취득</option>
		    	<option value="4년제대학졸업">취업</option>
		    	<option value="편입">편입</option>
		    	<option value="자기개발">자기개발</option>
		   	 </select>
		  </div>
		</div>	
		<div class="form-group">
		  <label class="col-md-4 control-label">기수</label>
		  <div class="col-md-4">
		    <p class="form-control-static">
		    	${studentInfo.cardinal.year}년${studentInfo.cardinal.semester}학기${studentInfo.cardinal.cardinal}기<br/>
		    	${studentInfo.cardinal.classStartDay} ~ ${studentInfo.cardinal.classEndDay}</p>
		  </div>
		</div>	
		<input type="hidden" name="studentCode" value="${studentInfo.student.studentCode}">	
		<input type="hidden" name="userCode" value="${studentInfo.student.userCode}">
		<input type="hidden" name="userState" value="${studentInfo.student.userState}">
		
		<!-- Button -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="signup_recruiter"></label>
		  <div class="col-md-4">
		    <button id="studentUpdateBtn" class="btn btn-default">수정하기</button>
		    <button id="returnBtn" class="btn btn-default">뒤로가기</button>
		  </div>
		</div>	
		</fieldset>
	</form>	
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>