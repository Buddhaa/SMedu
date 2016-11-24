<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src = 'https://www.youtube.com/iframe_api'></script>
<script async src="//jsfiddle.net/ezmilhouse/V2S9d/embed/"></script>

<script>
$(document).ready(function() {
	//처음 실행되는 화면에 남은 강의 시간 & 출석버튼 숨기기	
	$("#attendLectureView").hide()
	$("#buttonDiv").hide()
	
	//재생버튼 클릭시 남은시간 & 출석버튼 화면에 보여줌
	$("#cd_start").click(function(){
		$("#attendLectureView").show()
		$("#buttonDiv").show()
	});
	
	//데이터베이스에 있는 강의시간과 출석시간을 변수에 선언 
	var OrglectureTime = "${oneLectureList.LectureList.lectureTime}";
	var OrgattendTime = "${studentAttend.attendLectureTime}";	
	
	//강의 총 시간
	var lectureTimeMin = OrglectureTime.substring(3,5); 
	var lectureTimeSec = OrglectureTime.substring(6,8);
	
	//강의 총 시간 화면에 보여줌
	$("#lectureTimeMin").text(lectureTimeMin);
	$("#lectureTimeSec").text(lectureTimeSec);
	
	// 00:00 분시간을 초로 변경 
	var lectureTimeFullSec = (parseInt(lectureTimeMin*60) + parseInt(lectureTimeSec));
	
	//학생의 저장된 출석 시간
	var attendTimeMin = OrgattendTime.substring(3,5); 
	var attendTimeSec = OrgattendTime.substring(6,8);	
	
	//학생의 저장된 출석 시간 화면에 보여줌
	$("#attendTimeMin").text(attendTimeMin);
	$("#attendTimeSec").text(attendTimeSec);	
		
	//카운트 할 시간 (강의 총 시간) - (학생의 출석 시간) 계산 
	var countTime = (parseInt(lectureTimeMin*60) + parseInt(lectureTimeSec)) - (parseInt(attendTimeMin*60) + parseInt(attendTimeSec));
	
	//카운트 시간을 정해서 줌 
	$("#cd_seconds").val(countTime);
	
	//시작 시간을 변수에 저장
	var startTime = countTime;
	
	//학생의 저장된 출석 시간 변수에 저장
	var attendDbTime = parseInt(attendTimeMin*60) + parseInt(attendTimeSec);

	//학생이 출석 버튼을 클릭했을 때 
	$("#attendAddBtn").click(function() {
		
		//클릭하는 순간의 강의 남은시간을 변수에 저장
		var endTime = parseInt($("#cd_m").text()*60) + parseInt($("#cd_s").text());
		
		//학생의 DB에 update시킬 시간을 계산 후 변수에 저장
		var upDateTime = parseInt(attendDbTime + startTime - endTime)
		
		//학생이 총 강의시간과 남은 강의시간을 계산 -> 0이면 출석 완료 0이 아니면 남은 출석시간 있음
		var attendCompleteConfirmation = parseInt(lectureTimeFullSec) - parseInt(upDateTime);
		
		//강의를 다 들었을 때 F->T변경 & 출석점수 2점 
		if(attendCompleteConfirmation == 0 ){
			$("#attendCompleteConfirmation").val('T')
			$("#attendScore").val('2')
		}
		
		//시간을 00:00:00 분단위로 계산 후 value값에 넣음 
		$("#upDateTime").val("00:"+Math.floor(upDateTime/60) + ":" +upDateTime%60);
		
		$("form").submit();	
	});
	
    (function($){
    
        $.extend({
            
            APP : {                
                
                formatTimer : function(a) {
                    if (a < 10) {
                        a = '0' + a;
                    }                              
                    return a;
                },    
                
                startTimer : function(dir) {
                    
                    var a;
                    
                    $.APP.dir = dir;
                    
                    $.APP.d1 = new Date();
                    
                    switch($.APP.state) {
                            
                        case 'pause' :
                            $.APP.t1 = $.APP.d1.getTime() - $.APP.td;                            
                        break;
                            
                        default :
                            $.APP.t1 = $.APP.d1.getTime(); 
                            if ($.APP.dir === 'cd') {
                                $.APP.t1 += parseInt($('#cd_seconds').val())*1000;
                            }    
                        break;
                    }                                   
                    
                    $.APP.state = 'aon';   
                    $('#' + $.APP.dir + '_status').html('Running');
                    
                    $.APP.loopTimer();
                    
                },
                
                pauseTimer : function() {
                    
                    $.APP.dp = new Date();
                    $.APP.tp = $.APP.dp.getTime();
                    
                    $.APP.td = $.APP.tp - $.APP.t1;
                    
                    $('#' + $.APP.dir + '_start').val('Resume');
                    
                    $.APP.state = 'pause';
                    $('#' + $.APP.dir + '_status').html('Paused');
                    
                },

                loopTimer : function() {
                    
                    var td;
                    var d2,t2;
                    
                    var ms = 0;
                    var s  = 0;
                    var m  = 0;
                    var h  = 0;
                    
                    if ($.APP.state === 'aon') {
                        d2 = new Date();
                        t2 = d2.getTime();   

                        if ($.APP.dir === 'sw') {
                            td = t2 - $.APP.t1;
                      	}else {
                            td = $.APP.t1 - t2;
                            if (td <= 0) {
                                $.APP.endTimer(function(){
                                    $.APP.resetTimer();
                                    $('#' + $.APP.dir + '_status').html('Ended & Reset');
                                });
                            }    
                        }    
                        
                        ms = td%1000;
                        if (ms < 1) {
                            ms = 0;
                        } else {    
                            s = (td-ms)/1000;
                            if (s < 1) {
                                s = 0;
                            } else {
                                var m = (s-(s%60))/60;
                                if (m < 1) {
                                    m = 0;
                                } else {
                                    var h = (m-(m%60))/60;
                                    if (h < 1) {
                                        h = 0;
                                    }                             
                                }    
                            }
                        }
                        
                        ms = Math.round(ms/100);
                        s  = s-(m*60);
                        m  = m-(h*60);                                
                        
                        $('#' + $.APP.dir + '_ms').html($.APP.formatTimer(ms));
                        $('#' + $.APP.dir + '_s').html($.APP.formatTimer(s));
                        $('#' + $.APP.dir + '_m').html($.APP.formatTimer(m));
                        $('#' + $.APP.dir + '_h').html($.APP.formatTimer(h));
                        
                        $.APP.t = setTimeout($.APP.loopTimer,1);
                    
                    } else {
                    
                        clearTimeout($.APP.t);
                        return true;
                    
                    }  
                    
                }
                    
            }    
        
        });
          
        $('#sw_start').on('click', function() {
            $.APP.startTimer('sw');
        });    

        $('#cd_start').on('click', function() {
            $.APP.startTimer('cd');
        });           
        
        $('#sw_pause,#cd_pause').on('click', function() {
            $.APP.pauseTimer();
        });                
                
    })(jQuery);
        
});

/* 유튜브*/
 	function callPlayer(frame_id, func, args) {
    if (window.jQuery && frame_id instanceof jQuery) frame_id = frame_id.get(0).id;
    var iframe = document.getElementById(frame_id);
    if (iframe && iframe.tagName.toUpperCase() != 'IFRAME') {
        iframe = iframe.getElementsByTagName('iframe')[0];
    }
    if (iframe) {
        iframe.contentWindow.postMessage(JSON.stringify({
            "event": "command",
            "func": func,
            "args": args || [],
            "id": frame_id
        }), "*");
    }
}
</script>
<title>시커먼스</title>
</head>
<body>
	<h2 style="margin-left: 5%">${oneLectureList.LectureList.lectureContent}</h2>
	<div style="text-align: center;">				
		<div style="float: left; margin-left: 5%">
			<div id="whateverID" >
				<iframe width="700" height="450" title="YouTube video player" src="${oneLectureList.LectureList.lectureLink}?controls=0&amp;showinfo=0&enablejsapi=1"></iframe>
			</div>	
			<p style="color: red" >${oneLectureList.text}</p>
		</div>
		
		<div style="float: left; margin-left: 5%">
			<div style="font-size: 30px">
				<a id="cd_start" href="javascript:void callPlayer(&quot;whateverID&quot;,&quot;playVideo&quot;)">재생</a> &bull; <a id="cd_pause" href="javascript:void callPlayer(&quot;whateverID&quot;,&quot;pauseVideo&quot;)">일시정지</a>
			</div>		
			<input type="hidden" id="cd_seconds" />		
			<br/>
			<br/>
			<div>
				총 강의 시간 : 
				<span id="lectureTimeMin"></span> : <span id="lectureTimeSec"></span>
			</div>
			<div id="attendLectureView">
				남은 강의 시간 :
				<span id="cd_m">00</span> : <span id="cd_s">00</span>
			</div>	
			<br/>
			
			<form action="/lectureAttendUpdate" method="get">
				<input type="hidden" name="attendCode" value="${studentAttend.attendCode}">
				<input type="hidden" id="upDateTime" name="attendLectureTime">
				<input type="hidden" id="attendCompleteConfirmation" name="attendCompleteConfirmation" value="F">
				<input type="hidden" id="attendScore" name="attendScore" value="0">
			</form>	
			<div id="buttonDiv">	
				<c:choose>
					<c:when test="${studentAttend.attendCompleteConfirmation == 'T'}">
						<h1>출석완료</h1>
					</c:when>
					<c:when test="${studentAttend.attendCompleteConfirmation == 'F'}">
						<button id="attendAddBtn" class="btn btn-primary btn-block">출석체크하기</button>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>