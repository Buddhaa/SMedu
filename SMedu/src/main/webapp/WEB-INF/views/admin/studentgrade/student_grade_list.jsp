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
		$("#departmentSearch").val("${departmentCode}").attr("selected", "selected");
		$("#userNameSearch").val("${userName}").attr("selected", "selected");
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
        학생 리스트
        <small>학생성적관리</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Simple</li>
      </ol>
    </section>
    <div class="pad margin no-print" style="margin: 5px;">
      <!-- <div class="callout callout-info" style="margin-bottom: 0!important; width:600px"> -->
      <div class="callout callout-info" style="margin-bottom: 0!important; width:600px; height:210px;">
        <h4><i class="fa fa-info"></i> Search Box:</h4><br/>
        <!-- select -->
        	<form action="/admin/studentGrade/list">
               	<div class="form-group">
                  <label class="col-md-2">학과</label>
                  <select class="form-control" style="width:200px" name="departmentCode" id="departmentSearch">
                  	<option value="">==선택==</option> 
                  <c:forEach var="department" items="${departmentList}">
                    <option value="${department.departmentCode}">${department.departmentName}</option>         
                  </c:forEach>
                  </select>
               	</div>
               	<div class="form-group">
                  <label class="col-md-2">이름</label>
                  <input type="text" class="form-control" style="width:200px" name="userName" id="userNameSearch">                  
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-default"><i class="fa fa-search">검색</i></button>                 
                </div>
            </form>
              </div>
      </div>
	<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">학생 리스트</h3>

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
                  <th>학생코드</th>
                  <th>학과</th>
                  <th>이름</th>
                  <th>생년월일</th>                  
                  <th>최근 수강 기수</th>                  
                  <th></th>
                </tr>
                <c:forEach var="student" items="${studentList}">
	                <tr>
	                  <td>${student.studentCode}</td>
	                <c:forEach var="department" items="${departmentList}">
	                  	<c:if test="${student.departmentCode == department.departmentCode}">
	                  		<td>${department.departmentName}</td>
	                  	</c:if>
	                </c:forEach>
	                  <td>${student.userName}</td>
	                  <td>${student.userBirth}</td>
	                   <c:forEach var="cardinal" items="${cardinalList}">
	                  	<c:if test="${student.cardinalCode eq cardinal.cardinalCode}">
	                  		<td>${cardinal.year}년 ${cardinal.semester}학기 ${cardinal.cardinal}기수</td>
	                  	</c:if>
	                  </c:forEach>
	                  <td><a href="/admin/studentGrade/detail?userCode=${student.userCode}&studentCode=${student.studentCode}"><span class="label label-warning">조회</span></a></td>
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