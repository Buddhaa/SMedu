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
	<p>프로젝트명:Spring Framework를 기반으로 한 국가평생교육진흥원 학점은행제 사이버 평생교육원</p>	
	<p>팀원 : 김의기(24) 이진호(28), 김우영(28), 박장용(26), 장현호(23)</p>
	<p>소속기관 : 한국 스마트 정보 교육원 <a href="http://www.ksmart.or.kr">www.ksmart.or.kr</a></p> 
	<p>전화번호 : 063 - 717 - 1008</p> 
	<p>주소 : 전북 전주시 덕진구 기린대로 446(금암동 708-16) 2층 한국스마트정보교육원</p>
	<p>호스팅 주소 : <a href="http://buddhaa.cafe24.com">buddhaa.cafe24.com</a></p>
	<p>개발목적:사용자가 ‘학습설계→강의수강→학위취득’에 이르기까지 편리하게 학사활동을 할 수 있도록 합니다.<br>
	학사활동 이후 수강후기, 강의평가 등 사용자의 평가를 수렴하여 더 나은 서비스를 제공합니다.</p>
	<p>개발환경 : java1.7, HTML5, JQuery 3.1.0, SpringFramework4.1.1, CSS, 
	<br>
	bootstrap 3.3.6, Mybatis 3.2.8, Mysql 5.1.34, Mysql-Workbench 6.3, Servlet 3.1.0, jsp 2.1, jstl 1.2,
	<br>
	Apache Tomcat 8.0.36, Spring Tool Suite 3.7.3, JRebel for Eclipse 6.4.7, Git
	</p><br>
	<h2>＊ 본 프로젝트는 Chrome에 최적화 되어있습니다.</h2>
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
    
    <div class="col-sm-12">
      <h3>ERD 논리모드</h3>
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/logic.png">
    </div>
    <div class="col-sm-12">
      <h3>ERD 물리모드</h3>
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/physics.png">
    </div>
    
    <div class="col-sm-12">
      <h3>업무 흐름도</h3>
      	<img alt="로고" src="/resources/smedu/images/demo/backgrounds/nomember_process.png">
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/student_process.JPG" width="1300px">
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/professor_process.JPG" width="1300px">
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/planner_process.JPG" width="1000px">
		<img alt="로고" src="/resources/smedu/images/demo/backgrounds/admin_process.png" width="1300px">
    </div>
  </div>
</div>

</body>
</html>
