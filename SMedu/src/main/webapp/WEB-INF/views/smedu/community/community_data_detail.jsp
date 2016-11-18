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
			<jsp:include page="../module/community_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>자료실</h1><hr>
			<table class="table">
				<tr>
					<td>제목</td>
					<td colspan="5">${communityDataDetail.boardArticleTitle}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${communityDataDetail.boardArticleWriter}</td>
					<td>작성일</td>
					<td>${communityDataDetail.boardArticleDate}</td>
					<td>조회수</td>
					<td>${communityDataDetail.boardArticleReadCount}</td>
				</tr>
			</table>
			<br>
			<pre style="white-space: pre-wrap;">${communityDataDetail.boardArticleContent}</pre>
	   

      		<div class="fl_right">
	   			<a href="/smedu/community/communityDataDetail"><input type="button" value="목록" class="btn btn-default"></a>
	   		</div>
	   		
		   
      
      
      
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>