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
    <div id="plannerStudent">
        <h2>담당학생 상세보기</h2>
        <form action="/planner/work/planner_student_detail"
		method="post" name="studentDetail" id="studentDetail">
        <table>
            <tr>
                <td>학과</td>
                <td>이름</td>
                <td>생일</td>
                <td>성별</td>
                <td>주소</td>
                <td>연락처</td>
                <td>이메일</td>
                <td>학력</td>
            </tr>   
            <c:forEach var="u" items="${studentCode}">
				<tr>
				    <td>${u.departmentCode}</td>
				    <td>${u.userName}</td>
				    <td>${u.userBirth}</td>
				    <td>${u.userGender}</td>
				    <td>${u.userAddress}</td>
				    <td>${u.userPhone}</td>
				    <td>${u.userEmail}</td>
				    <td>${u.userEducational}</td>  
				  </tr>
			</c:forEach> 
        </table>
        </form>
       <ul class="pager">
      	 <li><a href="/smedu/main/main">홈으로</a></li>
		    <li><a href="/planner/work/planner_learningplan_nonresponse">미답변 목록 이동</a></li>  
		</ul>
    </div>
</body>
</html>