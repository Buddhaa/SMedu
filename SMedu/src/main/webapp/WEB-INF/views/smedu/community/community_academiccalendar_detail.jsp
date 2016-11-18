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
			<table class="table">
				<tr>
					<td>제목</td>
					<td colspan="3">${cardinal.year}년 ${cardinal.semester}학기 ${cardinal.cardinal}기</td>
				</tr>
				<tr>
					<td>번호</td>
					<c:set var="communityAcademiccalendarListSubstr" value="${cardinal.cardinalCode}" />
	                <td>${fn:substring(communityAcademiccalendarListSubstr, 13, 20)}</td>
					<td>작성자</td>
					<td>관리자</td>
				</tr>
			</table>	
			
			<table class="table table-striped">
            <thead>
            <tr>
              <th>주차일정</th>
              <th>시작일</th>
              <th>종료일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="academicCalendar" items="${academicCalendarList}">
	            <tr>
	              <td>${academicCalendar.weeklySchedule}</td>
	              <td>${academicCalendar.academicCalendarStartDay}</td>
	              <td>${academicCalendar.academicCalendarEndDay}</td>
	            </tr>    
            </c:forEach>        
            </tbody>
          </table>	
          
          	<div class="fl_right">
	   			<a href="/smedu/community/communityAcademiccalendarList">
	   			<input type="button" value="목록" class="btn btn-default">
	   			</a>
	   		</div>	
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>
