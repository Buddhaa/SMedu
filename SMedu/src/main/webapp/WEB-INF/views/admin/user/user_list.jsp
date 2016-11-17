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
		$("#userLevelSearch").val("${userLevel}").attr("selected", "selected");
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
        회원 리스트
        <small>회원정보 관리</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Simple</li>
      </ol>
    </section>
	<div class="pad margin no-print" style="margin: 5px;">
      <!-- <div class="callout callout-info" style="margin-bottom: 0!important; width:600px"> -->
      <div class="callout callout-info" style="margin-bottom: 0!important; width:600px; height:260px;">
        <h4><i class="fa fa-info"></i> Search Box:</h4><br/>
        <!-- select -->
        	<form action="/admin/user/userList">
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
                  <label class="col-md-2">권한</label>
                  <select class="form-control" style="width:200px" name="userLevel" id="userLevelSearch">
                  	<option value="">==선택==</option> 
                  	<option value="교수">교수</option> 
                  	<option value="플래너">플래너</option> 
                  	<option value="학생">학생</option>                  
                  </select>
               	</div>
               	<div class="form-group">
                  <label class="col-md-2">이름</label>
                  <input type="text" class="form-control" style="width:200px" name="userName" id="userNameSearch">                  
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-default"><i class="fa fa-search">검색</i></button> 
                  <a href="/admin/user/userList?userState=탈퇴"><button type="button" class="btn btn-default">탈퇴회원 조회</button></a>       
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
              <h3 class="box-title">User List</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 200px;">

                  <div class="input-group-btn">
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>회원코드</th>
                  <th>학과</th>
                  <th>이름</th>
                  <th>권한</th>
                  <th>가입날짜</th>
                  <th>계정상태</th>
                  <th></th>
                </tr>
                <c:forEach var="user" items="${userList}">
	                <tr>
	                  <td>${user.userCode}</td>
	                  <td>${user.departmentName}</td>
	                  <td>${user.userName}</td>
	                  <td>${user.userLevel}</td>
	                  <td>${user.userJoinDate}</td>
	                  <td>
	                  <c:if test="${user.userState=='정상'}">
	                  	<span class="label label-success">정상</span>
	                  </c:if>
	                  <c:if test="${user.userState=='승인대기'}">
	                  	<span class="label label-warning">승인대기</span>
	                  </c:if>
	                  <c:if test="${user.userState=='탈퇴'}">
	                  	<span class="label label-danger">탈퇴</span>
	                  </c:if>
	                  </td>
	                  <td><a href="/admin/user/userDetail?userCode=${user.userCode}"><span class="label label-primary">상세보기</span></a></td>
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