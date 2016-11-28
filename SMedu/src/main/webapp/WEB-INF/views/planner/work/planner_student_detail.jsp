<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
					<!-- 담당학생 상세보기 -->
	
	<h3>기수 : ${cardinalDomain.year}년 ${cardinalDomain.semester}학기 ${cardinalDomain.cardinal}기수</h3>
	<h3>과목 : ${openSubjectDomain.subjectName}</h3>
	<h3>이름 : ${userDomain.userName }</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>주차일정</th>
				<c:forEach var="academicCalendar" items="${academicCalendarList }" begin="0" end="4" step="1">
				<th>${academicCalendar.weeklySchedule}</th>
				</c:forEach>				
			</tr>	
		</thead>
		<tbody>
			<tr>
				<td>참여기간</td>
				<c:forEach var="academicCalendar" items="${academicCalendarList }" begin="0" end="4" step="1">
				<td>${academicCalendar.academicCalendarStartDay}~<br>${academicCalendar.academicCalendarEndDay}</td>
				</c:forEach>
			</tr>
			<tr>
				<td>출석여부</td>
				<c:forEach var="attendList" items="${attendList }" begin="0" end="4" step="1">
					<c:if test="${attendList.attendDate==null}">
						<td>X</td>
					</c:if>
					<c:if test="${attendList.attendDate!=null}">
						<td>O</td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td>출석날짜</td>
				<c:forEach var="attendList" items="${attendList }" begin="0" end="4" step="1">
				<td>${attendList.attendDate}</td>
				</c:forEach>
			</tr>
		</tbody>	
	</table>
	<table class="table table-hover">
		<thead>
			
			<tr>
				<th>주차일정</th>
				<c:forEach var="academicCalendar" items="${academicCalendarList }" begin="5" end="9" step="1">
				<th>${academicCalendar.weeklySchedule}</th>
				</c:forEach>				
			</tr>	
			<tr>
				<td>참여기간</td>
				<c:forEach var="academicCalendar" items="${academicCalendarList }" begin="5" end="9" step="1">
				<td>${academicCalendar.academicCalendarStartDay}~<br>${academicCalendar.academicCalendarEndDay}</td>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>출석여부</td>
				<c:forEach var="attendList" items="${attendList }" begin="5" end="9" step="1">
					<c:if test="${attendList.attendDate==null}">
						<td>X</td>
					</c:if>
					<c:if test="${attendList.attendDate!=null}">
						<td>O</td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td>출석날짜</td>
				<c:forEach var="attendList" items="${attendList }" begin="5" end="9" step="1">
				<td>${attendList.attendDate}</td>
				</c:forEach>
			</tr>
		</tbody>	
	</table>
	
	<h3>과제 참여 여부</h3>
	<c:if test="${taskResultDomain.taskResultDate!=null}">
	참여 여부: O <br>
	참여 날짜:${taskResultDomain.taskResultDate}
	</c:if>
	<c:if test="${taskResultDomain.taskResultDate==null}">
	참여 여부: X
	</c:if>
	
	<h3>토론 참여 여부</h3>
	<c:if test="${debateList[0].debateRegisterDate!=null}">
	참여 여부: O <br>
	최초 참여 날짜:	${debateList[0].debateRegisterDate}
	</c:if>
	<c:if test="${debateList[0].debateRegisterDate==null}">
	참여 여부: X
	</c:if>
	
	
	
</body>
</html>