<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<title>시커먼스</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/smedu/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#openSubjectCategory').hide();
		
		$(function() {
			$('#openSubjectManage').on('click', openSubjectManage);
		
		});		
		function openSubjectManage() {
			
			$('#openSubjectCategory').show();
		}	
	});

</script>
</head>
<body>
	<div class="sidebar one_quarter first">
		<nav class="sdb_holder">
		     <c:if test="${userInfo.userLevel=='학생'}">
			   <h3>나의강의실</h3><hr>
				<ul>
				  <li><a href="/classroomAcademicActivity">나의 학사활동</a></li>
				  <li><a href="/classroomCreditManage">나의 학점관리</a></li>
				  <li><a href="/classroomTaskJoin">과제 참여</a></li>
				  <li><a href="/classroomDebateJoin">토론 참여</a></li>
				  <li><a href="/classroomObjection">성적 이의신청</a></li>
				  <li><a href="/classroomLectureEvaluationList">강의 평가</a></li>
				  <li><a href="/classroomLectureReview">수강 후기</a></li>
				</ul>
		    </c:if>
		    <c:if test="${userInfo.userLevel=='교수'}">
		      <h3>교무관리</h3><hr>
		     	 <ul>
		         <li><a href="/professorSubjectSelectForCheck">학생성적조회</a></li>
		         <li><a href="/professorSubjectSelectForManage">학생성적관리</a></li>
		         <li><a href="/professorSubjectSelectForObjection">성적이의신청관리</a></li>
		         <li><a href="#" onclick="openSubjectManage" id="openSubjectManage">담당개설과목관리</a>
					<div id="openSubjectCategory">
					<ul>
		         		<li><a href="/professorSubjectSelectForLecture">강의 관리</a></li>
		         		<li><a href="/professorSubjectSelectForExam">시험 관리</a></li>
		         		<li><a href="/professorSubjectSelectForDebate">토론 관리</a></li>
		         		<li><a href="/professorSubjectSelectForTask">과제 관리</a></li>
					</ul>
					</div>
		         </li>
		       </ul>
		    </c:if>
		    <c:if test="${userInfo.userLevel=='플래너'}">
		      <h3>업무관리</h3><hr>
		     	 <ul>
		         <li><a href="/planner/work/planner_learningplan_nonresponse">학습설계 관리</a></li>
		          <li><a href="/planner/work/planner_student_list">담당학생 관리</a></li>
		          <li><a href="/planner/work/planner_consult_list">상담기록 관리</a></li>
		       </ul>
		    </c:if>
		</nav>
	</div>	
</body>
</html>