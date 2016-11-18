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
	
	var flag = false
	console.log(flag);
	
	$("#attendLectureView").hide()
	
	
	$("#cd_start").click(function(){
		$("#attendLectureView").show()
		flag = true
	});
	
	$("iframe").contents().click(function(event){
		console.log("11111");
	});
	
	var OrglectureTime = "${oneLectureList.LectureList.lectureTime}";
	var OrgattendTime = "${studentAttend.attendLectureTime}";	
	console.log("OrglectureTime : " + OrglectureTime);
	console.log("OrgattendTime : " + OrgattendTime);
	
	//강의 총 시간
	var lectureTimeMin = OrglectureTime.substring(3,5); 
	var lectureTimeSec = OrglectureTime.substring(6,8);

	console.log("lectureTimeMin : " +lectureTimeMin);
	console.log("lectureTimeSec : " +lectureTimeSec);
	
	$("#lectureTimeMin").text(lectureTimeMin);
	$("#lectureTimeSec").text(lectureTimeSec);
	
	var lectureTimeFullSec = (parseInt(lectureTimeMin*60) + parseInt(lectureTimeSec));
	console.log("lectureTimeFullSec : " +lectureTimeFullSec);
	
	
	//학생의 저장된 출석 시간
	var attendTimeMin = OrgattendTime.substring(3,5); 
	var attendTimeSec = OrgattendTime.substring(6,8);
	
	console.log("attendTimeMin : " +attendTimeMin);
	console.log("attendTimeSec : " +attendTimeSec);	
	
	$("#attendTimeMin").text(attendTimeMin);
	$("#attendTimeSec").text(attendTimeSec);	
	
	
	
	//카운트 할 시간
	var countTime = (parseInt(lectureTimeMin*60) + parseInt(lectureTimeSec)) - (parseInt(attendTimeMin*60) + parseInt(attendTimeSec));
	
	$("#cd_seconds").val(countTime);
	
	var startTime = countTime;

	var attendDbTime = parseInt(attendTimeMin*60) + parseInt(attendTimeSec);

	$("#attendAddBtn").click(function() {
		if(flag){
			var startTime = countTime;
			var endTime = parseInt($("#cd_m").text()*60) + parseInt($("#cd_s").text());
			var upDateTime = parseInt(attendDbTime + startTime - endTime)
			
			console.log("attendDbTime : " + attendDbTime);
			console.log("startTime : " + startTime);
			console.log("endTime : " + endTime);
			console.log("upDateTime : " + upDateTime);
			
			var attendCompleteConfirmation = parseInt(lectureTimeFullSec) - parseInt(upDateTime);
			
			if(attendCompleteConfirmation == 0 ){
				$("#attendCompleteConfirmation").val('T')
			}
			
			$("#upDateTime").val("00:"+Math.floor(upDateTime/60) + ":" +upDateTime%60);
			
			$("form").submit();	
		}else{
			alert("강의를 동영상을 수강해야합니다.")
		}			
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
                    
                    // save type
                    $.APP.dir = dir;
                    
                    // get current date
                    $.APP.d1 = new Date();
                    
                    switch($.APP.state) {
                            
                        case 'pause' :
                            
                            // resume timer
                            // get current timestamp (for calculations) and
                            // substract time difference between pause and now
                            $.APP.t1 = $.APP.d1.getTime() - $.APP.td;                            
                            
                        break;
                            
                        default :
                            
                            // get current timestamp (for calculations)
                            $.APP.t1 = $.APP.d1.getTime(); 
                            
                            // if countdown add ms based on seconds in textfield
                            if ($.APP.dir === 'cd') {
                                $.APP.t1 += parseInt($('#cd_seconds').val())*1000;
                            }    
                        
                        break;
                            
                    }                                   
                    
                    // reset state
                    $.APP.state = 'aon';   
                    $('#' + $.APP.dir + '_status').html('Running');
                    
                    // start loop
                    $.APP.loopTimer();
                    
                },
                
                pauseTimer : function() {
                    
                    // save timestamp of pause
                    $.APP.dp = new Date();
                    $.APP.tp = $.APP.dp.getTime();
                    
                    // save elapsed time (until pause)
                    $.APP.td = $.APP.tp - $.APP.t1;
                    
                    // change button value
                    $('#' + $.APP.dir + '_start').val('Resume');
                    
                    // set state
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
                                
                        // get current date and convert it into 
                        // timestamp for calculations
                        d2 = new Date();
                        t2 = d2.getTime();   
                        
                        // calculate time difference between
                        // initial and current timestamp
                        if ($.APP.dir === 'sw') {
                            td = t2 - $.APP.t1;
                        // reversed if countdown
                        } else {
                            td = $.APP.t1 - t2;
                            if (td <= 0) {
                                // if time difference is 0 end countdown
                                $.APP.endTimer(function(){
                                    $.APP.resetTimer();
                                    $('#' + $.APP.dir + '_status').html('Ended & Reset');
                                });
                            }    
                        }    
                        
                        // calculate milliseconds
                        ms = td%1000;
                        if (ms < 1) {
                            ms = 0;
                        } else {    
                            // calculate seconds
                            s = (td-ms)/1000;
                            if (s < 1) {
                                s = 0;
                            } else {
                                // calculate minutes   
                                var m = (s-(s%60))/60;
                                if (m < 1) {
                                    m = 0;
                                } else {
                                    // calculate hours
                                    var h = (m-(m%60))/60;
                                    if (h < 1) {
                                        h = 0;
                                    }                             
                                }    
                            }
                        }
                      
                        // substract elapsed minutes & hours
                        ms = Math.round(ms/100);
                        s  = s-(m*60);
                        m  = m-(h*60);                                
                        
                        // update display
                        $('#' + $.APP.dir + '_ms').html($.APP.formatTimer(ms));
                        $('#' + $.APP.dir + '_s').html($.APP.formatTimer(s));
                        $('#' + $.APP.dir + '_m').html($.APP.formatTimer(m));
                        $('#' + $.APP.dir + '_h').html($.APP.formatTimer(h));
                        
                        // loop
                        $.APP.t = setTimeout($.APP.loopTimer,1);
                    
                    } else {
                    
                        // kill loop
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
        // Frame exists, 
        iframe.contentWindow.postMessage(JSON.stringify({
            "event": "command",
            "func": func,
            "args": args || [],
            "id": frame_id
        }), "*");
    }
}

</script>


</head>
<body>
	<div style="text-align: center;">
	<input type="hidden" id="openSubjectCode" value="${oneLectureList.LectureList.openSubjectCode}" >
	<input type="hidden" id="academicCalendarCode" value="${oneLectureList.LectureList.academicCalendarCode}">
		<h1>${oneLectureList.LectureList.lectureContent}</h1>		
		
		<div id="whateverID" onclick=null>
			<iframe  width="700" height="450" title="YouTube video player" src="${oneLectureList.LectureList.lectureLink}?controls=0&amp;showinfo=0&enablejsapi=1"></iframe>
		</div>	
			
		<p style="color: red" >${oneLectureList.text}</p>
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
		</form>		
		<c:choose>
			<c:when test="${studentAttend.attendCompleteConfirmation == 'T'}">
				<h1>출석완료</h1>
			</c:when>
			<c:when test="${studentAttend.attendCompleteConfirmation == 'F'}">
				<button id="attendAddBtn" class="btn btn-primary btn-block">출석체크하기</button>
			</c:when>
		</c:choose>
	</div>
	<div>
	    <br/>
	    <br/>
	</div>
</body>
</html>