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
		//교수 아이디
		$("#professorId").blur(function(){ //jquery문자가 들어오면 태그
	        if(!(isNaN($("#professorId").val())) || $("#professorId").val().length<4){ //글자,숫자만입력 & 4자이상 
	            $("#professorIdHelper").text("아이디 중복을 확인해주세요.");
	        }
	        else{
	            $("#professorIdHelper").text("");
	        }
	    });
	    
		//교수 비밀번호
		$("#professorPw2").blur(function(){
	        if($("#professorPw1").val() != $("#professorPw2").val()){     //비밀번호와 비밀번호확인이 불일치할때
	            $("#professorPwHelper").text("비밀번호 확인해주세요..");
	        }
	        else if($("#professorPw1").val().length < 4){    //비밀번호가 4글자 이상
	            $("#professorPwHelper").text("pw는 4자 이상");
	        } 
	        else{
	            $("#professorPwHelper").text("");
	        }
	    });
		
		//교수 이름
		$("#professorName").blur(function(){
	        if(!(isNaN($("#professorName").val()))){    //글자와 숫자만 입력
	            $("#professorNameHelper").text("이름을 확인해주세요.");
	        }
	        else{
	            $("#professorNameHelper").text("");
	        }
	    });
		
		//교수 나이
	    $("#professorBirth").blur(function(){
	        if(isNaN($("#professorBirth").val()) || $("#professorBirth").val()<0){ //숫자가아니거나 음수값일때
	            $("#professorBirthHelper").text("숫자또는 정수만 입력하세요!");
	        }
	        else{
	            $("#professorBirthHelper").text("");
	        }
	    });
		
		//교수 주소
	    $("#professorAddress").blur(function(){
	        if(!(isNaN($("#professorAddress").val()))){    //글자와 숫자만 입력
	            $("#professorAddressHelper").text("주소을 확인해주세요.");
	        }
	        else{
	            $("#professorAddressHelper").text("");
	        }
	    });
		
	  	//교수 전화번호
	    $("#professorPhone").blur(function(){
	        if((isNaN($("#professorPhone").val()))){    //숫자만 입력
	            $("#professorPhoneHelper").text("숫자만 입력, -뺀후 입력해주세요.");
	        }
	        else{
	            $("#professorPhoneHelper").text("");
	        }
	    });
		
		//교수 이메일
	    $("#professorEmail").blur(function(){
	        if(!(isNaN($("#professorEmail").val()))){    //글자와 숫자만 입력
	            $("#professorEmailHelper").text("이메일을 입력해주세요.");
	        }
	        else{
	            $("#professorEmailHelper").text("");
	        }
	    });
	  
	  	//교수 학사
	    $("#professorBachelor").blur(function(){
	        if(!(isNaN($("#professorBachelor").val()))){    //글자와 숫자만 입력
	            $("#professorBachelorHelper").text("학사학위를 입력해주세요.");
	        }
	        else{
	            $("#professorBachelorHelper").text("");
	        }
	    });
	  	
	  	//교수 석사
	    $("#professorMaster").blur(function(){
	        if(!(isNaN($("#professorMaster").val()))){    //글자와 숫자만 입력
	            $("#professorMasterHelper").text("석사학위를 입력해주세요.");
	        }
	        else{
	            $("#professorMasterHelper").text("");
	        }
	    });
	  
	  	//교수 박사
	    $("#professorDoctor").blur(function(){
	        if(!(isNaN($("#professorDoctor").val()))){    //글자와 숫자만 입력
	            $("#professorDoctorHelper").text("박사학위를 입력해주세요.");
	        }
	        else{
	            $("#professorDoctorHelper").text("");
	        }
	    });
	  	
	  	//교수 주요경력
	    $("#professorCareer").blur(function(){
	        if(!(isNaN($("#professorCareer").val()))){    //글자와 숫자만 입력
	            $("#professorCareerHelper").text("주요경력을 입력해주세요.");
	        }
	        else{
	            $("#professorCareerHelper").text("");
	        }
	    });
		
		
	  $("#professorBtn").click(function(){
		if($("#professorId").val() == "") {
			$("#professorIdHelper").text("아이디 중복을 확인해주세요.");
		} 
		else if($("#professorPw1").val() == "") {
			$("#professorPwHelper").text("비밀번호 입력해주세요");
		} 
		else if($("#professorPw2").val() == "") {
			$("#professorPwHelper").text("비밀번호 입력해주세요");
		} 
		else if($("#professorName").val() == "") {
			$("#professorNameHelper").text("이름을 입력해주세요");
		} 
		else if($("#professorBirth").val() == "") {
			$("#professorBirthHelper").text("나이을 입력해주세요");
		} 
		else if($("#professorAddress").val() == "") {
			$("#professorAddressHelper").text("주소를 입력해주세요");
		} 
		else if($("#professorPhone").val() == "") {
			$("#professorPhoneHelper").text("전화번호를 입력해주세요");
		} 
		else if($("#professorEmail").val() == "") {
			$("#professorEmailHelper").text("이메일를 입력해주세요");
		} 
		else if($(".professorGender:checked").length == 0) {
			$("#professorGenderHelper").text("성별을 체크해주세요.");
		} 
		else if($("#professorDepartment").val() == "") {
			$("#professorDepartmentHelper").text("학과를 선택해주세요.");
		} 
		else if($("#professorEducational").val() == "") {
			$("#professorEducationalHelper").text("최종학력을 선택해주세요.");
		} 
		else if($("#professorBachelor").val() == "") {
			$("#professorBachelorHelper").text("학사학위를 입력해주세요.");
		}
		else if($("#professorMaster").val() == "") {
			$("#professorMasterHelper").text("석사학위를 입력해주세요.");
		}
		else if($("#professorDoctor").val() == "") {
			$("#professorDoctorHelper").text("박사학위를 입력해주세요.");
		}
		else if($("#professorCareer").val() == "") {
			$("#professorCareerHelper").text("주요경력를 입력해주세요.");
		}
		else {
			$("#professorInsertForm").submit();
		}
		
		
		if($(".professorGender:checked").length == 1){
			$("#professorGenderHelper").text("");
		}
		if($("#professorDepartment").val() != "") {
			$("#professorDepartmentHelper").text("");
		} 
		if($("#professorEducational").val() != "") {
			$("#professorEducationalHelper").text("");
		} 
	});
	  
	//플래너
	
	//플래너 아이디
	$("#plannerId").blur(function(){ //jquery문자가 들어오면 태그
        if(!(isNaN($("#plannerId").val())) || $("#plannerId").val().length<4){ //글자,숫자만입력 & 4자이상 
            $("#plannerIdHelper").text("아이디 중복을 확인해주세요.");
        }
        else{
            $("#plannerIdHelper").text("");
        }
    });
    
	//플래너 비밀번호
	$("#plannerPw2").blur(function(){
        if($("#plannerPw1").val() != $("#plannerPw2").val()){     //비밀번호와 비밀번호확인이 불일치할때
            $("#plannerPwHelper").text("비밀번호 확인해주세요..");
        }
        else if($("#plannerPw1").val().length < 4){    //비밀번호가 4글자 이상
            $("#plannerPwHelper").text("pw는 4자 이상");
        } 
        else{
            $("#plannerPwHelper").text("");
        }
    });
	
	//플래너 이름
	$("#plannerName").blur(function(){
        if(!(isNaN($("#plannerName").val()))){    //글자와 숫자만 입력
            $("#plannerNameHelper").text("이름을 확인해주세요.");
        }
        else{
            $("#plannerNameHelper").text("");
        }
    });
	
	//플래너 나이
    $("#plannerBirth").blur(function(){
        if(isNaN($("#plannerBirth").val()) || $("#plannerBirth").val()<0){ //숫자가아니거나 음수값일때
            $("#plannerBirthHelper").text("숫자또는 정수만 입력하세요!");
        }
        else{
            $("#plannerBirthHelper").text("");
        }
    });
	
	//플래너 주소
    $("#plannerAddress").blur(function(){
        if(!(isNaN($("#plannerAddress").val()))){    //글자와 숫자만 입력
            $("#plannerAddressHelper").text("주소을 확인해주세요.");
        }
        else{
            $("#plannerAddressHelper").text("");
        }
    });
	
  	//플래너 전화번호
    $("#plannerPhone").blur(function(){
        if((isNaN($("#plannerPhone").val()))){    //숫자만 입력
            $("#plannerPhoneHelper").text("숫자만 입력, -뺀후 입력해주세요.");
        }
        else{
            $("#plannerPhoneHelper").text("");
        }
    });
	
	//플래너 이메일
    $("#plannerEmail").blur(function(){
        if(!(isNaN($("#plannerEmail").val()))){    //글자와 숫자만 입력
            $("#plannerEmailHelper").text("이메일을 입력해주세요.");
        }
        else{
            $("#plannerEmailHelper").text("");
        }
    });
  	
  	//플래너 카카오아이디
    $("#plannerKakao").blur(function(){
        if(!(isNaN($("#plannerKakao").val()))){    //글자와 숫자만 입력
            $("#plannerKakaoHelper").text("주요경력을 입력해주세요.");
        }
        else{
            $("#plannerKakaoHelper").text("");
        }
    });
	
	
	
	$("#plannerBtn").click(function(){
		if($("#plannerId").val() == "") {
			$("#plannerIdHelper").text("아이디 중복을 확인해주세요.");
		} 
		else if($("#plannerPw1").val() == "") {
			$("#plannerPwHelper").text("비밀번호 입력해주세요");
		} 
		else if($("#plannerPw2").val() == "") {
			$("#plannerPwHelper").text("비밀번호 입력해주세요");
		} 
		else if($("#plannerName").val() == "") {
			$("#plannerNameHelper").text("이름을 확인해주세요.");
		} 
		else if($("#plannerBirth").val() == "") {
			$("#plannerBirthHelper").text("주민등록 앞자리를 입력하세요");
		} 
		else if($(".plannerGender:checked").length == 0) {
			$("#plannerGenderHelper").text("성별을 체크해주세요.");
		} 
		else if($("#plannerAddress").val() == "") {
			$("#plannerAddressHelper").text("주소을 확인해주세요.");
		} 
		else if($("#plannerPhone").val() == "") {
			$("#plannerPhoneHelper").text("-뺀후 입력하세요.");
		} 
		else if($("#plannerEmail").val() == "") {
			$("#plannerEmailHelper").text("이메일을 입력해주세요.");
		} 
		else if($("#plannerDepartment").val() == "") {
			$("#plannerDepartmentHelper").text("학과를 선택해주세요.");
		} 
		else if($("#plannerEducational").val() == "") {
			$("#plannerEducationalHelper").text("최종학력을 선택해주세요.");
		} 
		else if($("#plannerKakao").val() == "") {
			$("#plannerKakaoHelper").text("카카오아이디를 입력해주세요.");
		}
		else {
			$("#plannerInsertForm").submit();
		}
		
		 
		if($(".plannerGender:checked").length == 1){
			$("#genderHelper").text("");
		}  
		if($("#plannerDepartment").val() != "") {
			$("#plannerDepartmentHelper").text("");
		} 
		if($("#plannerEducational").val() != "") {
			$("#plannerEducationalHelper").text("");
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
			<div id="content">
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<li class="active col-xs-6"><a href="#professor" data-toggle="tab">교수</a></li>
					<li class="col-xs-6"><a href="#planner" data-toggle="tab">플래너</a></li>
				</ul>
				<div id="my-tab-content" class="tab-content">
					<div class="tab-pane active" id="professor">
						<div class="row">
							<div class="col-lg-12">
								<form id="professorInsertForm" class="form-horizontal" action="/smedu/main/professorInsert" method="post">
									<fieldset>
										<input name="userLevel" type="hidden" value="교수"><br>
										<div class="form-group">
										  <label class="col-md-4 control-label">아이디</label>  
										  <div class="col-md-4">
										  <input name="userId" id="professorId" type="text" class="form-control input-md" onclick="window.open('/smedu/main/idCheckForm?userLevel=professor','win','width=450,height=400,menubar=no,scrollbars=yes');return false">
										  <span id="professorIdHelper" class="span"></span>
										  </div>
										 
										  <div class="col-md-4">
										  <a href='#' onclick="window.open('/smedu/main/idCheckForm?userLevel=professor','win','width=450,height=400,menubar=no,scrollbars=yes');return false">
										  <input type="button" id="jwoongbock" class="btn btn-default" value="중복확인">
										  </a>
										  
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">비밀번호</label>  
										  <div class="col-md-4">
										  <input id="professorPw1" type="password" class="form-control input-md">
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">비밀번호 확인</label>
										  <div class="col-md-4">
										    <input id="professorPw2" name="userPw" type="password" class="form-control input-md">
										    <span id="professorPwHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">이름</label>
										  <div class="col-md-4">
										    <input id="professorName" name="userName" type="text" class="form-control input-md">
										    <span id="professorNameHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">생일</label>
										  <div class="col-md-4">
										    <input id="professorBirth" name="userBirth" type="text" class="form-control input-md">
										    <span id="professorBirthHelper" class="span"></span> 
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">성별</label>
										  <div class="col-md-4">
										  	<div class="radio">
										    <label><input type="radio" class="professorGender" name="userGender" value="남">남</label>&nbsp;
										    <label><input type="radio" class="professorGender" name="userGender" value="여">여</label>
										    <span id="professorGenderHelper" class="span"></span> 
										    </div>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">주소</label>
										  <div class="col-md-4">
										    <input id="professorAddress" name="userAddress" type="text" class="form-control input-md">
										    <span id="professorAddressHelper" class="span"></span> 
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">전화번호</label>
										  <div class="col-md-4">
										    <input id="professorPhone" name="userPhone" type="text" class="form-control input-md">
										    <span id="professorPhoneHelper" class="span"></span> 
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">이메일</label>
										  <div class="col-md-4">
										    <input id="professorEmail" name="userEmail" type="text" class="form-control input-md">
										    <span id="professorEmailHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">학과</label>
										  <div class="col-md-4">
										    <select class="form-control" name="departmentCode" id="professorDepartment">
										    	<option value="">==선택==</option>
										    	<c:forEach var="department" items="${departmentList}"> 
										 			<option value="${department.departmentCode}">${department.departmentName}</option>
										 		</c:forEach>
										    </select>
										    <span id="professorDepartmentHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">최종학력</label>
										  <div class="col-md-4">
										  	 <select class="form-control" id="professorEducational" name="professorEducational">
										  	 	<option value="">==선택==</option>
										    	<option value="고등학교졸">고등학교졸</option>
										    	<option value="전문대재학">전문대재학</option>
										    	<option value="4년제대학재학">4년제대학재학</option>
										    	<option value="대학원재학">대학원재학</option>
										    	<option value="전문대졸업">전문대졸업</option>
										    	<option value="4년제대학졸업">4년제대학졸업</option>
										    	<option value="대학원졸업">대학원졸업</option>
										   	 </select>
										   	 <span id="professorEducationalHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">학사</label>
										  <div class="col-md-4">
										    <input id="professorBachelor" name="professorBachelor" type="text" class="form-control input-md">
										  	<span id="professorBachelorHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">석사</label>
										  <div class="col-md-4">
										    <input id="professorMaster" name="professorMaster" type="text" class="form-control input-md">
										  	<span id="professorMasterHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">박사</label>
										  <div class="col-md-4">
										    <input id="professorDoctor" name="professorDoctor" type="text" class="form-control input-md">
										  	<span id="professorDoctorHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">주요 경력</label>
										  <div class="col-md-6">
										   	<textarea id="professorCareer" name="professorCareer" class="form-control" rows="7" id="comment"></textarea>
										  	<span id="professorCareerHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label" for="signup_recruiter"></label>
										  <div class="col-md-4">
										    <input type="button" id="professorBtn" class="btn btn-default" value="가입하기">
			    							<input type="button" class="btn btn-default" value="뒤로가기" onClick="history.back();">
										  </div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="planner">
						<div class="row">
							<div class="col-lg-12">
								<form id="plannerInsertForm" class="form-horizontal" action="/smedu/main/plannerInsert" method="post">
									<fieldset>
										<input name="userLevel" type="hidden" value="플래너"><br>
													<div class="form-group">
										  <label class="col-md-4 control-label">아이디</label>  
										  <div class="col-md-4">
										  <input name="userId" id="plannerId" type="text" class="form-control input-md" onclick="window.open('/smedu/main/idCheckForm?userLevel=planner','win','width=450,height=400,menubar=no,scrollbars=yes');return false">
										  <span id="plannerIdHelper" class="span"></span>
										  </div>
										 
										  <div class="col-md-4">
										  <a href='#' onclick="window.open('/smedu/main/idCheckForm?userLevel=planner','win','width=450,height=400,menubar=no,scrollbars=yes');return false">
										  <input type="button" id="jwoongbock" class="btn btn-default" value="중복확인">
										  </a>
										  
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">비밀번호</label>  
										  <div class="col-md-4">
										  <input id="plannerPw1" type="password" class="form-control input-md">
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">비밀번호 확인</label>
										  <div class="col-md-4">
										    <input id="plannerPw2" name="userPw" type="password" class="form-control input-md">
										    <span id="plannerPwHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">이름</label>
										  <div class="col-md-4">
										    <input id="plannerName" name="userName" type="text" class="form-control input-md">
										    <span id="plannerNameHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">생일</label>
										  <div class="col-md-4">
										    <input id="plannerBirth" name="userBirth" type="text" class="form-control input-md">
										    <span id="plannerBirthHelper" class="span"></span> 
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">성별</label>
										  <div class="col-md-4">
										  	<div class="radio">
										    <label><input type="radio" class="plannerGender" name="userGender" value="남">남</label>&nbsp;
										    <label><input type="radio" class="plannerGender" name="userGender" value="여">여</label>
										    <span id="plannerGenderHelper" class="span"></span> 
										    </div>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">주소</label>
										  <div class="col-md-4">
										    <input id="plannerAddress" name="userAddress" type="text" class="form-control input-md">
										    <span id="plannerAddressHelper" class="span"></span> 
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">전화번호</label>
										  <div class="col-md-4">
										    <input id="plannerPhone" name="userPhone" type="text" class="form-control input-md">
										    <span id="plannerPhoneHelper" class="span"></span> 
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">이메일</label>
										  <div class="col-md-4">
										    <input id="plannerEmail" name="userEmail" type="text" class="form-control input-md">
										    <span id="plannerEmailHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">학과</label>
										  <div class="col-md-4">
										    <select class="form-control" name="departmentCode" id="plannerDepartment">
										    	<option value="">==선택==</option>
										    	<c:forEach var="department" items="${departmentList}"> 
										 			<option value="${department.departmentCode}">${department.departmentName}</option>
										 		</c:forEach>
										    </select>
										    <span id="plannerDepartmentHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">최종학력</label>
										  <div class="col-md-4">
										  	 <select class="form-control" id="plannerEducational" name="userEducational">
										  	 	<option value="">==선택==</option>
										    	<option value="고등학교졸">고등학교졸</option>
										    	<option value="전문대재학">전문대재학</option>
										    	<option value="4년제대학재학">4년제대학재학</option>
										    	<option value="대학원재학">대학원재학</option>
										    	<option value="전문대졸업">전문대졸업</option>
										    	<option value="4년제대학졸업">4년제대학졸업</option>
										    	<option value="대학원졸업">대학원졸업</option>
										   	 </select>
										   	 <span id="plannerEducationalHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label">카카오톡아이디</label>
										  <div class="col-md-4">
										    <input id="plannerKakao" name="plannerKakao" type="text" class="form-control input-md">
										    <span id="plannerKakaoHelper" class="span"></span>
										  </div>
										</div>
										
										<div class="form-group">
										  <label class="col-md-4 control-label" for="signup_recruiter"></label>
										  <div class="col-md-4">
										    <input type="button" id="plannerBtn" class="btn btn-default" value="가입하기">
			    							<input type="button" class="btn btn-default" value="뒤로가기" onClick="history.back();">
										  </div>
										</div>
									</fieldset>
								</form>
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