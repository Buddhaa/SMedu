<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){		
		$("#cardinal").val("${cardinalCode}").attr("selected", "selected");
		$("#openSubject").val("${openSubjectCode}").attr("selected", "selected");
		$("#cardinal").change(function(){
			var userCode = $("#userCode").val();
			var studentCode = $("#studentCode").val();
			var cardinalCode = $("#cardinal").val();
			var openSubjectCode = $("#openSubject").val();
			location.replace('/admin/studentGrade/detail?userCode='+ userCode +'&studentCode='+ studentCode +'&cardinalCode='+ cardinalCode);
		});
		$("#openSubject").change(function(){
			var userCode = $("#userCode").val();
			var studentCode = $("#studentCode").val();
			var cardinalCode = $("#cardinal").val();
			var openSubjectCode = $("#openSubject").val();
			location.replace('/admin/studentGrade/detail?userCode='+ userCode +'&studentCode='+ studentCode +'&cardinalCode='+ cardinalCode+'&openSubjectCode=' + openSubjectCode);
		});
		$("#test").click(function(){
			var openSubjectCode = $("#openSubject").val();
			if(openSubjectCode == '') {
				alert("조회할 과목을 선택후 조회해주세요.")
			}
		});
		$("#test2").click(function(){
			var openSubjectCode = $("#openSubject").val();
			if(openSubjectCode == '') {
				alert("조회할 과목을 선택후 조회해주세요.")
			}
		});
		$("#test3").click(function(){
			var openSubjectCode = $("#openSubject").val();
			if(openSubjectCode == '') {
				alert("조회할 과목을 선택후 조회해주세요.")
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../module/top.jsp" />
	<jsp:include page="../module/sidebar.jsp" />
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        학생 성적 조회
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">User profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="/resources/admin/dist/img/profile.jpg" alt="User profile picture">

              <h3 class="profile-username text-center">${studentInfo.userName}</h3>

              <p class="text-muted text-center">${studentInfo.userLevel}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>학생코드</b> <a class="pull-right">${studentCode}</a>
                  <input type="hidden" id="studentCode" value="${studentCode}">
                  <input type="hidden" id="userCode" value="${studentInfo.userCode}">
                </li>
                <li class="list-group-item">
                  <b>생년월일</b> <a class="pull-right">${studentInfo.userBirth}</a>
                </li>
                <li class="list-group-item">                	
                  <b>학과</b> <a class="pull-right">${studentInfo.departmentName}</a>             
                </li>
                <li class="list-group-item">
                  <b>기수</b>
				  <select class="form-control pull-right" id="cardinal" name="cardinalCode" style=" width:150px;">
                  	<option value="">==선택==</option> 
                  <c:forEach var="cardinal" items="${cardinalList}">
                    <option value="${cardinal.cardinalCode}">${cardinal.year}년${cardinal.semester}학기${cardinal.cardinal}기</option>         
                  </c:forEach>
                  </select>
                </li>
                
                <li class="list-group-item">
                  <b>수강 과목</b>                  
			      <select class="form-control pull-right" id="openSubject" style=" width:150px; height:32px;">
                  	<option value="">==선택==</option> 
                  <c:forEach var="classRegistration" items="${classRegistrationList}">
                    <option value="${classRegistration.openSubjectCode}">${classRegistration.subjectName}</option>    
                  </c:forEach>                 
                  </select>
                </li>
              </ul>             
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->          
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">과목 정보 <c:if test="${openSubjectCode == ''}">- 과목을 선택해주세요</c:if></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 과목명</strong>

              <p class="text-muted">
                ${openSubject.subjectName}
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 교수 이름</strong>

              <p class="text-muted">${openSubject.professorName} 교수</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> 이수구분</strong>

              <p>
                ${openSubject.subjectSort}
              </p>

              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> 학점</strong>

              <p>${openSubject.subjectCredit}학점</p>              
            </div>
            <!-- /.box-body -->
          </div>          
          <!-- /.box -->
        </div>        
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
            <c:if test="${openSubjectCode == ''}">
              <li class="active"><a href="#activity" data-toggle="tab">총 이수학점</a></li>
              <li><a href="#activity2" data-toggle="tab" id="test">과목 총 성적</a></li>
            </c:if>
            <c:if test="${openSubjectCode != ''}">
              <li><a href="#activity" data-toggle="tab">총 이수학점</a></li>
              <li class="active"><a href="#activity2" data-toggle="tab" id="test">과목 총 성적</a></li>
            </c:if>
              <li><a href="#timeline" data-toggle="tab" id="test2">출석률 및 제출물</a></li>
              <li><a href="#timeline2" data-toggle="tab" id="test3">중간·기말 답안</a></li>
            </ul>
            <div class="tab-content">
              <c:if test="${openSubjectCode == ''}">
              <div class="active tab-pane" id="activity">                        
                <div class="row">
			        <div class="col-xs-12 table-responsive">
			          <table class="table table-striped">
			            <thead>
				            <tr>
				              <th>학기</th>
				              <th>구분</th>
				              <th>과목명</th>
				              <th>개강일</th>
				              <th>종강일</th>
				              <th>이수학점</th>
				              <th>총점</th>
				              <th>교수명</th>
				              <th>이수여부</th>
				            </tr>
			            </thead>
			            <tbody>
			            	<c:forEach var="finalGrade" items="${finalGradeList}">
					            <tr>
					              <td>${finalGrade.year}년도${finalGrade.semester}학기</td>
					              <td>${finalGrade.subjectSort}</td>
					              <td>${finalGrade.subjectName}</td>
					              <td>${finalGrade.classStartDay}</td>
					              <td>${finalGrade.classEndDay}</td>
					              <td>${finalGrade.subjectCredit}</td>
					              <td>${finalGrade.finalResult}</td>
					              <td>${finalGrade.userName}</td>
					              <td>${finalGrade.completeConfirmation}</td>
					            </tr>
				            </c:forEach>	           
			            </tbody>
			            <tfoot>
			            <tr>
			            <td>합계</td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td>총 이수학점:</td>
			            <td>총 평균점수:</td>
			            </tr>
			            </tfoot>
			          </table>
			        </div>
			        <!-- /.col -->
			      </div>
			      <!-- /.row -->
              </div>
              </c:if>
              <c:if test="${openSubjectCode != ''}">
              <div class="tab-pane" id="activity">                        
                <div class="row">
			        <div class="col-xs-12 table-responsive">
			          <table class="table table-striped">
			            <thead>
				            <tr>
				              <th>학기</th>
				              <th>구분</th>
				              <th>과목명</th>
				              <th>개강일</th>
				              <th>종강일</th>
				              <th>이수학점</th>
				              <th>총점</th>
				              <th>교수명</th>
				              <th>이수여부</th>
				            </tr>
			            </thead>
			            <tbody>
			            	<c:forEach var="finalGrade" items="${finalGradeList}">
					            <tr>
					              <td>${finalGrade.year}년도${finalGrade.semester}학기</td>
					              <td>${finalGrade.subjectSort}</td>
					              <td>${finalGrade.subjectName}</td>
					              <td>${finalGrade.classStartDay}</td>
					              <td>${finalGrade.classEndDay}</td>
					              <td>${finalGrade.subjectCredit}</td>
					              <td>${finalGrade.finalResult}</td>
					              <td>${finalGrade.userName}</td>
					              <td>${finalGrade.completeConfirmation}</td>
					            </tr>
				            </c:forEach>	           
			            </tbody>
			            <tfoot>
			            <tr>
			            <td>합계</td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td>총 이수학점:</td>
			            <td>총 평균점수:</td>
			            </tr>
			            </tfoot>
			          </table>
			        </div>
			        <!-- /.col -->
			      </div>
			      <!-- /.row -->
              </div>
              </c:if>
              <!-- /.tab-pane -->
              <c:if test="${openSubjectCode ==''}">
	              <div class="tab-pane" id="activity2">
	              조회할 과목을 선택후 조회해주세요
	              </div>
              </c:if>
              <c:if test="${openSubjectCode !=''}">
              <div class="active tab-pane" id="activity2">
                <!-- Post -->
                <div class="post">
               	  <div class="user-block">
                        <span class="username">
                          <a href="#">${openSubject.subjectName}</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">
                    <c:forEach var="cardinal" items="${cardinalList}">
                    	<c:if test="${cardinal.cardinalCode == cardinalCode}">
                    		${cardinal.year}년${cardinal.semester}학기${cardinal.cardinal}기     
                    	</c:if> 
                    </c:forEach>
                  </span>
                  </div>
                 <table class="table table-bordered">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>성적평가항목</th>
                  <th>점수</th>
                  <th>참여완료여부</th>
                  <th></th>
                </tr>
                <c:forEach var="grade" items="${gradeList}">
	                <tr>
	                  <td>${grade.gradeCode}</td>
	                  <td>${grade.gradeEvaluationCategory}</td>
	                  <td><span class="badge bg-light-blue">${grade.gradeScore}</span></td>
	                  <c:if test="${grade.participationState == 'T'}">                
	                 	 <td><span class="badge bg-green">O</span></td>
	                  </c:if>
	                  <c:if test="${grade.participationState == 'F'}">                
	                 	 <td><span class="badge bg-red">X</span></td>
	                  </c:if>
	                  <td><a href="#"><span class="label label-warning">참여권한부여</span></a></td>
	                </tr>
                </c:forEach>
                <c:forEach var="finalGrade" items="${finalGradeList}"> 
	                <c:if test="${finalGrade.subjectName == openSubject.subjectName}">
	                	<c:if test="${finalGrade.finalResult >= 60}">        
			                <tr>
			                  <td>합계</td>
			                  <td></td>
			                  <td>
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
			                    </div>
			                  </td>
			                  <td>총점 : <span class="badge bg-green">${finalGrade.finalResult}</span></td>
			                  <td>이수여부 : <span class="badge bg-green">이수</span></td>
			                </tr>
		                </c:if>
		                <c:if test="${finalGrade.finalResult < 60}">     
			                <tr>
			                  <td>합계</td>
			                  <td></td>
			                  <td>
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-danger" style="width: 50%"></div>
			                    </div>
			                  </td>
			                  <td>총점 : <span class="badge bg-red">${finalGrade.finalResult}</span></td>
			                  <td>이수여부 : <span class="badge bg-red">미이수</span></td>
			               </tr>
		                </c:if>
	                </c:if>
	            </c:forEach>               
              </table>              
                </div>
                <!-- /.post -->
                <div class="post">
                </div>
              </div>
              <!-- /.tab-pane -->
              </c:if>
              <c:if test="${openSubjectCode ==''}">
	              <div class="tab-pane" id="timeline">
	              조회할 과목을 선택후 조회해주세요
	              </div>
              </c:if>
              <div class="tab-pane" id="timeline">
                <!-- The timeline -->
                <ul class="timeline timeline-inverse">
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-gray">
                          출석률
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>

                    <div class="timeline-item">                      
						 <span class="time"><i class="fa fa-clock-o"></i> 1주차 ~ 10주차</span>
                      <h3 class="timeline-header"><a href="#">출석률</a></h3>
                      <span class="description">&nbsp;&nbsp;&nbsp;&nbsp; 만점 : 20</span>	

                      <div class="timeline-body">
                        <table class="table table-bordered">
			                <tr>
			                  <th style="width: 50px">#</th>
			                  <th style="width: 20px">1주차</th>
			                  <th style="width: 20px">2주차</th>
			                  <th style="width: 20px">3주차</th>
			                  <th style="width: 20px">4주차</th>
			                  <th style="width: 20px">중간고사</th>
			                  <th style="width: 20px">6주차</th>
			                  <th style="width: 20px">7주차</th>
			                  <th style="width: 20px">8주차</th>
			                  <th style="width: 20px">9주차</th>
			                  <th style="width: 20px">기말고사</th>
			                  <th style="width: 20px"></th>
			                </tr>
			                <tr>
			                  <td>출석여부</td>
			                <c:forEach var="attend" items="${attendList}">
				              <c:if test="${attend.attendCompleteConfirmation == 'T'}">                
			                  <td><span class="badge bg-green">O</span></td>
			                  </c:if>
			                  <c:if test="${attend.attendCompleteConfirmation == 'F'}">                
			                  <td><span class="badge bg-red">X</span></td>
			                  </c:if>
				            </c:forEach>				              
				            </tr>
				            <tr>
				              <td>출석날짜</td>
				            <c:forEach var="attend" items="${attendList}">
				              <td>${attend.attendDate}</td>
				            </c:forEach>
				            </tr>  
				            <tr>
				              <td>출석점수</td>
				            <c:forEach var="attend" items="${attendList}">
				              <td>${attend.attendScore}</td>
				            </c:forEach>
				            </tr>       
			                
			              </table>              
                      </div>
                      <span class="time"><i class="fa fa-clock-o"></i>채점날짜 : ${debateScore.debateScoreDate}</span>					  
                      <h3 class="timeline-header"><a href="#">출석 점수 : ${debateScore.debateScore}</a> </h3>
                    </div>
                  </li>
                  <!-- END timeline item -->                  
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-gray">
                          과제 및 토론
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>    
                    <div class="timeline-item">
					  <span class="time"><i class="fa fa-clock-o"></i>제출날짜 : ${task.taskResultDate}</span>					  
                      <h3 class="timeline-header"><a href="#">과제</a> </h3>
                      <div class="timeline-header">
                      <h4>&nbsp;과제 주제 - ${task.taskSubject}</h4>
					  	<hr/>
					  	&nbsp;&nbsp;과제 내용 - ${task.taskContent}					  	
                      </div>				  	
                      <div class="timeline-header">
                      <span class="time"><i class="fa fa-clock-o"></i>제출날짜 : ${task.taskResultDate}</span>
                      <h4>&nbsp;제출물 제목 - ${task.taskResultTitle}</h4>
					  	<hr/>
					  	&nbsp;&nbsp;제출물 내용 - ${task.taskResultContent}
					  	<c:if test="${task.taskFileName != null}">
					  	<br/><br/>
					  	&nbsp;&nbsp;<small>첨부파일 : ${task.taskOriginFileName}(${task.taskFileSize}kb)</small>
					  	</c:if>
                      </div>
                      <span class="time"><i class="fa fa-clock-o"></i>채점날짜 : ${task.taskScoreDate}</span>					  
                      <h3 class="timeline-header"><a href="#">채점점수 : ${task.taskScore}</a> </h3>
                    </div>
                  </li>
                  <!-- END timeline item --> 
                  <!-- timeline item -->
                  <li>    
                    <div class="timeline-item">
					  <span class="time"><i class="fa fa-clock-o"></i>제출날짜 : ${debate.debateRegisterDate}</span>
                      <h3 class="timeline-header"><a href="#">토론</a> </h3>
					  <div class="timeline-header">
                      <h4>&nbsp;토론 주제 - ${debate.debateSubject}</h4>
					  	<hr/>
					  	&nbsp;&nbsp;토론 내용 - ${debate.debateContent}					  	
                      </div>
                      <c:forEach var="debateResult" items="${debateResult}">
                      <div class="timeline-header">
                      <span class="time"><i class="fa fa-clock-o"></i>답변날짜 : ${debateResult.debateRegisterDate}</span>
                      <h4>&nbsp;답변 내용 - ${debateResult.debateComment}</h4>					  						  	
                      </div>
                      </c:forEach>
                      <span class="time"><i class="fa fa-clock-o"></i>채점날짜 : ${debateScore.debateScoreDate}</span>					  
                      <h3 class="timeline-header"><a href="#">채점점수 : ${debateScore.debateScore}</a> </h3>                    
                    </div>
                  </li>
                  <!-- END timeline item -->                                                    
                </ul>
              </div>
              
              <c:if test="${openSubjectCode ==''}">
	              <div class="tab-pane" id="timeline2">
	              조회할 과목을 선택후 조회해주세요
	              </div>
              </c:if>
              <div class="tab-pane" id="timeline2">
                <!-- The timeline -->
                <ul class="timeline timeline-inverse">                 
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-gray">
                          중간 및 기말
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>    
                    <div class="timeline-item">
					  <span class="time"><i class="fa fa-clock-o"></i> 제출날짜 : ${MidExamInfo.testPaperDate}</span>
                      <h3 class="timeline-header"><a href="#">중간고사</a> </h3>
					  <span class="description">&nbsp;&nbsp;&nbsp;&nbsp; 시험응시기간 : ${MidExamInfo.academicCalendarStartDay} ~ ${MidExamInfo.academicCalendarEndDay}</span><br>
					  <span class="description">&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-clock-o"></i> 학생시험응시날짜 : ${MidExamAndAnswerList[0].examDate}</span>	
                      <div class="timeline-body">
                        <table class="table table-bordered">
			                <tr>
			                  <th>#</th>
			                  <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${MidExamAndAnswer.examQuestionNo}번</th>
			                  </c:forEach>			                  
			                </tr>
			                <tr>
			                  <td>시험답안</td>
			                <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${MidExamAndAnswer.examQuestionAnswer}</th>
			                  </c:forEach>
				            </tr>
				            <tr>
				              <td>배점</td>
				            <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${MidExamAndAnswer.examQuestionScore}점</th>
			                  </c:forEach>
				            </tr>  
				            <tr>
				              <td>학생답안</td>
				            <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="0" end="9" step="1">
				              <c:if test="${MidExamAndAnswer.answerQuestion == MidExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-green">${MidExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                  <c:if test="${MidExamAndAnswer.answerQuestion != MidExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-red">${MidExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                 </c:forEach>
				            </tr>
				            <tr>
				              <td>채점점수</td>
				            <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${MidExamAndAnswer.answerQuestionScore}점</th>
			                  </c:forEach>
				            </tr> 
			                
			              </table>
			              <table class="table table-bordered">
			                <tr>
			                  <th>#</th>
			                  <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${MidExamAndAnswer.examQuestionNo}번</th>
			                  </c:forEach>			                  
			                </tr>
			                <tr>
			                  <td>시험답안</td>
			                <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${MidExamAndAnswer.examQuestionAnswer}</th>
			                  </c:forEach>
				            </tr>
				            <tr>
				              <td>배점</td>
				            <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${MidExamAndAnswer.examQuestionScore}점</th>
			                  </c:forEach>
				            </tr>  
				            <tr>
				              <td>학생답안</td>
				            <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="10" end="19" step="1">
				              <c:if test="${MidExamAndAnswer.answerQuestion == MidExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-green">${MidExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                  <c:if test="${MidExamAndAnswer.answerQuestion != MidExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-red">${MidExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                 </c:forEach>
				            </tr>
				            <tr>
				              <td>채점점수</td>
				            <c:forEach var="MidExamAndAnswer" items="${MidExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${MidExamAndAnswer.answerQuestionScore}점</th>
			                  </c:forEach>
				            </tr> 
			                
			              </table>                   
                      </div>
                      <span class="time"><i class="fa fa-clock-o"></i>채점날짜 : ${debateScore.debateScoreDate}</span>					  
                      <h3 class="timeline-header"><a href="#">채점 총 점수 : ${debateScore.debateScore}</a> </h3>
                    </div>
                  </li>
                  <!-- END timeline item --> 
                  <!-- timeline item -->
                  <li>    
                    <div class="timeline-item">
					  <span class="time"><i class="fa fa-clock-o"></i> 제출날짜 : ${finalExamInfo.testPaperDate}</span>
                      <h3 class="timeline-header"><a href="#">기말고사</a> </h3>
					  <span class="description">&nbsp;&nbsp;&nbsp;&nbsp; 시험응시기간 : ${finalExamInfo.academicCalendarStartDay} ~ ${finalExamInfo.academicCalendarEndDay}</span><br>
					  <span class="description">&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-clock-o"></i> 학생시험응시날짜 : ${finalExamAndAnswerList[0].examDate}</span>	
                      <div class="timeline-body">
                        <table class="table table-bordered">
			                <tr>
			                  <th>#</th>
			                  <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${finalExamAndAnswer.examQuestionNo}번</th>
			                  </c:forEach>			                  
			                </tr>
			                <tr>
			                  <td>시험답안</td>
			                <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${finalExamAndAnswer.examQuestionAnswer}</th>
			                  </c:forEach>
				            </tr>
				            <tr>
				              <td>배점</td>
				            <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${finalExamAndAnswer.examQuestionScore}점</th>
			                  </c:forEach>
				            </tr>  
				            <tr>
				              <td>학생답안</td>
				            <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="0" end="9" step="1">
				              <c:if test="${finalExamAndAnswer.answerQuestion == finalExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-green">${finalExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                  <c:if test="${finalExamAndAnswer.answerQuestion != finalExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-red">${finalExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                 </c:forEach>
				            </tr>
				            <tr>
				              <td>채점점수</td>
				            <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="0" end="9" step="1">
			                  <th>${finalExamAndAnswer.answerQuestionScore}점</th>
			                  </c:forEach>
				            </tr> 
			                
			              </table>
			              <table class="table table-bordered">
			                <tr>
			                  <th>#</th>
			                  <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${finalExamAndAnswer.examQuestionNo}번</th>
			                  </c:forEach>			                  
			                </tr>
			                <tr>
			                  <td>시험답안</td>
			                <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${finalExamAndAnswer.examQuestionAnswer}</th>
			                  </c:forEach>
				            </tr>
				            <tr>
				              <td>배점</td>
				            <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${finalExamAndAnswer.examQuestionScore}점</th>
			                  </c:forEach>
				            </tr>  
				            <tr>
				              <td>학생답안</td>
				            <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="10" end="19" step="1">
				              <c:if test="${finalExamAndAnswer.answerQuestion == finalExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-green">${finalExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                  <c:if test="${finalExamAndAnswer.answerQuestion != finalExamAndAnswer.examQuestionAnswer}">				           
			                  	<th><span class="badge bg-red">${finalExamAndAnswer.answerQuestion}</span></th>
			                  </c:if>
			                 </c:forEach>
				            </tr>
				            <tr>
				              <td>채점점수</td>
				            <c:forEach var="finalExamAndAnswer" items="${finalExamAndAnswerList}" begin="10" end="19" step="1">
			                  <th>${finalExamAndAnswer.answerQuestionScore}점</th>
			                  </c:forEach>
				            </tr> 
			                
			              </table>                   
                      </div>
                      <span class="time"><i class="fa fa-clock-o"></i>채점날짜 : ${debateScore.debateScoreDate}</span>					  
                      <h3 class="timeline-header"><a href="#">채점 총 점수 : ${debateScore.debateScore}</a> </h3>
                    </div>
                  </li>
                  <!-- END timeline item -->                                   
                </ul>
              </div>
                                       
              
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<jsp:include page="../module/foot.jsp" />
</body>
</html>