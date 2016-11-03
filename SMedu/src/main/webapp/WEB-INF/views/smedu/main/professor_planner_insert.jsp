<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<legend>회원가입</legend>
			<div id="content">
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<li class="active col-xs-6"><a href="#professor" data-toggle="tab">교수</a></li>
					<li class="col-xs-6"><a href="#planner" data-toggle="tab">플래너</a></li>
				</ul>
				<div id="my-tab-content" class="tab-content">
					<div class="tab-pane active" id="professor">
						<div class="row">
							<div class="col-lg-12">
								<form class="form-horizontal" action="/smedu/main/professorInsert" method="post">
									<fieldset>
										<input name="userLevel" type="hidden" value="교수">
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
										  <label class="col-md-4 control-label">학사</label>
										  <div class="col-md-4">
										    <input name="professorBachelor" type="text" class="form-control input-md">
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">석사</label>
										  <div class="col-md-4">
										    <input name="professorMaster" type="text" class="form-control input-md">
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">박사</label>
										  <div class="col-md-4">
										    <input name="professorDoctor" type="text" class="form-control input-md">
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">주요 경력</label>
										  <div class="col-md-6">
										   <textarea name="professorCareer" class="form-control" rows="7" id="comment"></textarea>
										  </div>
										</div>
										
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
					<div class="tab-pane" id="planner">
						<div class="row">
							<div class="col-lg-12">
								<form class="form-horizontal" action="/smedu/main/plannerInsert" method="post">
									<fieldset>
										<input name="userLevel" type="hidden" value="플래너">
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
										  <label class="col-md-4 control-label">카카오톡아이디</label>
										  <div class="col-md-4">
										    <input name="plannerKakao" type="text" class="form-control input-md">
										  </div>
										</div>
										
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
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>