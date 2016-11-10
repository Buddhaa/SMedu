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
<jsp:include page="../module/top.jsp" />

<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="../module/consulting_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>상담신청</h1><hr>
		  	<table class="table table-bordered">
		      <tr>
		        <td>번호</td>
		        <td>제목</td>
		        <td>작성일</td>
		        <td>작성자</td>
		        <td>조회수</td>
		      </tr>
		 
	  		<c:forEach var="consultingList" items="${boardConsultingList}">
	  			<tr>
			        <td>${consultingList.boardArticleCode}</td>
			        <td>${consultingList.boardArticleTitle}</td>
			        <td>${consultingList.boardArticleDate}</td>
			        <td>${consultingList.boardArticleWriter}</td>
			        <td>${consultingList.boardArticleReadCount}</td>
			     </tr>
	  		</c:forEach>
		  	</table>
		  		
		  	<div class="form-group">
			  	<label class="col-md-1 control">검색 :</label> 
			  <div class="col-md-4">
			   
			  <input id="userPw" type="password" class="form-control input-md">
			  </div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>