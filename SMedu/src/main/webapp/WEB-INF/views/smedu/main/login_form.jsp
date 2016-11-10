<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
var loginFalseMessage = '<c:out value='${loginFalseMessage}'/>';
  $(function () {
    if(loginFalseMessage!='') {
      alert(loginFalseMessage);
    }
  });
  </script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../module/top.jsp" />
<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="../module/main_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>로그인</h1><hr>
		  <div id="content">
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<li class="active"><a href="#student" data-toggle="tab">학생</a></li>
					<li><a href="#professor" data-toggle="tab">교수</a></li>
					<li><a href="#planner" data-toggle="tab">플래너</a></li>
				</ul>
					<div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="student">
							<div class="row">
								<div class="col-lg-12">
									<form action="/smedu/login/login" method="post">
									    <div class="form-group">
									      <label>아이디</label>
									      	<input type="text" class="form-control" id="email" name="userId" value="jinho">
									    </div>
									    <div class="form-group">
									      <label>비밀번호</label>
									      	<input type="password" class="form-control" id="pwd" name="userPw" value="1234">
									    </div>
									    <div class="checkbox">
									      <label><input type="checkbox">아이디 저장</label>
									    </div>
									    <button type="submit" class="btn btn-default">로그인</button>
								 	</form>	
								</div>
							</div>
						</div>
						<div class="tab-pane" id="professor">
							<div class="row">
								<div class="col-lg-12">
									<form action="/smedu/login/login" method="post">
									    <div class="form-group">
									      <label>아이디</label>
									      	<input type="text" class="form-control" id="email" name="userId" value="professor003">
									    </div>
									    <div class="form-group">
									      <label>비밀번호</label>
									      	<input type="password" class="form-control" id="pwd" name="userPw" value="pw003">
									    </div>
									    <div class="checkbox">
									      <label><input type="checkbox">아이디 저장</label>
									    </div>
									    <button type="submit" class="btn btn-default">로그인</button>
								 	</form>	
								</div>
							</div>
						</div>
						<div class="tab-pane" id="planner">
							<div class="row">
								<div class="col-lg-12">
									<form action="/smedu/login/login" method="post">
									    <div class="form-group">
									      <label>아이디</label>
									      	<input type="text" class="form-control" id="email" name="userId" value="planner001">
									    </div>
									    <div class="form-group">
									      <label>비밀번호</label>
									      	<input type="password" class="form-control" id="pwd" name="userPw" value="pw001">
									    </div>
									    <div class="checkbox">
									      <label><input type="checkbox">아이디 저장</label>
									    </div>
									    <button type="submit" class="btn btn-default">로그인</button>
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