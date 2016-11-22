<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
</head>
<body>
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/resources/admin/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${userInfo.userName}님 로그인</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="검색">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN</li>
		<!-- 메인페이지 -->
         <li>
          <a href="/admin/main/main">
          &nbsp;<i class="fa fa-pie-chart"></i> <span>메인 / 현황 / 통계</span>
          </a>
        </li>
        <li class="header">MANAGEMNET</li>
		<!-- 회원정보관리 -->
		<li class="treeview">
          <a href="#">
            &nbsp;<i class="fa fa-th"></i> <span>회원정보관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/user/userList"><i class="fa fa-circle-o"></i> 회원 리스트</a></li>
            <li><a href="/admin/user/joinRequest"><i class="fa fa-circle-o"></i> 가입 승인요청</a></li>
          </ul>
        </li>
		<!-- 학생성적관리 -->
		<li>
			<a href="/admin/studentGrade/list">
			&nbsp;<i class="fa fa-table"></i> <span>학생성적관리</span></a>
		</li>
		<!-- 기수일정관리 -->
		<li class="treeview">
          <a href="#">
           &nbsp;<i class="fa fa-calendar"></i> <span>기수일정관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/academicCalendar/list"><i class="fa fa-circle-o"></i> 모집일정 리스트</a></li>
            <li><a href="/admin/academicCalendar/insertForm"><i class="fa fa-circle-o"></i> 기수 모집 등록</a></li>
          </ul>
        </li>
		<!-- 교과 관리 -->
		<li class="treeview">
          <a href="/admin/curriculum/departmentList">
            &nbsp;<i class="fa fa-book"></i> <span> 교과관리</span>            
          </a>          
        </li>
		<!-- 시험/과제/토론 관리 -->
		<li class="treeview">
          <a href="#">
            &nbsp;<i class="fa fa-files-o"></i> <span>시험 / 과제 / 토론</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>              
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> 시험</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 과제</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 토론</a></li>
          </ul>
        </li>
		<!-- 게시판 관리 -->
		<li class="treeview">
          <a href="#">
            &nbsp;<i class="fa fa-edit"></i><span>게시판 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> 공지사항</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 자료실</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 수강후기</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> FAQ</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 상담게시판</a></li>
          </ul>
        </li>
        <li class="header">DOCUMNET</li>
		<!-- 수강신청/결제이력 조회 -->
		<li class="treeview">
          <a href="#"><i class="fa fa-fw fa-paypal"></i>
            <span>수강신청/결제이력</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> 수강신청 이력 조회</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 결제이력 조회</a></li>
          </ul>
        </li>
		<!-- 학습설계/강의평가 조회 -->
		<li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-clipboard"></i>
            <span>학습설계/강의평가</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> 학습설계 조회</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 강의평가 조회</a></li>
          </ul>
        </li>
		
        <!-- --------------------------------------- -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
</body>
</html>