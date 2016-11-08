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
        기수 리스트
        <small>기수일정관리</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Simple</li>
      </ol>
    </section>
	<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">기수 리스트</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 200px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>기수코드</th>
                  <th>기수</th>
                  <th>모집 시작일</th>
                  <th>모집 종료일</th>
                  <th>수강 시작일</th>
                  <th>수강 종료일</th>
                  <th></th>
                </tr>
                <c:forEach var="cardinal" items="${cardinalList}">
	                <tr>
	                  <td>${cardinal.cardinalCode}</td>
	                  <td>${cardinal.year}년 ${cardinal.semester}학기 ${cardinal.cardinal}기수</td>
	                  <td>${cardinal.recruitStartDay}</td>
	                  <td>${cardinal.recruitEndDay}</td>
	                  <td>${cardinal.classStartDay}</td>
	                  <td>${cardinal.classEndDay}</td>
	                  <td><a href="/admin/academicCalendar/detail?cardinalCode=${cardinal.cardinalCode}"><span class="label label-primary">일정확인</span></a></td>
	                </tr>
                </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <!-- /.box-body -->
            <div class="box-footer clearfix">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
            </div>
          </div>
          <!-- /.box -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<jsp:include page="../module/foot.jsp" />
</body>
</html>