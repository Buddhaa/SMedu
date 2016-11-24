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
	<script>
	$(document).ready(function(){
		var area = new Morris.Area({
		    element: 'revenue-chart',
		    resize: true,
		    data: [
		      {y: '2014 Q1', item1: 342},
		      {y: '2014 Q2', item1: 255},
		      {y: '2014 Q3', item1: 553},
		      {y: '2014 Q4', item1: 132},
		      {y: '2015 Q1', item1: 442},
		      {y: '2015 Q2', item1: 899},
		      {y: '2015 Q3', item1: 1001},
		      {y: '2015 Q4', item1: 597},
		      {y: '2016 Q1', item1: 777},
		      {y: '2016 Q2', item1: 687}
		    ],
		    xkey: 'y',
		    ykeys: ['item1'],
		    labels: ['가입자수'],
		    lineColors: ['#a0d0e0', '#3c8dbc'],
		    hideHover: 'auto'
		  });
		
		var donut = new Morris.Donut({
		    element: 'sales-chart',
		    resize: true,
		    colors: ["#3c8dbc","#FFFF6C", "#f56954", "#00a65a","#A748FF"],
		    data: [		      
		      {label: "인터넷광고%", value: "${studentKnowPathPercent.aa}"},
		      {label: "지역신문%", value: "${studentKnowPathPercent.bb}"},
		      {label: "지인소개%", value: "${studentKnowPathPercent.cc}"},
		      {label: "협력기관%", value: "${studentKnowPathPercent.dd}"},
		      {label: "홍보물%", value: "${studentKnowPathPercent.ee}"}
		    ],
		    hideHover: 'auto'
		  });
		var line = new Morris.Line({
		    element: 'line-chart',
		    resize: true,
		    data: [
		      {y: '2014 Q1', item1: 120},
		      {y: '2014 Q2', item1: 220},
		      {y: '2014 Q3', item1: 328},
		      {y: '2014 Q4', item1: 265},
		      {y: '2015 Q1', item1: 333},
		      {y: '2015 Q2', item1: 844},
		      {y: '2015 Q3', item1: 598},
		      {y: '2015 Q4', item1: 1005},
		      {y: '2016 Q1', item1: 689},
		      {y: '2016 Q2', item1: 777}
		    ],
		    xkey: 'y',
		    ykeys: ['item1'],
		    labels: ['수강신청자수'],
		    lineColors: ['#efefef'],
		    lineWidth: 2,
		    hideHover: 'auto',
		    gridTextColor: "#fff",
		    gridStrokeWidth: 0.4,
		    pointSize: 4,
		    pointStrokeColors: ["#efefef"],
		    gridLineColor: "#efefef",
		    gridTextFamily: "Open Sans",
		    gridTextSize: 10
		  });
		
		area.redraw();
		donut.redraw();	
		line.redraw();
			 
	});

	</script>
	<jsp:include page="../module/sidebar.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        메인 페이지
        <small>메인/현황/통계</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${todayCount}</h3>

              <p>오늘 방문자수</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">Today Count</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${totalCount}<sup style="font-size: 20px"></sup></h3>

              <p>총 방문자수</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">Total Count</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${monthStudentCount}</h3>

              <p>이번 달 학생 가입자수</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">This Month Student Join Count</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${monthStudentPay}원</h3>
              <p>이번달 수강신청 총 결제 금액</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">This Month Student Pay</a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
          <!-- Custom tabs (Charts with tabs)-->
          <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
              <li class="active"><a href="#revenue-chart" data-toggle="tab">가입자수</a></li>
              <li><a href="#sales-chart" data-toggle="tab">유입경로</a></li>
              <li class="pull-left header"><i class="fa fa-inbox"></i> 학생 가입 통계</li>
            </ul>
            <div class="tab-content no-padding">
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
              <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
            </div>
          </div>
          <!-- /.nav-tabs-custom -->       

          <!-- 최근가입자 목록 -->
          <div class="box box-primary">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">최근 가입자 목록</h3>

              <div class="box-tools pull-right">
                <ul class="pagination pagination-sm inline">
                 
                </ul>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th>회원코드</th>
                  <th>이름</th>
                  <th>학과</th>
                  <th>권한</th>
                  <th>가입일</th>
                  <th>상태</th>
                  <th></th>
                </tr>
                <c:forEach var="recentlyUser" items="${recentlyUserList}">
	                <tr>
	                  <td>${recentlyUser.userCode}</td>
	                  <td>${recentlyUser.userName}</td>
	                  <td>${recentlyUser.departmentName}</td>
	                  <td>${recentlyUser.userLevel}</td>
	                  <td>${recentlyUser.userJoinDate}</td>
	                  <td>
	                  <c:if test="${recentlyUser.userState=='정상'}">
	                  	<span class="label label-success">정상</span>
	                  </c:if>
	                  <c:if test="${recentlyUser.userState=='승인대기'}">
	                  	<span class="label label-warning">승인대기</span>
	                  </c:if>
	                  <c:if test="${recentlyUser.userState=='탈퇴'}">
	                  	<span class="label label-danger">탈퇴</span>
	                  </c:if>
	                  </td>	   
	                  <td><a href="/admin/user/userDetail?userCode=${recentlyUser.userCode}"><span class="label label-primary">상세보기</span></a></td>               
	                </tr>
                </c:forEach>                
              </table>
            </div>
          </div>
          <!-- 최근 게시글 목록 -->
          <div class="box box-primary">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">최근 게시글 목록</h3>

              <div class="box-tools pull-right">
                <ul class="pagination pagination-sm inline">
                 
                </ul>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th>회원코드</th>
                  <th>이름</th>
                  <th>학과</th>
                  <th>권한</th>
                  <th>가입일</th>
                  <th>상태</th>
                  <th></th>
                </tr>
                <c:forEach var="recentlyUser" items="${recentlyUserList}">
	                <tr>
	                  <td>${recentlyUser.userCode}</td>
	                  <td>${recentlyUser.userName}</td>
	                  <td>${recentlyUser.departmentName}</td>
	                  <td>${recentlyUser.userLevel}</td>
	                  <td>${recentlyUser.userJoinDate}</td>
	                  <td>
	                  <c:if test="${recentlyUser.userState=='정상'}">
	                  	<span class="label label-success">정상</span>
	                  </c:if>
	                  <c:if test="${recentlyUser.userState=='승인대기'}">
	                  	<span class="label label-warning">승인대기</span>
	                  </c:if>
	                  <c:if test="${recentlyUser.userState=='탈퇴'}">
	                  	<span class="label label-danger">탈퇴</span>
	                  </c:if>
	                  </td>	   
	                  <td><a href="/admin/user/userDetail?userCode=${recentlyUser.userCode}"><span class="label label-primary">상세보기</span></a></td>               
	                </tr>
                </c:forEach>                
              </table>
            </div>
          </div>       
        </section>
        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-5 connectedSortable">
        <!-- 기수별 수강신청 통계 -->
          <div class="box box-solid bg-teal-gradient">
            <div class="box-header">
              <i class="fa fa-th"></i>

              <h3 class="box-title">기수별 수강신청 통계(결제완료)</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn bg-teal btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                </button>
              </div>
            </div>
            <div class="box-body border-radius-none">
              <div class="chart" id="line-chart" style="height: 250px;"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-border">
              <div class="row">
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">Mail-Orders</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">Online</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center">
                  <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">In-Store</div>
                </div>
                <!-- ./col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
			<!-- Calendar -->
          <div class="box box-solid bg-green-gradient">
            <div class="box-header">
              <i class="fa fa-calendar"></i>

              <h3 class="box-title">Calendar</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!-- button with a dropdown -->
                <div class="btn-group">
                  <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bars"></i></button>
                  <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="#">Add new event</a></li>
                    <li><a href="#">Clear events</a></li>
                    <li class="divider"></li>
                    <li><a href="#">View calendar</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                </button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-black">
              <div class="row">
                <div class="col-sm-6">
                  <!-- Progress bars -->
                  <div class="clearfix">
                    <span class="pull-left">Task #1</span>
                    <small class="pull-right">90%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #2</span>
                    <small class="pull-right">70%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                  <div class="clearfix">
                    <span class="pull-left">Task #3</span>
                    <small class="pull-right">60%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #4</span>
                    <small class="pull-right">40%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->
          <!-- Map box -->
          <div class="box box-solid bg-light-blue-gradient">
            <div class="box-header">
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-primary btn-sm daterange pull-right" data-toggle="tooltip" title="Date range">
                  <i class="fa fa-calendar"></i></button>
                <button type="button" class="btn btn-primary btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" title="Collapse" style="margin-right: 5px;">
                  <i class="fa fa-minus"></i></button>
              </div>
              <!-- /. tools -->

              <i class="fa fa-map-marker"></i>

              <h3 class="box-title">
                Map
              </h3>
            </div>
            <div class="box-body">
              <div id="world-map" style="height: 250px; width: 100%;"></div>
            </div>
            <!-- /.box-body-->
            <div class="box-footer no-border">
              <div class="row">
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <div id="sparkline-1"></div>
                  <div class="knob-label">Visitors</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <div id="sparkline-2"></div>
                  <div class="knob-label">Online</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center">
                  <div id="sparkline-3"></div>
                  <div class="knob-label">Exists</div>
                </div>
                <!-- ./col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->          		
        </section>
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<jsp:include page="../module/foot.jsp" />
</body>
</html>