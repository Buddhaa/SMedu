<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../module/top.jsp" />
	<jsp:include page="../module/sidebar.jsp" />
	  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        회원정보
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">User profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <form action="" method="post">
    <section class="content">

      <div class="row">
        <div class="col-md-7">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="/resources/admin/dist/img/profile.jpg" alt="User profile picture">

              <h3 class="profile-username text-center">${originInfo.userName}</h3>              	

              <p class="text-muted text-center">${originInfo.userLevel}</p>
              
              <p class="text-muted text-center">
              <c:if test="${originInfo.userState=='정상'}">
                  	<span class="label label-success">정상</span>
                  </c:if>
                  <c:if test="${originInfo.userState=='승인대기'}">
                  	<span class="label label-warning">승인대기</span>
                  </c:if>
                  <c:if test="${originInfo.userState=='탈퇴'}">
                  	<span class="label label-danger">탈퇴</span>
              </c:if>
			  </p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>아이디</b> <a class="pull-right">${originInfo.userId}</a>
                </li>
                <li class="list-group-item">
                  <b>비밀번호</b> <a class="pull-right">${originInfo.userPw}</a>
                </li>
                <li class="list-group-item">
                  <b>이름</b> <a class="pull-right">${originInfo.userName}</a>
                </li>
                <li class="list-group-item">
                  <b>생년월일</b> <a class="pull-right">${originInfo.userBirth}</a>
                </li>
                <li class="list-group-item">
                  <b>성별</b> <a class="pull-right">${originInfo.userGender}</a>
                </li>
                <li class="list-group-item">
                  <b>주소</b> <a class="pull-right">${originInfo.userAddress}</a>
                </li>
                <li class="list-group-item">
                  <b>연락처</b> <a class="pull-right">${originInfo.userPhone}</a>
                </li>
                <li class="list-group-item">
                  <b>이메일</b> <a class="pull-right">${originInfo.userEmail}</a>
                </li>
                <li class="list-group-item">
                  <b>학력</b> <a class="pull-right">${originInfo.userEducational}</a>
                </li>
                <li class="list-group-item">
                  <b>권한</b> <a class="pull-right">${originInfo.userLevel}</a>
                </li>
                <li class="list-group-item">
                  <b>학과</b> <a class="pull-right">${originInfo.departmentName}</a>
                </li>
                <li class="list-group-item">
                  <b>가입일</b> <a class="pull-right">${originInfo.userJoinDate}</a>
                </li>
                <li class="list-group-item">
                  <b>회원탈퇴일</b> <a class="pull-right">${originInfo.userOutDate}</a>
                </li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">권한별 추가 정보</h3>
            </div>
            <!-- /.box-header -->
            <c:if test="${originInfo.userLevel=='교수'}">
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 학사</strong>

              <p class="text-muted"> ${plusInfo.professorBachelor}</p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 석사</strong>

              <p class="text-muted"> ${plusInfo.professorMaster}</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> 박사</strong>

              <p class="text-muted"> ${plusInfo.professorDoctor}</p>

              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> 주요경력</strong>

              <p class="text-muted"> ${plusInfo.professorCareer}</p>
              
              <hr>
              <input type="button" class="btn btn-primary btn-block" value="수정">
            </div>
            </c:if>
            <c:if test="${originInfo.userLevel=='플래너'}">
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 카톡아이디</strong>

              <p class="text-muted"> ${plusInfo.plannerKakao}</p>

              <hr>
              <input type="button" class="btn btn-primary btn-block" value="수정">              
            </div>
            </c:if>
            <c:if test="${originInfo.userLevel=='학생'}">
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 기수</strong>

              <p class="text-muted"> ${plusInfo.year}년도 ${plusInfo.semester} ${plusInfo.cardinal}</p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 알게된 경로</strong>

              <p class="text-muted"> ${plusInfo.studentPath}</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> 학위취득 목적</strong>

              <p class="text-muted"> ${plusInfo.studentGoal}</p>

              <hr>
              <input type="button" class="btn btn-primary btn-block" value="수정">            
            </div>
            </c:if>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    </form>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<jsp:include page="../module/foot.jsp" />
</body>
</html>