<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>시커먼스</title>
</head>
<body id="top">
<!-- bady -->
<jsp:include page="../module/top.jsp" />


<div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">

	    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
	      <ol class="carousel-indicators">
	        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	      </ol>
	
	      <!-- Wrapper for slides -->
	      <div class="carousel-inner">
	        <div class="item active">
	          <img src="/resources/smedu/images/demo/backgrounds/bnr_bestSystem.jpg" alt="...">
	          <div class="carousel-caption">
	          </div>
	        </div>
	        <div class="item">
	          <img src="/resources/smedu/images/demo/backgrounds/bnr_bestSystem1.jpg" alt="...">
	          <div class="carousel-caption">
	          </div>
	        </div>
	        <div class="item">
	          <img src="/resources/smedu/images/demo/backgrounds/bnr_bestSystem2.png" alt="...">
	          <div class="carousel-caption">
	          </div>
	        </div>
	      </div>
	    </div>
	</div>
</div>

<div class="wrapper row3">
  <div class="hoc container clear"> 
    <div class="posts">
      <div class="group btmspace-50 demo">
        <div class="one_quarter first">
        	<div>
			<img alt="" src="/resources/smedu/images/demo/gallery/sub_bannerhome2.gif">
			</div><br>
			<div>
			<img alt="" src="/resources/smedu/images/demo/gallery/sub_bannerhome3.gif">
			</div><br>
			<div>
			<a href=""><img alt="" src="/resources/smedu/images/demo/backgrounds/n_main_sub_01.png"></a>
			</div>
		</div>
         <div class="three_quarter">
         				<div id="content">
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<li class="active"><a href="#red" data-toggle="tab">공지사항</a></li>
					<li><a href="#orange" data-toggle="tab">학사일정</a></li>
					<li><a href="#yellow" data-toggle="tab">수강후기</a></li>
				</ul>
					<div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="red">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered table-hover" id="tableAddRow">
										<thead>
											<tr>
												<th>공지사항</th>
												<th style="width: 100px">
													<a href="/smedu/community/communityNoticeList">
														<span class="glyphicon glyphicon-plus addBtn" id="addBtn_0"></span>
													</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="communityNoticeList" items="${communityNoticeList }">
											<tr id="tr_0">
												<td valign="top" align="left">
													<a href="/smedu/community/communityNoticeDetail?boardArticleCode=${communityNoticeList.boardArticleCode }">
													<img alt="" src="/resources/smedu/images/demo/backgrounds/ico_notice.gif">
													${communityNoticeList.boardArticleTitle }
													</a>
												</td>
												<td valign="top" align="right">
												${communityNoticeList.boardArticleDate }
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="orange">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered table-hover" id="tableAddRow">
										<thead>
											<tr>
								                <th>기수</th>
								                <th>모집 시작일</th>
								                <th>모집 종료일</th>
								                <th>수강 시작일</th>
								                <th>수강 종료일</th>
												<th style="width: 90px">
													<a href="/smedu/community/communityAcademiccalendarList">
														<span class="glyphicon glyphicon-plus addBtn" id="addBtn_0"></span>
													</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="selectMainAcademicCalendarList" items="${selectMainAcademicCalendarList}">
								                <tr id="tr_0">
								                  <td>${selectMainAcademicCalendarList.year}년 ${selectMainAcademicCalendarList.semester}학기 ${selectMainAcademicCalendarList.cardinal}기수</td>
								                  <td>${selectMainAcademicCalendarList.recruitStartDay}</td>
								                  <td>${selectMainAcademicCalendarList.recruitEndDay}</td>
								                  <td>${selectMainAcademicCalendarList.classStartDay}</td>
								                  <td>${selectMainAcademicCalendarList.classEndDay}</td>
								                  <td><a href="/smedu/community/communityAcademiccalendarDetail?cardinalCode=${selectMainAcademicCalendarList.cardinalCode}"><span class="label label-primary">일정확인</span></a></td>
								                </tr>
							                </c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="yellow">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered table-hover" id="tableAddRow">
										<thead>
											<tr>
												<th>수강후기</th>
												<th style="width: 100px">
													<a href="/smedu/community/communityLectureReviewList">
														<span class="glyphicon glyphicon-plus addBtn" id="addBtn_0"></span>
													</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="communityLectureReviewList" items="${communityLectureReviewList }">
												<tr id="tr_0">
													
													<td valign="top" align="left">
														<a href="/smedu/community/communityLectureReviewDetail?boardArticleCode=${communityLectureReviewList.boardArticleCode }">
															${communityLectureReviewList.boardArticleTitle }
														</a>
													</td>
													
													<td valign="top" align="right">${communityLectureReviewList.boardArticleDate }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
      <!--   <div class="one_quarter">
        
		</div> -->
      </div>
    </div>
  </div>
</div>

<div class="wrapper row3">
  <div class="hoc container clear"> 
	<div class="group demo">
		<div class="one_third first">
         	<span>
         	<a href="/smedu/curriculum/curriculumComputer">
         	<img src="/resources/smedu/images/demo/gallery/lec_comtuper_a.JPG" 
			onmouseover="this.src='/resources/smedu/images/demo/gallery/lec_comtuper_b.jpg'"
			onmouseout="this.src='/resources/smedu/images/demo/gallery/lec_comtuper_a.JPG'" border="0">
			</a>
			</span>&nbsp;
			
			<span>
			<a href="/smedu/curriculum/curriculumCommunication">
         	<img src="/resources/smedu/images/demo/gallery/lec_communication_a.gif" 
			onmouseover="this.src='/resources/smedu/images/demo/gallery/lec_communication_b.png'"
			onmouseout="this.src='/resources/smedu/images/demo/gallery/lec_communication_a.gif'" border="0">
			</a>
			</span>&nbsp;

			<span>
			<a href="/smedu/curriculum/curriculumSecurity">
         	<img src="/resources/smedu/images/demo/gallery/lec_security_a.jpg" 
			onmouseover="this.src='/resources/smedu/images/demo/gallery/lec_security_b.jpg'"
			onmouseout="this.src='/resources/smedu/images/demo/gallery/lec_security_a.jpg'" border="0">
			</a>
			</span>
		</div>
			<div class="two_third">
				<a href=""></a>
			</div>
		</div>
	</div>
</div><br>



<jsp:include page="../module/foot.jsp" />
</body>
</html>