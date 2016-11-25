<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	 $("#openSubjectBtn").click(function(){
		 var check = $(".check");
			//체크값 확인 변수 
			var sum = 0;
			//반복문을 통해 check크기만큼 반복 
			for (var i = 0; i < check.length; i++) {
				//만약 check중 하나라도 체크가 되어있지 않으면 
				if (check[i].checked == true) {
					sum += 1;
				}
			}
/* 			console.log(sum);
			console.log(check.length); */
			if (sum != 0) {
				$("#openSubjectForm").submit();
			} else {
				alert('한개이상 수강을 신청하세요');
			}
	 });
	 
	 $(".check").click(function(){
		 var idx = $(this).index();
		 var totalPay = Number($('#totalPay').text());
		 var totalCredit = Number($('#totalCredit').text());
		 var thisPay = Number($('.pay').eq(idx).text());
		 var thisCredit = Number($('.credit').eq(idx).text());
		 if($(this).is(':checked')){
			 $('#totalPay').text(totalPay+thisPay);
			 $('#totalCredit').text(totalCredit+thisCredit);
		 }else{
			 $('#totalPay').text(totalPay-thisPay); 
			 $('#totalCredit').text(totalCredit-thisCredit);
		 }
	 });
});
</script>
</head>
<body>
<jsp:include page="../module/top.jsp" />
<input type="hidden" id="cardinalCode" name="cardinalCode" value="${cardinalCode}">
<input type="hidden" id="departmentCode" value="${departmentCode}">
<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="../module/classregistration_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>수강신청</h1><hr>
			<form id="openSubjectForm" class="form-horizontal" action="/smedu/classregistration/classregistrationPaySubject" method="post">
			<input type="hidden" id="cardinalCode" name="cardinalCode" value="${cardinalCode}">
			<fieldset>
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
						<br>
						<p>※수강신청 유의사항※</p>
						<p>▶별도의 서류 제출 없이 온라인으로 수강 신청이 가능합니다. (100% 온라인 수업 진행)</p>
						<p>▶한 학기 최대 24학점(8과목), 연간 최대 42학점(14과목)까지만 수강이 가능합니다.</p>
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
											<td><input type="checkbox" class="check" name="openSubjectCode" value="${openSubjectList.openSubjectCode}"></td>
											<td>${openSubjectList.subjectSort}</td>
											<td>
											<a href="#"
											onclick="javascript:window.open('/smedu/classregistration/classregistrationSubjectInfo?subjectCode=${openSubjectList.subjectCode }', 'subjectCode', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')">
											${openSubjectList.subjectName}
											</a>
											</td>
											<td>
											<a href="#"
											onclick="javascript:window.open('/smedu/classregistration/classregistrationProfessorInfo?professorCode=${openSubjectList.professorCode }', 'professorCode', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-560)/2+', width=600, height=530')">
											${openSubjectList.professorName}
											</a>
											</td>
											<td class="credit">${openSubjectList.subjectCredit}</td>
											<td class="pay">${openSubjectList.subjectPay}</td>
										</tr>
										</c:forEach>
										<tr>
											<td colspan="4"></td>
											<td style="width: 100px;">이수학점:<span id="totalCredit">0</span></td>
											<td style="width: 200px;">총금액:<span id="totalPay">0</span>원</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<button id="openSubjectBtn" type="button" style="height:80px; width:730px; border:solid; background-color:#6195C3;"><font color="#ffffff" size="3px"><b>
					<br>
					강좌바구니에 담기<br>
					<br>
				</b></font>
				</button>
				</fieldset>
				</form>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>