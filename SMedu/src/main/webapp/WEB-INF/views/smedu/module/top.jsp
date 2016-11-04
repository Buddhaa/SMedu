<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/smedu/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- JAVASCRIPTS -->
<script src="/resources/smedu/layout/scripts/jquery.min.js"></script>
<script src="/resources/smedu/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/smedu/layout/scripts/jquery.mobilemenu.js"></script>
<script src="/resources/smedu/layout/scripts/jquery.flexslider-min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body id="top">
<!-- top -->
<div class="wrapper row0"  data-spy="affix" data-offset-top="1">
  <div id="topbar" class="hoc clear"> 
    <div class="fl_left" >
      <ul>
        <li>
        	<a href="/smedu/main/main">
        		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/logo.jpg">
        	</a>
        	<img alt="국가기관" src="/resources/smedu/images/demo/backgrounds/banner_mest.png">
        </li>
      </ul>
    </div>
    <c:if test="${userInfo==null}">
	    <div class="fl_right">
	      <ul>
	        <li><a href="/smedu/main/main"><i class="fa fa-lg fa-home"></i>홈으로</a></li>
	        <li><a href="/smedu/main/loginForm">로그인</a></li>
	        <li><a href="/smedu/main/signUpUser">회원가입</a></li>
	        <li><a href="/smedu/introduction/siteMap">사이트 맵</a></li>
	      </ul>
	    </div>
    </c:if>
    <c:if test="${userInfo.userLevel=='학생'}">
	    <div class="fl_right">
	      <ul>
	        <li><a href="/smedu/main/main"><i class="fa fa-lg fa-home"></i>홈으로</a></li>
	        <li><a href="/smedu/main/logOut">로그아웃</a></li>
	        <li><a href="/studentInfo?login=${userInfo.userCode}">마이페이지</a></li>
	        <li><a href="/smedu/introduction/siteMap">사이트 맵</a></li>
	      </ul>
	      &nbsp;
	      <ul>
	      	<li>${userInfo.userName}${userInfo.userLevel}님 환영합니다.</li>
	      </ul>
	    </div>
    </c:if>
    <c:if test="${userInfo.userLevel=='플래너'}">
	    <div class="fl_right">
	      <ul>
	        <li><a href="/smedu/main/main"><i class="fa fa-lg fa-home"></i>홈으로</a></li>
	        <li><a href="/smedu/main/logOut">로그아웃</a></li>
	        <li><a href="#">마이페이지</a></li>
	        <li><a href="/smedu/introduction/siteMap">사이트 맵</a></li>
	      </ul>
	      &nbsp;
	      <ul>
	      	<li>${userInfo.userName}${userInfo.userLevel}님 환영합니다.</li>
	      </ul>
	    </div>
    </c:if>
    <c:if test="${userInfo.userLevel=='교수'}">
	    <div class="fl_right">
	      <ul>
	        <li><a href="/smedu/main/main"><i class="fa fa-lg fa-home"></i>홈으로</a></li>
	        <li><a href="/smedu/main/logOut">로그아웃</a></li>
	        <li><a href="/professorInfo?userCode=${userInfo.userCode}">마이페이지</a></li>
	        <li><a href="/smedu/introduction/siteMap">사이트 맵</a></li>
	      </ul>
	      &nbsp;
	      <ul>
	      	<li>${userInfo.userName}${userInfo.userLevel}님 환영합니다.</li>
	      </ul>
	    </div>
    </c:if>
  </div>
</div>
<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <h1><a href="/smedu/main/main">SICKERMAN'S</a></h1>
    <p>Cyber Education since 2016</p>
  </header>
</div>
<!-- nav -->
<div class="wrapper row4">
  <nav id="mainav" class="hoc clear"> 
    <ul class="clear">
      <li><a class="drop" href="/smedu/introduction/introductionAcademy">프로젝트소개</a>
      	<ul>
          <li><a href="/smedu/introduction/introductionProject">프로젝트소개</a></li>
       	  <li><a href="/smedu/introduction/introductionAcademy">교육원 소개</a></li>
       	  <li><a href="/smedu/introduction/roadMap">찾아오시는 길</a></li>
       	  <li><a href="/smedu/introduction/siteMap">사이트 맵</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">학점은행제</a>
        <ul>
			<li><a href="/smedu/creditbank/creditbankIntro">학점은행제소개</a>
			<li><a href="/smedu/creditbank/creditbankRecognitionSubject">학점취득과정</a>
          	<li><a href="/smedu/creditbank/curriculumIntro">교육과정</a></li>
			<li><a href="/smedu/creditbank/creditbankPrecaution">학점인정주의사항</a>
          	<li><a href="/smedu/creditbank/creditbankOrientation">오리엔테이션</a></li>
			<li><a href="/smedu/creditbank/creditbankLectureWay">강의수강방법</a></li>
			<li><a href="/smedu/creditbank/creditbankAttendWay">출석률확인방법</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">교육과정</a>
        <ul>
          <li><a href="#">컴퓨터공학과</a></li>
          <li><a href="#">정보통신학과</a></li>
          <li><a href="#">정보보안학과</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">수강신청</a>
      	 <ul>
          <li><a href="#">수강신청</a></li>
          <li><a href="#">신청/결제</a></li>
          <li><a href="#">결제 이력 페이지</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">상담신청</a>
      	 <ul>
          <li><a href="#">상담신청</a></li>
          <li><a href="#">학습설계</a></li>
          <li><a href="#">상담게시판</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">열린마당</a>
      	 <ul>
          <li><a href="#">공지사항</a></li>
          <li><a href="#">FAQ</a></li>
          <li><a href="#">자료실</a></li>
          <li><a href="#">학사일정</a></li>
          <li><a href="#">수강후기</a></li>
        </ul>	
      </li>
      <c:if test="${userInfo.userLevel==null}">
	      <li><a class="drop" href="/smedu/main/loginForm">나의강의실</a>
	      	 <ul>
	          <li><a href="#">나의 학사활동</a></li>
	          <li><a href="#">나의 학점관리</a></li>
	          <li><a href="#">과제 참여</a></li>
	          <li><a href="#">토론 참여</a></li>
	          <li><a href="#">성적 이의신청</a></li>
	          <li><a href="#">강의 평가</a></li>
	          <li><a href="#">수강 후기</a></li>
	        </ul>
	      </li>
      </c:if>
      <c:if test="${userInfo.userLevel=='학생'}">
	      <li><a class="drop" href="#">나의강의실</a>
	      	 <ul>
	          <li><a href="#">나의 학사활동</a></li>
	          <li><a href="#">나의 학점관리</a></li>
	          <li><a href="#">과제 참여</a></li>
	          <li><a href="#">토론 참여</a></li>
	          <li><a href="#">성적 이의신청</a></li>
	          <li><a href="#">강의 평가</a></li>
	          <li><a href="#">수강 후기</a></li>
	        </ul>
	      </li>
      </c:if>
      <c:if test="${userInfo.userLevel=='교수'}">
	      <li><a class="drop" href="/professorSubjectSelect?professorCode=${userPlusInfo.professorCode}">교무관리</a>
	      	 <ul>
	          <li><a href="/professorSubjectSelect?professorCode=${userPlusInfo.professorCode}">학생성적조회</a></li>
	          <li><a href="#">학생성적관리</a></li>
	          <li><a href="#">성적이의신청관리</a></li>
	          <li><a href="#">담당개설과목관리</a></li>
	        </ul>
	      </li>
      </c:if>
      <c:if test="${userInfo.userLevel=='플래너'}">
	      <li><a class="drop" href="#">업무관리</a>
	      	 <ul>
	          <li><a href="#">학습설계 관리</a></li>
	          <li><a href="#">담당학생 관리</a></li>
	          <li><a href="#">상담기록 관리</a></li>
	        </ul>
	      </li>
      </c:if>
    </ul>
  </nav>
</div>
<!-- /nav -->
<!-- /top -->
</body>
</html>