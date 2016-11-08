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
        기수 일정 상세보기
        <small>기수 일정관리</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Invoice</li>
      </ol>
    </section>

    <!-- <div class="pad margin no-print">
      <div class="callout callout-info" style="margin-bottom: 0!important;">
        <h4><i class="fa fa-info"></i> Note:</h4>
        This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
      </div>
    </div> -->

    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> ${cardinal.year}년 ${cardinal.semester}학기 ${cardinal.cardinal}기
            <small class="pull-right">Date: </small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          <strong>수강 시작일</strong>
          <address>
            ${cardinal.classStartDay}<br>           
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <strong>수강 종료일</strong>
          <address>
           ${cardinal.classEndDay}<br>           
          </address>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>학사일정코드</th>
              <th>주차일정</th>
              <th>시작일</th>
              <th>종료일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="academicCalendar" items="${academicCalendarList}">
	            <tr>
	              <td>${academicCalendar.academicCalendarCode}</td>
	              <td>${academicCalendar.weeklySchedule}</td>
	              <td>${academicCalendar.academicCalendarStartDay}</td>
	              <td>${academicCalendar.academicCalendarEndDay}</td>
	            </tr>    
            </c:forEach>        
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->      

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
          <button type="button" class="btn btn-success pull-right" style="margin-right: 3px; ">
          	<i class="fa fa-credit-card"></i> 삭제
          </button>
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 3px;">
            <i class="fa fa-download"></i> 수정
          </button>
        </div>
      </div>
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
  </div>
  <!-- /.content-wrapper -->
	<jsp:include page="../module/foot.jsp" />
</body>
</html>