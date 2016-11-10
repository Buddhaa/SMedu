<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidebar one_quarter first">
      <c:if test="${userInfo.userLevel==null}">
		<h3>회원 서비스</h3><hr>
		<nav class="sdb_holder">
			<ul>
				<li><a href="/smedu/main/loginForm">로그인</a></li>
       			<li><a href="/smedu/main/signUpUser">회원가입</a></li>
				<li><a href="/smedu/main/personalInformation">개인정보취급방침</a></li>
				<li><a href="/smedu/main/agreement">이용약관</a></li>
			</ul>
		</nav>
	 </c:if>
	 <c:if test="${userInfo.userLevel =='학생'}">
		<h3>회원 서비스</h3><hr>
		<nav class="sdb_holder">
			<ul>
				<li><a href="/studentInfo">회원정보수정</a></li>
       			<li><a href="/userDelete">회원탈퇴</a></li>
       			<li><a href="/classroomAcademicActivity">나의 학사활동</a></li>
       			<li><a href="/finalResultGrade">이수학점관리</a></li>
       			<li><a href="/studentconsultingHistory">나의 상담내역</a></li>
			</ul>
		</nav>
	 </c:if>
	 <c:if test="${userInfo.userLevel=='교수'}">
		<h3>회원 서비스</h3><hr>
		<nav class="sdb_holder">
			<ul>
				<li><a href="/professorInfo">회원정보수정</a></li>
       			<li><a href="/userDelete">회원탈퇴</a></li>
			</ul>
		</nav>
	 </c:if>
	 <c:if test="${userInfo.userLevel=='플래너'}">
		<h3>회원 서비스</h3><hr>
		<nav class="sdb_holder">
			<ul>
				<li><a href="/plannerInfo">회원정보수정</a></li>
       			<li><a href="/userDelete">회원탈퇴</a></li>
			</ul>
		</nav>
	 </c:if>
	</div>
</body>
</html>