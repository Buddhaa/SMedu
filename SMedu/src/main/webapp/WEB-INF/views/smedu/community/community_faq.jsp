<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<jsp:include page="../module/community_sidebar.jsp" />
    	<div class="content three_quarter"> 
		  <h1>F A Q</h1><hr>
			<div>
			<table class="table table-bordered">
		      
		 
	  		
		  	</table>
	   		</div>
	   		
	   		
	   		 <div id="content">
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<li class="active"><a href="#creditbank" data-toggle="tab">학점은행제</a></li>
					<li><a href="#userInfo" data-toggle="tab">회원정보</a></li>
					<li><a href="#consultingLearningPlan" data-toggle="tab">맞춤학습설계</a></li>
					<li><a href="#classregistrationOpenSubject" data-toggle="tab">수강신청</a></li>
					<li><a href="#payMethod" data-toggle="tab">결제방법</a></li>
					<li><a href="#learningMethod" data-toggle="tab">학습방법</a></li>
					<li><a href="#learningError" data-toggle="tab">학습장애</a></li>
				</ul>
					<div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="creditbank">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered">
										<thead>
											<tr>
										        <td>번호</td>
										        <td>제목</td>
										    </tr>
										</thead>
										<tbody>
											<c:forEach var="communityFaq" items="${communityFaq}">
												<c:set var="communityFaqSubstr" value="${communityFaq.boardArticleTitle}" />
												<c:if test="${fn:substring(communityFaqSubstr, 0, 7) == '[학점은행제]'}">
									  			<tr>
											        <td>${communityFaq.boardArticleNum}</td>
											        <td>
											        <a href="#${communityFaq.boardArticleCode}" data-toggle="collapse">
											        ${communityFaq.boardArticleTitle}
											        </a>
											        </td>
											        
											     </tr>
											     <tr id="${communityFaq.boardArticleCode}" class="collapse">
											     	<td colspan="2">
														<pre style="white-space: pre-wrap;">${communityFaq.boardArticleContent}</pre>
								    				</td>
											     </tr>
											     </c:if>
									  		</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="userInfo">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered">
										<thead>
											<tr>
										        <td>번호</td>
										        <td>제목</td>
										    </tr>
										</thead>
										<tbody>
											<c:forEach var="communityFaq" items="${communityFaq}">
												<c:set var="communityFaqSubstr" value="${communityFaq.boardArticleTitle}" />
												<c:if test="${fn:substring(communityFaqSubstr, 0, 6) == '[회원정보]'}">
									  			<tr>
											        <td>${communityFaq.boardArticleNum}</td>
											        <td>
											        <a href="#${communityFaq.boardArticleCode}" data-toggle="collapse">
											        ${communityFaq.boardArticleTitle}
											        </a>
											        </td>
											        
											     </tr>
											     <tr id="${communityFaq.boardArticleCode}" class="collapse">
											     	<td colspan="2">
														<pre style="white-space: pre-wrap;">${communityFaq.boardArticleContent}</pre>
								    				</td>
											     </tr>
											     </c:if>
									  		</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="consultingLearningPlan">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered">
										<thead>
											<tr>
										        <td>번호</td>
										        <td>제목</td>
										    </tr>
										</thead>
										<tbody>
											<c:forEach var="communityFaq" items="${communityFaq}">
												<c:set var="communityFaqSubstr" value="${communityFaq.boardArticleTitle}" />
												<c:if test="${fn:substring(communityFaqSubstr, 0, 8) == '[맞춤학습설계]'}">
									  			<tr>
											        <td>${communityFaq.boardArticleNum}</td>
											        <td>
											        <a href="#${communityFaq.boardArticleCode}" data-toggle="collapse">
											        ${communityFaq.boardArticleTitle}
											        </a>
											        </td>
											        
											     </tr>
											     <tr id="${communityFaq.boardArticleCode}" class="collapse">
											     	<td colspan="2">
														<pre style="white-space: pre-wrap;">${communityFaq.boardArticleContent}</pre>
								    				</td>
											     </tr>
											     </c:if>
									  		</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="classregistrationOpenSubject">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered">
										<thead>
											<tr>
										        <td>번호</td>
										        <td>제목</td>
										    </tr>
										</thead>
										<tbody>
											<c:forEach var="communityFaq" items="${communityFaq}">
												<c:set var="communityFaqSubstr" value="${communityFaq.boardArticleTitle}" />
												<c:if test="${fn:substring(communityFaqSubstr, 0, 6) == '[수강신청]'}">
									  			<tr>
											        <td>${communityFaq.boardArticleNum}</td>
											        <td>
											        <a href="#${communityFaq.boardArticleCode}" data-toggle="collapse">
											        ${communityFaq.boardArticleTitle}
											        </a>
											        </td>
											        
											     </tr>
											     <tr id="${communityFaq.boardArticleCode}" class="collapse">
											     	<td colspan="2">
														<pre style="white-space: pre-wrap;">${communityFaq.boardArticleContent}</pre>
								    				</td>
											     </tr>
											     </c:if>
									  		</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="payMethod">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered">
										<thead>
											<tr>
										        <td>번호</td>
										        <td>제목</td>
										    </tr>
										</thead>
										<tbody>
											<c:forEach var="communityFaq" items="${communityFaq}">
												<c:set var="communityFaqSubstr" value="${communityFaq.boardArticleTitle}" />
												<c:if test="${fn:substring(communityFaqSubstr, 0, 6) == '[결제방법]'}">
									  			<tr>
											        <td>${communityFaq.boardArticleNum}</td>
											        <td>
											        <a href="#${communityFaq.boardArticleCode}" data-toggle="collapse">
											        ${communityFaq.boardArticleTitle}
											        </a>
											        </td>
											        
											     </tr>
											     <tr id="${communityFaq.boardArticleCode}" class="collapse">
											     	<td colspan="2">
														<pre style="white-space: pre-wrap;">${communityFaq.boardArticleContent}</pre>
								    				</td>
											     </tr>
											     </c:if>
									  		</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="learningMethod">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered">
										<thead>
											<tr>
										        <td>번호</td>
										        <td>제목</td>
										    </tr>
										</thead>
										<tbody>
											<c:forEach var="communityFaq" items="${communityFaq}">
												<c:set var="communityFaqSubstr" value="${communityFaq.boardArticleTitle}" />
												<c:if test="${fn:substring(communityFaqSubstr, 0, 6) == '[학습방법]'}">
									  			<tr>
											        <td>${communityFaq.boardArticleNum}</td>
											        <td>
											        <a href="#${communityFaq.boardArticleCode}" data-toggle="collapse">
											        ${communityFaq.boardArticleTitle}
											        </a>
											        </td>
											        
											     </tr>
											     <tr id="${communityFaq.boardArticleCode}" class="collapse">
											     	<td colspan="2">
														<pre style="white-space: pre-wrap;">${communityFaq.boardArticleContent}</pre>
								    				</td>
											     </tr>
											     </c:if>
									  		</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="learningError">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered">
										<thead>
											<tr>
										        <td>번호</td>
										        <td>제목</td>
										    </tr>
										</thead>
										<tbody>
											<c:forEach var="communityFaq" items="${communityFaq}">
												<c:set var="communityFaqSubstr" value="${communityFaq.boardArticleTitle}" />
												<c:if test="${fn:substring(communityFaqSubstr, 0, 6) == '[학습장애]'}">
									  			<tr>
											        <td>${communityFaq.boardArticleNum}</td>
											        <td>
											        <a href="#${communityFaq.boardArticleCode}" data-toggle="collapse">
											        ${communityFaq.boardArticleTitle}
											        </a>
											        </td>
											        
											     </tr>
											     <tr id="${communityFaq.boardArticleCode}" class="collapse">
											     	<td colspan="2">
														<pre style="white-space: pre-wrap;">${communityFaq.boardArticleContent}</pre>
								    				</td>
											     </tr>
											     </c:if>
									  		</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
	   		
	   		
	   		
	   		
	   		<div class="fl_right">
	   			<a href=""><input type="button" value="목록" class="btn btn-default"></a>
	   		</div>
	   		   		
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>