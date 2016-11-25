<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link media="screen" rel="stylesheet" type="text/css" href="/resources/epiclock/stylesheet/jquery.epiclock.css"/>
<link media="screen" rel="stylesheet" type="text/css" href="/resources/epiclock/renderers/retro/epiclock.retro.css"/>
<link media="screen" rel="stylesheet" type="text/css" href="/resources/epiclock/renderers/retro-countdown/epiclock.retro-countdown.css"/>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script src="/resources/epiclock/javascript/jquery.dateformat.js"></script>
<script src="/resources/epiclock/javascript/jquery.epiclock.js"></script>
<script src="/resources/epiclock/renderers/retro/epiclock.retro.js"></script>
<script src="/resources/epiclock/renderers/retro-countdown/epiclock.retro-countdown.js"></script>

<style type="text/css">
    body
        { font-family: Helvetica; }

    fieldset
        { float: left; padding: 10px 15px; border: 1px solid #6F6F6F; }
        
    hr
        { border-bottom: 1px solid #6F6F6F; width: 80%; margin: 20px auto; }
      
    dt
        { font-weight: bold; margin-top: 10px; }
        
    dd
        { padding: 2px 0; }
        
    .note
        { font-size: .85em; color: #6F6F6F; font-style: italic; }
</style>

<script>
  	$(document).ready(function(){
  		
  		var check = "${examCheck.attendCompleteConfirmation}";
  		
  		if(check == 'T'){
  			alert("이미 테스트를 한 시험입니다.");
  			window.close();
  		}
  		
  		//F5 막기
  		window.onkeydown = function(){
  			if(event.keyCode == 116){ event.returnValue = false;
  			}
  		} 
  		
  		//시험 문제번호, 문제답 입력될 배열
  		var score = [];
		var examQuestionCode = [];
  		
		//시험시간 
		var FullTime= "${examList.testTime}";
  		var Time = FullTime.substring(3,5);  	
  		
  		//시험을 응시한 사람인지 체크
  		var check= "${examCheck.attendCompleteConfirmation}"
  		
  		//타이머 소스
   		$('#countdown-retro').epiclock({mode: $.epiclock.modes.countdown, offset: {minutes: Time}, format: 'x:i:s', renderer: 'retro-countdown'});   		
   		
   		//시험시간 초과시 자동으로 실행될 함수
   		function test(){
   			
   			if(check == 'F'){
	   			for(var i = 1; i <= 20; i++){
	   				
	   				examQuestionCode.push($("#examQuestionCode"+i).val());
	   				
	   				score.push($("#number"+i+":checked").val());
	   				
	   			}
	   			alert("시험시간이 끝나 자동 제출합니다.")
	   			location.href='/answerPaperAdd?score=' + score + "&testPaperCode=" + $("#testPaperCode").val() + "&examQuestionCode= " + examQuestionCode +"&attendCode=" + $("#attendCode").val();
   			}
   			
		}

   		
   		//시험시간 초과시 함수 실행
   		setTimeout(function(){test();} , Time*60*1000);
   		
   	
   		//시험제출 눌렀을때 실행
		$("#examAddBtn").click(function(){
  			if($(".examRadio:checked").length == 20){
  				
  				for(var i = 1; i <= $(".examRadio:checked").length; i++){
  					examQuestionCode.push($("#examQuestionCode"+i).val());
  					score.push($("#number"+i+":checked").val());
  				}
				console.log(examQuestionCode);
				console.log(score);
				
				location.href='/answerPaperAdd?score=' + score + "&testPaperCode=" + $("#testPaperCode").val() + "&examQuestionCode= " + examQuestionCode +"&attendCode=" + $("#attendCode").val();				
  			}else{
  				alert("답이 체크가 안된 문제가 있습니다.");
  			}
		});
	});
</script>
<title>시커먼스</title>
</head>
<body class="container" oncontextmenu="return false">
	<input type="hidden" value="${examCheck.attendCode}" id="attendCode">
	<dl style="width: 100%">
        <dd id="countdown-retro"></dd>
    </dl>
    <div style="width: 400px;">
    	<h2>
	    	<span>
	    		시험과목 : ${examOpenSubjectList.subjectName}
	    	</span>
	    	
	    	<span style="float: right;">
	    		${examOpenSubjectList.lectureSubject}
	    	</span>
	    </h2>
    </div>   
    <span>
  	 	시험문제 제출자 : ${examOpenSubjectList.professorName}
  	</span>
	<div>
		<c:forEach var="examList" items="${examList.examQuestionsList}" varStatus="status">
			<input type="hidden" id="testPaperCode" value="${examList.testPaperCode}">
			<div style="margin-bottom: 8%;width: 400px;height: 200px">
				<div style="width: 400px;height: 200px">
					<input type="hidden" id="examQuestionCode${status.count}" value="${examList.examQuestionCode}">
					<img src="/resources/examQuestion/${examList.examFileName}.${examList.examFileExt}" style="width: 100%;height: 100%">
				</div>
				<div class="clearfix">
					<ul style="width:100%; margin-top:10px;">				
					<li style="width:25%; float:left; list-style: none;">1.<input type="radio" id="number${status.count}" class="examRadio" name="${examList.examQuestionNo}" value="1"></li>    
					<li style="width:25%; float:left; list-style: none;">2.<input type="radio" id="number${status.count}" class="examRadio" name="${examList.examQuestionNo}" value="2"></li>     
					<li style="width:25%; float:left; list-style: none;">3.<input type="radio" id="number${status.count}" class="examRadio" name="${examList.examQuestionNo}" value="3"></li>     
					<li style="width:25%; float:left; list-style: none;">4.<input type="radio" id="number${status.count}" class="examRadio" name="${examList.examQuestionNo}" value="4"></li> 
					</ul>    
				</div>
			</div>
		</c:forEach> 
	</div>	
	<button type="button" class="btn btn-primary btn-block" id="examAddBtn" >제출하기</button>	
</body>
</html>