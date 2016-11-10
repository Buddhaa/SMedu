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
			<jsp:include page="../module/introduction_sidebar.jsp" />
		<div class="content three_quarter">
			<h1>사이트 맵</h1><hr>
			<table class="table">
				<tr>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img01.png">
						</div><br>
						<div>
					      	<ul>
					          <li><a href="/smedu/introduction/introductionProject">프로젝트소개</a></li>
					       	  <li><a href="/smedu/introduction/introductionAcademy">교육원 소개</a></li>
					       	  <li><a href="/smedu/introduction/roadMap">찾아오시는 길</a></li>
					       	  <li><a href="/smedu/introduction/siteMap">사이트 맵</a></li>
					        </ul>
						</div>
					</td>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img_02.png">
						</div><br>
						<div>
					      	<ul>
								<li><a href="/smedu/creditbank/creditbankIntro">학점은행제소개</a>
								<li><a href="/smedu/creditbank/creditbankRecognitionSubject">학점취득과정</a>
					          	<li><a href="/smedu/creditbank/curriculumIntro">교육과정</a></li>
								<li><a href="/smedu/creditbank/creditbankPrecaution">학점인정주의사항</a>
					          	<li><a href="/smedu/creditbank/creditbankOrientation">오리엔테이션</a></li>
								<li><a href="/smedu/creditbank/creditbankLectureWay">강의수강방법</a></li>
								<li><a href="/smedu/creditbank/creditbankAttendWay">출석률확인방법</a></li>
					        </ul>
						</div>
					</td>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img_06.png">
						</div><br>
						<div>
					      	<ul>
					         <li><a href="/smedu/curriculum/curriculumComputer">컴퓨터공학과</a></li>
					         <li><a href="/smedu/curriculum/curriculumCommunication">정보통신학과</a></li>
					         <li><a href="/smedu/curriculum/curriculumSecurity">정보보안학과</a></li>
					       </ul>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img03.png">
						</div><br>
						<div>
					      	<ul>
					          <li><a href="#">수강신청</a></li>
					          <li><a href="#">신청/결제</a></li>
					          <li><a href="#">결제 이력 페이지</a></li>
					        </ul>
						</div>
					</td>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img04.png">
						</div><br>	
						<div>
					      	<ul>
					          <li><a href="/smedu/consulting/consultingInsert">상담신청</a></li>
					          <li><a href="/smedu/consulting/consultingLearningPlanInsert">학습설계</a></li>
					          <li><a href="#">상담게시판</a></li>
					        </ul>
						</div>
					</td>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img05.png">
						</div><br>	
						<div>
					      	<ul>
					          <li><a href="#">공지사항</a></li>
					          <li><a href="#">FAQ</a></li>
					          <li><a href="#">자료실</a></li>
					          <li><a href="#">학사일정</a></li>
					          <li><a href="#">수강후기</a></li>
					        </ul>	
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img07.png">
						</div><br>	
						<div>
					      <c:if test="${userInfo.userLevel==null}">
						      	 <ul>
						          <li><a href="#">나의 학사활동</a></li>
						          <li><a href="#">나의 학점관리</a></li>
						          <li><a href="#">과제 참여</a></li>
						          <li><a href="#">토론 참여</a></li>
						          <li><a href="#">성적 이의신청</a></li>
						          <li><a href="#">강의 평가</a></li>
						          <li><a href="#">수강 후기</a></li>
						        </ul>
					      </c:if>
					      <c:if test="${userInfo.userLevel=='학생'}">
						      	 <ul>
						          <li><a href="#">나의 학사활동</a></li>
						          <li><a href="#">나의 학점관리</a></li>
						          <li><a href="#">과제 참여</a></li>
						          <li><a href="#">토론 참여</a></li>
						          <li><a href="#">성적 이의신청</a></li>
						          <li><a href="#">강의 평가</a></li>
						          <li><a href="#">수강 후기</a></li>
						        </ul>
					      </c:if>
					      <c:if test="${userInfo.userLevel=='교수'}">
						      	 <ul>
						          <li><a href="/professorSubjectSelect">학생성적조회</a></li>
						          <li><a href="#">학생성적관리</a></li>
						          <li><a href="#">성적이의신청관리</a></li>
						          <li><a href="#">담당개설과목관리</a></li>
						        </ul>
					      </c:if>
					      <c:if test="${userInfo.userLevel=='플래너'}">
						      	 <ul>
						          <li><a href="#">학습설계 관리</a></li>
						          <li><a href="#">담당학생 관리</a></li>
						          <li><a href="#">상담기록 관리</a></li>
						        </ul>
					      </c:if>
						</div>
					</td>
					<td>
						<div align="center">		
							<img alt="" src="/resources/smedu/images/demo/icon/img08.png">
						</div><br>	
						<div>
					      	<c:if test="${userInfo.userLevel==null}">
								<ul>
									<li><a href="/smedu/main/loginForm">로그인</a></li>
					       			<li><a href="/smedu/main/signUpUser">회원가입</a></li>
									<li><a href="/smedu/main/personalInformation">개인정보취급방침</a></li>
									<li><a href="/smedu/main/agreement">이용약관</a></li>
								</ul>
							 </c:if>
							 <c:if test="${userInfo.userLevel =='학생'}">
								<ul>
									<li><a href="/studentInfo">회원정보수정</a></li>
					       			<li><a href="/userDelete">회원탈퇴</a></li>
					       			<li><a href="/classroomAcademicActivity">나의 학사활동</a></li>
					       			<li><a href="/finalResultGrade">이수학점관리</a></li>
					       			<li><a href="/studentconsultingHistory">나의 상담내역</a></li>
								</ul>
							 </c:if>
							 <c:if test="${userInfo.userLevel=='교수'}">
									<ul>
										<li><a href="/professorInfo">회원정보수정</a></li>
						       			<li><a href="/userDelete">회원탈퇴</a></li>
									</ul>
							 </c:if>
							 <c:if test="${userInfo.userLevel=='플래너'}">
									<ul>
										<li><a href="#">회원정보수정</a></li>
						       			<li><a href="/userDelete">회원탈퇴</a></li>
									</ul>
							 </c:if>
						</div>
					</td>
					<td>
						<div>		
						</div>	
						<div>
					      	
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>