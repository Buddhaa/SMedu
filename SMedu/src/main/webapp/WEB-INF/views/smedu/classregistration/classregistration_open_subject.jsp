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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function){
		
	});
</script>
<input type="hidden" id="cardinalCode" value="${cardinalCode}">
<input type="hidden" id="departmentCode" value="${departmentCode}">
<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="../module/classregistration_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>수강신청</h1><hr>
			<div id="content">				
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<c:forEach var="cardinalList" items="${cardinalList }" varStatus="status" >
					<c:if test="${cardinalList.cardinalCode == cardinalCode }">			
						<li class="active" aria-controls="tabs-${status.count}">					
							<a href="#tabs-${status.count}" data-toggle="tab" id="tabtab">														
								[${cardinalList.year }년도 ${cardinalList.semester }-${cardinalList.cardinal }학기]<br>
								개강일:${cardinalList.recruitStartDay }
							</a>						
						</li>
					</c:if>
					<c:if test="${cardinalList.cardinalCode != cardinalCode }">					
						<li aria-controls="tabs-${status.count}">					
							<a href="/smedu/classregistration/classregistrationOpenSubject?cardinalCode=${cardinalList.cardinalCode}">														
								[${cardinalList.year }년도 ${cardinalList.semester }-${cardinalList.cardinal }학기]<br>
								개강일:${cardinalList.recruitStartDay }
							</a>						
						</li>
					</c:if>
					</c:forEach>									
				</ul>
					<div id="my-tab-content" class="tab-content">
						<c:forEach var="cardinalList" items="${cardinalList }" varStatus="status">
						<c:if test="${cardinalList.cardinalCode == cardinalCode}">
						<div class="tab-pane active" id="tabs-${status.count}">					
						<table class="table">
							<tr>
								<td><a href="/smedu/classregistration/classregistrationOpenSubject?cardinalCode=${cardinalList.cardinalCode}">
								전체과정
								</a></td>
								<c:forEach var="departmentList" items="${departmentList}"> 
								<td>
								<a href="/smedu/classregistration/classregistrationOpenSubject?cardinalCode=${cardinalList.cardinalCode}&departmentCode=${departmentList.departmentCode}">
								${departmentList.departmentName}
								</a>
								</td>
								</c:forEach>
							</tr>
						</table>
							<div class="row">
								<div class="col-lg-12">
									<table class="table">
										<tr>
											<td style="width: 10px"></td>
											<td>구분</td>
											<td>강좌명</td>
											<td>교수명</td>
											<td>학점</td>
											<td>수강료</td>
										</tr>
										
										<c:forEach var="openSubjectList" items="${openSubjectList}">
										<tr>
											<td><input type="checkbox"></td>
											<td>${openSubjectList.subjectSort}</td>
											<td>${openSubjectList.subjectName}</td>
											<td>${openSubjectList.professorName}</td>
											<td>${openSubjectList.subjectCredit}</td>
											<td>${openSubjectList.subjectPay}</td>
										</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div style="height:80px; border:solid; background-color:#6195C3;" align="center"><a href=""><font color="#ffffff" size="3px"><b>
					<br>
					강좌바구니에 담기<br>
					<br>
				</b></font></a>
				</div>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>