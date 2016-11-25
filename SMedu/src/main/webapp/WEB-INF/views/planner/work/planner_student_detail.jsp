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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />					
    
    <div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
    	<div class="content three_quarter"> 
    
        <h1>담당학생 상세보기</h1><hr/>
        <form action="/planner/work/planner_student_detail" method="post">
		<input type="hidden" name="studentCode" value="${s.studentCode}">
   	<table class="table table-bordered">
   	<thead>
            <tr>
                <th>이름</th>
                <th>출석날짜</th>
                <th>시험응시날짜</th>
                <th>토론답변날짜</th>
                <th>과제제출날짜</th>
            </tr>   
            <c:forEach var="s" items="${studentDetail}">
				<tr>
				    <td>${s.userName}</td>
				    <td>${s.attendDate}</td>
				    <td>${s.examDate}</td>
				    <td>${s.debateRegisterDate}</td>
				    <td>${s.taskResultDate}</td>
				 </tr>
			</c:forEach> 
		</thead>	
        </table>
        </form>
       		<ul class="pager">
      	 		<li><a href="/planner/work/planner_student_list">이전</a></li>	   
			</ul>
    </div>
    </div>
   </div>
</body>
</html>