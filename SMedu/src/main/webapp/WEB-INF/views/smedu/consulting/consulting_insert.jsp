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
		  	<form action="">
		  		<table class="table">
					<tr>
						<td>제목</td>
						<td>
							<input name="boardArticleTitle" type="text" class="form-control input-md">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input name="applicantName" type="text" class="form-control input-md">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
						<textarea class="form-control" rows="10" name="boardArticleContent"></textarea>
						</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>
							<input name="applicantName" type="text" class="" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>파일등록</td>
						<td>
							<input type="file">
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							 <button class="btn btn-default" id="#">신청하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>