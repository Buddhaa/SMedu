<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		<c:forEach var="lectureEvaluationCheck" items="${lectureEvaluationCheck}">
			$('input:radio[name=${lectureEvaluationCheck.lectureEvaluationItemsCode}]:input[value=' + ${lectureEvaluationCheck.lectureEvaluationScore} + ']').attr("checked", true);
			$("input[type='radio']").attr("disabled","disabled");
		</c:forEach>
		
		$("#openSubject").val("${selectbox}");
	
		$("#openSubject").change(function(){
			var openSubjectCode = $("#openSubject").val();
			location.replace('/classroomLectureEvaluationList?openSubjectCode=' + openSubjectCode);
		});		
		
		$("#evaluationButton").click(function(){
			if($(".evaluationRadio:checked").length == 5){
				
				var score = [];
				var item = [];
				
				for(var i = 1; i <= $(".evaluationRadio:checked").length; i++){
					
					item.push("lecture_evaluation_items_code"+i);
					score.push($("#lecture_evaluation_items_code"+i+":checked").val());
					
				}				
				
				location.href='/evaluationAdd?score=' + score + "&openSubjectCode=" + $("#openSubject").val() + "&item= " + item;
			}else{
				alert("평가항목을 모두 선택해주세요.");
			}
		})
	});
</script>
<style>

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}
</style>
<title>시커먼스</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/top.jsp" />	
	<div class="wrapper row3">
		<div class="hoc container clear">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/sidebar.jsp" />
			<div class="content three_quarter">
				<fieldset>
					<h1>강의평가</h1>
					<div class="col-md-5" style="padding-left:0;">
						<label>과목선택</label>
						<select class="form-control" id="openSubject">
							<c:forEach var="openSubjectSelect" items="${openSubjectSelect}" varStatus="status">
								<c:if test="${status.count eq 1 }">
									<option value="">${openSubjectSelect.year}년${openSubjectSelect.semester}학기${openSubjectSelect.cardinal}기</option>
								</c:if>
								<option value="${openSubjectSelect.openSubjectCode}">${openSubjectSelect.subjectName}</option>
							</c:forEach>
						</select>
					</div>	
					<br/>
					<br/>
					<br/>
						<table style=" width: 100%">
							<tr>
								<th>평가항목</th>
								<th>매우만족</th>
								<th>만족</th>
								<th>보통</th>
								<th>불만족</th>
								<th>매우불만족</th>
							</tr>	
							<c:forEach var="lectureEvaluationItemsList" items="${lectureEvaluationItemsList}" varStatus="status">
									<input type="hidden" value="" >
									<tr>
										<td>
											${status.count}.${lectureEvaluationItemsList.lectureEvaluationItems }
										</td>
										<td align="center">
											<input type="radio" value="5" class="evaluationRadio" id="${lectureEvaluationItemsList.lectureEvaluationItemsCode}" name="${lectureEvaluationItemsList.lectureEvaluationItemsCode}">
										</td>
										<td align="center">
											<input type="radio" value="4" class="evaluationRadio" id="${lectureEvaluationItemsList.lectureEvaluationItemsCode}" name="${lectureEvaluationItemsList.lectureEvaluationItemsCode}">
										</td>
										<td align="center">
											<input type="radio" value="3" class="evaluationRadio" id="${lectureEvaluationItemsList.lectureEvaluationItemsCode}" name="${lectureEvaluationItemsList.lectureEvaluationItemsCode}">
										</td>
										<td align="center">											
											<input type="radio" value="2" class="evaluationRadio" id="${lectureEvaluationItemsList.lectureEvaluationItemsCode}" name="${lectureEvaluationItemsList.lectureEvaluationItemsCode}">
										</td>
										<td align="center">
											<input type="radio" value="1" class="evaluationRadio" id="${lectureEvaluationItemsList.lectureEvaluationItemsCode}" name="${lectureEvaluationItemsList.lectureEvaluationItemsCode}">
										</td>
									</tr>
							</c:forEach>
						</table>
					<br/>
					<br/>
					<c:if test="${lectureEvaluationItemsList != null}">
						<c:choose>
							<c:when test="${lectureEvaluationCheck == '[]' }">
								<button type="button" id="evaluationButton" class="btn btn-default">평가하기</button>
							</c:when>
							
							<c:when test="${lectureEvaluationCheck != '' }">
								<span>이미 평가를 했습니다.</span>
							</c:when>
						</c:choose>
					</c:if>
				</fieldset>
			</div>
		</div>
	</div>	
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/smedu/module/foot.jsp" />
</body>
</html>