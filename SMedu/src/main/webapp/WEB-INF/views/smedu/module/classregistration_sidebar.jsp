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
		<nav class="sdb_holder">
			<h3>수강신청</h3><hr>
			<ul>
				<li><a href="/smedu/classregistration/classregistrationOpenSubject">수강신청</a></li>
         		 <c:if test="${userInfo.userLevel==null}">
		      	  	<li><a href="/smedu/main/loginForm">신청/결제</a></li>
		          	<li><a href="/smedu/main/loginForm">결제 이력 페이지</a></li>
		        </c:if>
		        <c:if test="${userInfo.userLevel !=null}">
		          	<li><a href="/smedu/classregistration/classregistrationPaySubject">신청/결제</a></li>
		          	<li><a href="/smedu/classregistration/classregistrationPayHistory">결제 이력 페이지</a></li>
          		</c:if>
			</ul>
		</nav>
	</div>
</body>
</html>