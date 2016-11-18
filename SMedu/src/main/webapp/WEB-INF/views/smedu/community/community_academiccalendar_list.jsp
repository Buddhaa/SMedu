<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		  <h1>학사일정</h1><hr>
			<table class="table table-bordered">
		      <tr>
                  <th>번호</th>
                  <th>기수</th>
                  <th>모집 시작일</th>
                  <th>모집 종료일</th>
                  <th>수강 시작일</th>
                  <th>수강 종료일</th>
                  <th></th>
                </tr>
                <c:forEach var="communityAcademiccalendarList" items="${communityAcademiccalendarList}">
	            <c:set var="communityAcademiccalendarListSubstr" value="${communityAcademiccalendarList.cardinalCode}" />
	                <tr>
	                  <td>${fn:substring(communityAcademiccalendarListSubstr, 13, 20)}</td>
	                  <td>${communityAcademiccalendarList.year}년 ${communityAcademiccalendarList.semester}학기 ${communityAcademiccalendarList.cardinal}기수</td>
	                  <td>${communityAcademiccalendarList.recruitStartDay}</td>
	                  <td>${communityAcademiccalendarList.recruitEndDay}</td>
	                  <td>${communityAcademiccalendarList.classStartDay}</td>
	                  <td>${communityAcademiccalendarList.classEndDay}</td>
	                  <td><a href="/smedu/community/communityAcademiccalendarDetail?cardinalCode=${communityAcademiccalendarList.cardinalCode}"><span class="label label-primary">일정확인</span></a></td>
	                </tr>
                </c:forEach>
		  	</table>
	   

      <div class="fl_right">
	   			<a href=""><input type="button" value="목록" class="btn btn-default"></a>
	   		</div>
	   		
		   <nav class="pagination">
	        <ul>
			<c:if test="${page>1}">
				<li><a href="/smedu/community/communityDataList?page=${page-1}">◀</a></li>
			</c:if>
			
			<c:forEach var="pageIndex" begin="${startPage}" end="${lastPage}" >
				<c:if test="${page==pageIndex}">
				<li class="current"><strong>${pageIndex}</strong></li>
				</c:if>
				<c:if test="${page!=pageIndex}">
				<li><a href="/smedu/community/communityDataList?page=${pageIndex}">${pageIndex}</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${page<lastPage}">
			<li><a href="/smedu/community/communityDataList?page=${page+1}">▶</a></li>
			</c:if>
			 </ul>
	      </nav>
	     
	   		
			<div class="container">
				<div class="row">
					<div class="col-sm-4 col-sm-offset-2">
						<div id="imaginary_container"> 
							<form action="/smedu/community/communityAcademiccalendarList">
								<div class="input-group stylish-input-group">
									<input type="text" class="form-control"  placeholder="Search" name="word">
									<span class="input-group-addon">
										<button type="submit"><span class="glyphicon glyphicon-search"></span></button>  
									</span>  
								</div>
							</form>
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
