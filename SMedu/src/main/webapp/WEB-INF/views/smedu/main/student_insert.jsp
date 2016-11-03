<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../module/top.jsp" />

<div class="wrapper row3">
	<div class="hoc container clear">
		<div class="sidebar one_quarter first">
		<h3>회원 서비스</h3><hr>
			<nav class="sdb_holder">
				<ul>
					<li><a href="/smedu/main/loginForm">로그인</a></li>
        			<li><a href="/smedu/main/signUpUser"><strong>회원가입</strong></a></li>
					<li><a href="#">개인정보취급방침</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">이력서등록</a></li>
				</ul>
			</nav>
		</div>
		<div class="content three_quarter">
			<form class="form-horizontal" action="/smedu/main/studentInsert" method="post">
			<fieldset>
			
			<legend>회원가입</legend>
			<input name="userLevel" type="hidden" value="학생">
 			<%-- <input name="userCode" type="text" value="${userCode}">
			<input name="studentCode" type="text" value="${studentCode }"> --%>
			<div class="form-group">
			  <label class="col-md-4 control-label">아이디</label>  
			  <div class="col-md-4">
			  <input name="userId" type="text" class="form-control input-md">
			  <button id="jwoongbock" class="btn btn-default">중복확인</button>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">비밀번호</label>  
			  <div class="col-md-4">
			  <input id="userPw" type="password" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">비밀번호 확인</label>
			  <div class="col-md-4">
			    <input id="userPw" name="userPw" type="password" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">이름</label>
			  <div class="col-md-4">
			    <input name="userName" type="text" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">생일</label>
			  <div class="col-md-4">
			    <input name="userBirth" type="text" class="form-control input-md">
			    <span>주민등록번호 앞자리</span>  
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">성별</label>
			  <div class="col-md-4">
			  	<div class="radio">
			    <label><input type="radio" id="optionsRadios1" name="userGender" value="남">남</label>&nbsp;
			    <label><input type="radio" id="optionsRadios2" name="userGender" value="여">여</label>
			    </div>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">주소</label>
			  <div class="col-md-4">
			    <input name="userAddress" type="text" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">전화번호</label>
			  <div class="col-md-4">
			    <input name="userPhone" type="text" class="form-control input-md">
			    <span>"-"뺀후 입력하세요</span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">이메일</label>
			  <div class="col-md-4">
			    <input name="userEmail" type="text" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">학과</label>
			  <div class="col-md-4">
			    <select class="form-control" name="departmentCode">
			    	<option value="">==선택==</option>
			    	<option value="department_code1">컴퓨터정보학과</option>
			    	<option value="department_code2">정보통신학과</option>
			    	<option value="department_code3">정보보안학과</option>
			    </select>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">최종학력</label>
			  <div class="col-md-4">
			  	 <select class="form-control" name="userEducational">
			  	 	<option value="">==선택==</option>
			    	<option value="고등학교졸">고등학교졸</option>
			    	<option value="전문대재학">전문대재학</option>
			    	<option value="4년제대학재학">4년제대학재학</option>
			    	<option value="대학원재학">대학원재학</option>
			    	<option value="전문대졸업">전문대졸업</option>
			    	<option value="4년제대학졸업">4년제대학졸업</option>
			    	<option value="대학원졸업">대학원졸업</option>
			   	 </select>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">알게된경로</label>
			  <div class="col-md-4">
			    <select class="form-control" name="studentPath">
			  	 	<option value="">==선택==</option>
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
			    <select class="form-control" name="studentGoal">
			  	 	<option value="">==선택==</option>
			    	<option value="학위취득">학위취득</option>
			    	<option value="4년제대학졸업">취업</option>
			    	<option value="편입">편입</option>
			    	<option value="자기개발">자기개발</option>
			   	 </select>
			  </div>
			</div>
			
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="signup_recruiter"></label>
			  <div class="col-md-4">
			    <button id="signup_recruiter" name="signup_recruiter" class="btn btn-default">가입하기</button>
			    <button id="signup_recruiter" name="signup_recruiter" class="btn btn-default">뒤로가기</button>
			  </div>
			</div>
			
			</fieldset>
			</form>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>