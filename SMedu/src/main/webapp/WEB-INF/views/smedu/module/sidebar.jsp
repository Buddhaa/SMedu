<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<title>시커먼스</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/smedu/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<div class="sidebar one_quarter first">
		<nav class="sdb_holder">
		     <c:if test="${userInfo.userLevel=='학생'}">
			   <h3>나의강의실</h3><hr>
				<ul>
				  <li><a href="#">나의 학사활동</a></li>
				  <li><a href="#">나의 학점관리</a></li>
				  <li><a href="#">과제 참여</a></li>
				  <li><a href="#">토론 참여</a></li>
				  <li><a href="#">성적 이의신청</a></li>
				  <li><a href="#">강의 평가</a></li>
				  <li><a href="#">수강 후기</a></li>
				</ul>
		    </c:if>
		    <c:if test="${userInfo.userLevel=='교수'}">
		      <h3>교무관리</h3><hr>
		     	 <ul>
		         <li><a href="#">학생성적조회</a></li>
		         <li><a href="#">학생성적관리</a></li>
		         <li><a href="#">성적이의신청관리</a></li>
		         <li><a href="#">담당개설과목관리</a></li>
		       </ul>
		    </c:if>
		    <c:if test="${userInfo.userLevel=='플래너'}">
		      <h3>업무관리</h3><hr>
		     	 <ul>
		         <li><a href="#">학습설계 관리</a></li>
		         <li><a href="#">담당학생 관리</a></li>
		         <li><a href="#">상담기록 관리</a></li>
		       </ul>
		    </c:if>
		</nav>
	</div>
	
	
	
	

</body>
</html>