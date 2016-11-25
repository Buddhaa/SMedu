<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron text-center">
	<p>프로젝트명:시커먼스 사이버 평생 교육원</p>
	<p>팀원 : 김의기(24) 이진호(28), 김우영(28), 박장용(26), 장현호(23)</p>
	<p>소속기관 : 한국 스마트 정보 교육원 <a href="http://www.ksmart.or.kr">www.ksmart.or.kr</a></p> 
	<p>전화번호 : 063 - 717 - 1008</p> 
	<p>주소 : 전북 전주시 덕진구 기린대로 446(금암동 708-16) 2층 한국스마트정보교육원</p>
	<p>호스팅 주소 : <a href="http://buddhaa.cafe24.com">buddhaa.cafe24.com</a></p>
	<p>개발환경 : java1.7, HTML5, JQuery 3.1.0, SpringFramework4.0.9, Jackson(JSON) 2.4.3, CSS, 
	<br>
	bootstrap 3.3.6, Mybatis 3.2.8, mysql 5.1.34, mysql-Workbench 6.3, servlet 3.1.0, jsp 2.2, jstl 1.2,
	<br>
	Apache Tomcat 8.0, Spring Tool Suite 3.7.3, JRebel for Eclipse 6.4.7, Git
	</p>
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-6">
      <h3>사용자 페이지</h3>
     	<a href="/smedu/main/main">
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/smedu.png" width="500px" height="300px">
		</a>
    </div>
    <div class="col-sm-6">
      <h3>관리자 페이지</h3>
     	<a href="/admin/login/loginForm">
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/admin.png" width="500px" height="300px">
		</a>
    </div>
  </div>
</div>

</body>
</html>
