<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
    //window "load" 를 jquery로 바꾼모습
    $(document).ready(function(){
        //아이디 
        $("#id").focus();
        $("#id").blur(function(){ //jquery문자가 들어오면 태그
            if(!(isNaN($("#id").val())) || $("#id").val().length<4){ //글자,숫자만입력 & 4자이상 
                $("#idHelper").text("4자이상 숫자만은 사용이 안됩니다.");
                $("#id").focus();
            }
            else{
                $("#idHelper").text("");
                $("#pw1").focus();
            }
        });
        
        //비밀번호와 비밀번호확인
        $("#pw2").blur(function(){
            if($("#pw1").val() != $("#pw2").val()){     //비밀번호와 비밀번호확인이 불일치할때
                $("#pwHelper").text("pw확인하세요.");
                $("#pw1").focus();
            }
            else if($("#pw1").val().length < 4){    //비밀번호가 4글자 이상
                $("#pwHelper").text("pw는 4자 이상");
                $("#pw1").focus();
            } 
            else{
                $("#pwHelper").text("");
            }
        });
        
        //나이
        $("#age").blur(function(){
            if(isNaN($("#age").val()) || $("#age").val()<0){ //숫자가아니거나 음수값일때
                $("#ageHelper").text("숫자또는 정수만 입력하세요!");
                $("#age").focus();
            }
            else{
                $("#ageHelper").text("");
                
            }
        });
        
        //이메일
        $("#email").blur(function(){
            if(!(isNaN($("#email").val()))){    //글자와 숫자만 입력
                $("#emailHelper").text("이메일을 확인하세요!.");
                $("#email").focus();
            }
            else{
                $("#emailHelper").text("");
                
            }
        });
        
        //메모
        
        $("#memo").blur(function(){
            if ($("#memo").val()=="" ){    //메모가 공백일때
                $("#memoHelper").text("메모를 기입하세요!.");
                $("#memo").focus();
            }
            else{
                $("#memoHelper").text("");
            }
        });
        //버튼
        $("#signup").click(function(){
            //성별을 체크않했을때
            var gender = $(".gender:checked");
            if($(".gender:checked").length != 0){
                $("#genderHelper").text("");
            }
            //취미를 2개 이상 체크않했을때
            var hobby = $(".hobby:checked");
            if($(".hobby:checked").length >= 2){
                $("#hobbyHelper").text("");
            }
            //아이디가 공백일때
            if($("#id").val() == ""){
                $("#idHelper").text("아이디가 공백입니다.");
                $("#id").focus();
            }
            //비밀번호가 공백일때
            else if($("#pw1").val() == "") {
                $("#pwHelper").text("pw확인하세요.");
                $("#pw1").focus();
            }
            //성별체크 않했을때
            else if($(".gender:checked").length == 0){
                $("#genderHelper").text("성별을 선택하세요.!");
            }
            //취미가 2개이상 체크를 않했을때
            else if($(".hobby:checked").length < 2){
                $("#hobbyHelper").text("취미를 2개이상 선택하세요.!");
            }
            //나이가 공백일때
            else if($("#age").val() == ""){
                $("#ageHelper").text("나이를 입력하세요.!");
                $("#age").focus();
            }
            //이메일이 공백일때
            else if($("#email").val() == ""){
                $("#emailHelper").text("이메일를 입력하세요.!");
                $("#email").focus();
            }
            //이메일 url을 선택않했을때
            else if($("#url").val() == ""){
                $("#emailHelper").text("이메일을 선택하세요.!");
                $("#url").focus();
            }
            //메모가 공백일때
            else if($("#memo").val() == ""){
                $("#memoHelper").text("메모를 기입하세요.!");
                $("#memo").focus();
            }
            //모든값이 통과했을때 result.jsp로 이동
            else{
                $("#form1").submit();
            }
        });
    });
</script> -->
</head>
<body>
<jsp:include page="../module/top.jsp" />

<div class="wrapper row3">
	<div class="hoc container clear">
		<jsp:include page="../module/main_sidebar.jsp" />
		
		<div class="content three_quarter">
		<h1>회원가입</h1><hr>
			<form class="form-horizontal" action="/smedu/main/studentInsert" method="post">
			<fieldset>
			<input name="userLevel" type="hidden" value="학생">
 			<%-- <input name="userCode" type="text" value="${userCode}">
			<input name="studentCode" type="text" value="${studentCode }"> --%>
			<div class="form-group">
			  <label class="col-md-4 control-label">아이디</label>  
			  <div class="col-md-4">
			  <input name="userId" type="text" class="form-control input-md">
			  <button id="jwoongbock" class="btn btn-default">중복확인</button>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">비밀번호</label>  
			  <div class="col-md-4">
			  <input id="userPw" type="password" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">비밀번호 확인</label>
			  <div class="col-md-4">
			    <input id="userPw" name="userPw" type="password" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">이름</label>
			  <div class="col-md-4">
			    <input name="userName" type="text" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">생일</label>
			  <div class="col-md-4">
			    <input name="userBirth" type="text" class="form-control input-md">
			    <span>주민등록번호 앞자리</span>  
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">성별</label>
			  <div class="col-md-4">
			  	<div class="radio">
			    <label><input type="radio" id="optionsRadios1" name="userGender" value="남">남</label>&nbsp;
			    <label><input type="radio" id="optionsRadios2" name="userGender" value="여">여</label>
			    </div>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">주소</label>
			  <div class="col-md-4">
			    <input name="userAddress" type="text" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">전화번호</label>
			  <div class="col-md-4">
			    <input name="userPhone" type="text" class="form-control input-md">
			    <span>"-"뺀후 입력하세요</span>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">이메일</label>
			  <div class="col-md-4">
			    <input name="userEmail" type="text" class="form-control input-md">
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">학과</label>
			  <div class="col-md-4">
			    <select class="form-control" name="departmentCode">
			    	<option value="">==선택==</option>
			    	<c:forEach var="department" items="${departmentList}"> 
			 			<option value="${department.departmentCode}">${department.departmentName}</option>
			 		</c:forEach>
			    </select>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">최종학력</label>
			  <div class="col-md-4">
			  	 <select class="form-control" name="userEducational">
			  	 	<option value="">==선택==</option>
			    	<option value="고등학교졸">고등학교졸</option>
			    	<option value="전문대재학">전문대재학</option>
			    	<option value="4년제대학재학">4년제대학재학</option>
			    	<option value="대학원재학">대학원재학</option>
			    	<option value="전문대졸업">전문대졸업</option>
			    	<option value="4년제대학졸업">4년제대학졸업</option>
			    	<option value="대학원졸업">대학원졸업</option>
			   	 </select>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">알게된경로</label>
			  <div class="col-md-4">
			    <select class="form-control" name="studentPath">
			  	 	<option value="">==선택==</option>
			    	<option value="인터넷광고">인터넷광고</option>
			    	<option value="지역신문">지역신문</option>
			    	<option value="지인소개">지인소개</option>
			    	<option value="협력기관">협력기관</option>
			    	<option value="홍보물">홍보물</option>
			   	 </select>
			  </div>
			</div>
			
			<div class="form-group">
			  <label class="col-md-4 control-label">학위취득목적</label>
			  <div class="col-md-4">
			    <select class="form-control" name="studentGoal">
			  	 	<option value="">==선택==</option>
			    	<option value="학위취득">학위취득</option>
			    	<option value="4년제대학졸업">취업</option>
			    	<option value="편입">편입</option>
			    	<option value="자기개발">자기개발</option>
			   	 </select>
			  </div>
			</div>
			
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="signup_recruiter"></label>
			  <div class="col-md-4">
			    <button id="signup_recruiter" name="signup_recruiter" class="btn btn-default">가입하기</button>
			    <button id="signup_recruiter" name="signup_recruiter" class="btn btn-default">뒤로가기</button>
			  </div>
			</div>
			
			</fieldset>
			</form>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>