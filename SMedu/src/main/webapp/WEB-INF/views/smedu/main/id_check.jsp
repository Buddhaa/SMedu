<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/smedu/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- JAVASCRIPTS -->
<script src="/resources/smedu/layout/scripts/jquery.min.js"></script>
<script src="/resources/smedu/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/smedu/layout/scripts/jquery.mobilemenu.js"></script>
<script src="/resources/smedu/layout/scripts/jquery.flexslider-min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	var userLevel = '<c:out value='${userLevel}'/>';
	function formCheck() {
		if(!(isNaN($("#userId").val())) || $("#userId").val().length<4) {
		$("#idHelper").text("4자이상 숫자만은 사용이 안됩니다.");
	  return false;
	 } else {
		 $("#idHelper").text("");
		 return true;
	 }
	}
	console.log(userLevel);
	function idSelect(userId) {
		if(userLevel==("student")){
			$("#studentId", opener.document).val(userId);
			this.close();
		}
		else if(userLevel==("professor")){
			$("#professorId", opener.document).val(userId);
			this.close();
		}
		else if(userLevel==("planner")){
			$("#plannerId", opener.document).val(userId);
			this.close();
		}
		
	   	
	}
</script>
</head>
<body>
<h2>[ ID 중복 확인 ]</h2>
<input type="hidden" id="userLevel" value="${userLevel }">
<form action='/smedu/main/idCheck?userLevel=${userLevel }' id="idCheckForm" method='post' onsubmit="return formCheck();">
<fieldset>
<div class="form-group">
	<label class="col-md-4 control-label">아이디</label>
	<div class="col-md-4">
		<input type="text" name="userId" id="userId" class="form-control input-md" placeholder="검색할 ID 입력" value="${userId}">
		<span id="idHelper" class="span"></span><br>
	</div>
	<div class="col-md-4">
		<input type="submit" class="btn btn-default" value="검색">
	</div>
</div>
</fieldset>
</form>
<!-- GET일 경우 회원가입화면에서 중복확인 버튼을 누른 것이므로 화면에 어떠한 메시지도 띄울 필요 없다. -->
<c:if test="${pageContext.request.method == 'POST' }">
 <c:if test="${userIdCheck.userId == null}">
  	<div class="col-md-4">
  	<span style="font-size:1.5em;"><strong>${userId}</strong> : 사용할 수 있는 ID입니다.</span>

  	</div>
   <div class="col-md-4">
   	<input type="button" value="ID사용하기" class="btn btn-default" onclick="idSelect('${userId}')">
   </div>
 </c:if>

 <c:if test="${userIdCheck.userId != null}">
 	<div class="col-md-4">
   <span style="font-size:1.5em;"><strong>${userIdCheck.userId}</strong> : 이미 사용중인 ID입니다</span>
   </div>
 </c:if>
</c:if>
</body>
</html>

