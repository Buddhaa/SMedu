<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
        //아이디
		$("#studentId").blur(function(){ //jquery문자가 들어오면 태그
            if(!(isNaN($("#studentId").val())) || $("#studentId").val().length<4){ //글자,숫자만입력 & 4자이상 
                $("#studentIdHelper").text("아이디 중복을 확인해주세요.");
            }
            else{
                $("#studentIdHelper").text("");
            }
        });
        
		//비밀번호
		$("#studentPw2").blur(function(){
            if($("#studentPw1").val() != $("#studentPw2").val()){     //비밀번호와 비밀번호확인이 불일치할때
                $("#studentPwHelper").text("비밀번호 확인해주세요..");
            }
            else if($("#studentPw1").val().length < 4){    //비밀번호가 4글자 이상
                $("#studentPwHelper").text("pw는 4자 이상");
            } 
            else{
                $("#studentPwHelper").text("");
            }
        });
		
		//이름
		$("#studentName").blur(function(){
            if(!(isNaN($("#studentName").val()))){    //글자와 숫자만 입력
                $("#studentNameHelper").text("이름을 확인해주세요.");
            }
            else{
                $("#studentNameHelper").text("");
            }
        });
		
		//나이
        $("#studentBirth").blur(function(){
            if(isNaN($("#studentBirth").val()) || $("#studentBirth").val()<0){ //숫자가아니거나 음수값일때
                $("#studentBirthHelper").text("숫자또는 정수만 입력하세요!");
            }
            else{
                $("#studentBirthHelper").text("");
            }
        });
		
		//주소
        $("#studentAddress").blur(function(){
            if(!(isNaN($("#studentAddress").val()))){    //글자와 숫자만 입력
                $("#studentAddressHelper").text("주소을 확인해주세요.");
            }
            else{
                $("#studentAddressHelper").text("");
            }
        });
		
      	//전화번호
        $("#studentPhone").blur(function(){
            if((isNaN($("#studentPhone").val()))){    //글자와 숫자만 입력
                $("#studentPhoneHelper").text("숫자만 입력, -뺀후 입력해주세요.");
            }
            else{
                $("#studentPhoneHelper").text("");
            }
        });
		
		//이메일
        $("#studentEmail").blur(function(){
            if(!(isNaN($("#studentEmail").val()))){    //글자와 숫자만 입력
                $("#studentEmailHelper").text("이메일을 입력해주세요.");
            }
            else{
                $("#studentEmailHelper").text("");
            }
        });
		
		
      $("#studentBtn").click(function(){
    	if($("#studentId").val() == "") {
  			$("#studentIdHelper").text("아이디 중복을 확인해주세요.");
  		} 
    	else if($("#studentPw1").val() == "") {
  			$("#studentPwHelper").text("비밀번호 입력해주세요");
  		} 
    	else if($("#studentPw2").val() == "") {
  			$("#studentPwHelper").text("비밀번호 입력해주세요");
  		} 
    	else if($("#studentName").val() == "") {
  			$("#studentNameHelper").text("이름을 입력해주세요");
  		} 
    	else if($("#studentBirth").val() == "") {
  			$("#studentBirthHelper").text("나이을 입력해주세요");
  		} 
    	else if($("#studentAddress").val() == "") {
  			$("#studentAddressHelper").text("주소를 입력해주세요");
  		} 
    	else if($("#studentPhone").val() == "") {
  			$("#studentPhoneHelper").text("전화번호를 입력해주세요");
  		} 
    	else if($("#studentEmail").val() == "") {
  			$("#studentEmailHelper").text("이메일를 입력해주세요");
  		} 
    	else if($(".studentGender:checked").length == 0) {
			$("#studentGenderHelper").text("성별을 체크해주세요.");
		} 
		else if($("#studentDepartment").val() == "") {
			$("#studentDepartmentHelper").text("학과를 선택해주세요.");
		} 
		else if($("#studentEducational").val() == "") {
			$("#studentEducationalHelper").text("최종학력을 선택해주세요.");
		} 
		else if($("#studentPath").val() == "") {
			$("#studentPathHelper").text("알게된경로를 선택해주세요.");
		}
		else if($("#studentGoal").val() == "") {
			$("#studentGoalHelper").text("학위취득목적을 선택해주세요.");
		}
		else {
			$("#studentInsertForm").submit();
		}
		
		
		if($(".studentGender:checked").length == 1){
			$("#studentGenderHelper").text("");
		}
		if($("#studentDepartment").val() != "") {
			$("#studentDepartmentHelper").text("");
		} 
		if($("#studentEducational").val() != "") {
			$("#studentEducationalHelper").text("");
		} 
		if($("#studentPath").val() != "") {
			$("#studentPathHelper").text("");
		}
		if($("#studentGoal").val() != "") {
			$("#studentGoalHelper").text("");
		}
	});
	
});
</script>
</head>
<body>
<jsp:include page="../module/top.jsp" />

<div class="wrapper row3">
	<div class="hoc container clear">
		<jsp:include page="../module/main_sidebar.jsp" />
		
		<div class="content three_quarter">
		<h1>회원가입</h1><hr>
			<form id="studentInsertForm" class="form-horizontal" action="/smedu/main/studentInsert" method="post">
			<fieldset>
			
			<input name="userLevel" type="hidden" value="학생">

			<div class="form-group">
			  <label class="col-md-4 control-label">아이디</label>  
			  <div class="col-md-4">
			  <input name="userId" id="studentId" type="text" class="form-control input-md" onclick="window.open('/smedu/main/idCheckForm','win','width=450,height=400,menubar=no,scrollbars=yes');return false">
			  <span id="studentIdHelper" class="span"></span>
			  </div>
			 
			  <div class="col-md-4">
			  <a href='#' onclick="window.open('/smedu/main/idCheckForm','win','width=450,height=400,menubar=no,scrollbars=yes');return false">
			  <input type="button" id="jwoongbock" class="btn btn-default" value="중복확인">
			  </a>
			  
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">비밀번호</label>  
			  <div class="col-md-4">
			  <input id="studentPw1" type="password" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">비밀번호 확인</label>
			  <div class="col-md-4">
			    <input id="studentPw2" name="userPw" type="password" class="form-control input-md">
			    <span id="studentPwHelper" class="span"></span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">이름</label>
			  <div class="col-md-4">
			    <input id="studentName" name="userName" type="text" class="form-control input-md">
			    <span id="studentNameHelper" class="span"></span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">생일</label>
			  <div class="col-md-4">
			    <input id="studentBirth" name="userBirth" type="text" class="form-control input-md">
			    <span id="studentBirthHelper" class="span"></span> 
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">성별</label>
			  <div class="col-md-4">
			  	<div class="radio">
			    <label><input type="radio" class="studentGender" name="userGender" value="남">남</label>&nbsp;
			    <label><input type="radio" class="studentGender" name="userGender" value="여">여</label>
			    <span id="studentGenderHelper" class="span"></span> 
			    </div>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">주소</label>
			  <div class="col-md-4">
			    <input id="studentAddress" name="userAddress" type="text" class="form-control input-md">
			    <span id="studentAddressHelper" class="span"></span> 
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">전화번호</label>
			  <div class="col-md-4">
			    <input id="studentPhone" name="userPhone" type="text" class="form-control input-md">
			    <span id="studentPhoneHelper" class="span"></span> 
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">이메일</label>
			  <div class="col-md-4">
			    <input id="studentEmail" name="userEmail" type="text" class="form-control input-md">
			    <span id="studentEmailHelper" class="span"></span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">학과</label>
			  <div class="col-md-4">
			    <select class="form-control" name="departmentCode" id="studentDepartment">
			    	<option value="">==선택==</option>
			    	<c:forEach var="department" items="${departmentList}"> 
			 			<option value="${department.departmentCode}">${department.departmentName}</option>
			 		</c:forEach>
			    </select>
			    <span id="studentDepartmentHelper" class="span"></span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">최종학력</label>
			  <div class="col-md-4">
			  	 <select class="form-control" id="studentEducational" name="userEducational">
			  	 	<option value="">==선택==</option>
			    	<option value="고등학교졸">고등학교졸</option>
			    	<option value="전문대재학">전문대재학</option>
			    	<option value="4년제대학재학">4년제대학재학</option>
			    	<option value="대학원재학">대학원재학</option>
			    	<option value="전문대졸업">전문대졸업</option>
			    	<option value="4년제대학졸업">4년제대학졸업</option>
			    	<option value="대학원졸업">대학원졸업</option>
			   	 </select>
			   	 <span id="studentEducationalHelper" class="span"></span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">알게된경로</label>
			  <div class="col-md-4">
			    <select class="form-control" id="studentPath" name="studentPath">
			  	 	<option value="">==선택==</option>
			    	<option value="인터넷광고">인터넷광고</option>
			    	<option value="지역신문">지역신문</option>
			    	<option value="지인소개">지인소개</option>
			    	<option value="협력기관">협력기관</option>
			    	<option value="홍보물">홍보물</option>
			   	 </select>
			   	 <span id="studentPathHelper" class="span"></span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">학위취득목적</label>
			  <div class="col-md-4">
			    <select class="form-control" id="studentGoal" name="studentGoal">
			  	 	<option value="">==선택==</option>
			    	<option value="학위취득">학위취득</option>
			    	<option value="4년제대학졸업">취업</option>
			    	<option value="편입">편입</option>
			    	<option value="자기개발">자기개발</option>
			   	 </select>
			   	 <span id="studentGoalHelper" class="span"></span>
			  </div>
			</div>
			
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="signup_recruiter"></label>
			  <div class="col-md-4">
			    <input type="button" id="studentBtn" class="btn btn-default" value="가입하기">
			    <input type="button" class="btn btn-default" value="뒤로가기" onClick="history.back();">
			  </div>
			</div>
			
			</fieldset>
			</form>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
<script>

</script>
</html>