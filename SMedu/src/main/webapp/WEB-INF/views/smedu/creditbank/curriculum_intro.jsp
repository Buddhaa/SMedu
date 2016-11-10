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
			<jsp:include page="../module/creditbank_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>교육과정</h1><hr>
		  	<div id="content">
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<li class="active"><a href="#all" data-toggle="tab">전체과정</a></li>
					<li><a href="#computer" data-toggle="tab">컴퓨터공학과</a></li>
					<li><a href="#communication" data-toggle="tab">정보통신학과</a></li>
					<li><a href="#security" data-toggle="tab">정보보안학과</a></li>
				</ul>
					<div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="all">
							<div class="row">
								<div class="col-lg-12">
									<table class="table">
										<tr>
											<td>구분</td>
											<td>강좌명</td>
											<td>학점</td>
											<td>수강료</td>
										</tr>
										<c:forEach var="subject" items="${subjectList}">
											<tr>
												<td>${subject.subjectSort }</td>
												<td>${subject.subjectName }</td>
												<td>${subject.subjectCredit }</td>
												<td>${subject.subjectPay }원</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="computer">
							<div class="row">
								<div class="col-lg-12">
									<table class="table">
										<tr>
											<td>구분</td>
											<td>강좌명</td>
											<td>학점</td>
											<td>수강료</td>
										</tr>
										<c:forEach var="subject" items="${subjectList}">
											<c:if test="${subject.departmentCode=='department_code2'}">
												<tr>
													<td>${subject.subjectSort }</td>
													<td>${subject.subjectName }</td>
													<td>${subject.subjectCredit }</td>
													<td>${subject.subjectPay }원</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="communication">
							<div class="row">
								<div class="col-lg-12">
									<table class="table">
										<tr>
											<td>구분</td>
											<td>강좌명</td>
											<td>학점</td>
											<td>수강료</td>
										</tr>
										<c:forEach var="subject" items="${subjectList}">
											<c:if test="${subject.departmentCode=='department_code1'}">
												<tr>
													<td>${subject.subjectSort }</td>
													<td>${subject.subjectName }</td>
													<td>${subject.subjectCredit }</td>
													<td>${subject.subjectPay }원</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="security">
							<div class="row">
								<div class="col-lg-12">
									<table class="table">
										<tr>
											<td>구분</td>
											<td>강좌명</td>
											<td>학점</td>
											<td>수강료</td>
										</tr>
										<c:forEach var="subject" items="${subjectList}">
											<c:if test="${subject.departmentCode == 'department_code3'}">
												<tr>
													<td>${subject.subjectSort }</td>
													<td>${subject.subjectName }</td>
													<td>${subject.subjectCredit }</td>
													<td>${subject.subjectPay }원</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
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
