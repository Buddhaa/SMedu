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
		$("#departmentCodeSearch").val("${departmentCode}").attr("selected", "selected");
		$("#subjectNameSearch").val("${subjectName}").attr("selected", "selected");
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
        과목관리
        <small>교과관리</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Mailbox</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <a href="compose.html" class="btn btn-primary btn-block margin-bottom">과목등록</a>
          
			<jsp:include page="../module/sub_sidebar.jsp" />
			
           <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
        	<div class="pad margin no-print" style="margin:5px; padding:0px;">
      <!-- <div class="callout callout-info" style="margin-bottom: 0!important; width:600px"> -->
      <div class="callout callout-info" style="margin-bottom: 0!important; width:600px; height:210px;">
        <h4><i class="fa fa-info"></i> Search Box:</h4><br/>
        <!-- select -->
        	<form action="/admin/curriculum/subjectList">
               	<div class="form-group">
                  <label class="col-md-2">학과</label>
                  <select class="form-control" style="width:200px" name="departmentCode" id="departmentCodeSearch">
                  	<option value="">==선택==</option>
                  	<c:forEach var="department" items="${departmentList}">
                  	<option value="${department.departmentCode}">${department.departmentName}</option>
                  	</c:forEach>                  
                  </select>
               	</div>               	
               	<div class="form-group">
                  <label class="col-md-2">과목명</label>
                  <input type="text" class="form-control" style="width:200px" name="subjectName" id="subjectNameSearch">                  
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-default"><i class="fa fa-search">검색</i></button> 
                  <a href="/admin/curriculum/subjectList?subjectState=만료"><button type="button" class="btn btn-default">만료과목 조회</button></a>           
                </div>
            </form>
              </div>
      </div>
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">과목리스트</h3>

              <div class="box-tools pull-right">
                
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
              <!-- Table row -->
		      <div class="row">
		        <div class="col-xs-12 table-responsive">
		          <table class="table table-striped">
		            <thead>
		            <tr>
		              <th>과목코드</th>
		              <th>학과</th>
		              <th>과목명</th>
		              <th>이수구분</th>
		              <th>수강료</th>
		              <th>학점</th>
		              <th>등록일자</th>
		              <th>상태</th>
		            </tr>
		            </thead>
		            <tbody>
		            <c:forEach var="subject" items="${subjectList}">
			            <tr>
			              <td>${subject.subjectCode}</td>
			              <td>${subject.departmentName}</td>		              
			              <td>${subject.subjectName}</td>		              
			              <td>${subject.subjectSort}</td>		              
			              <td>${subject.subjectPay}</td>		              
			              <td>${subject.subjectCredit}</td>		              
			              <td>${subject.subjectDate}</td>		              
			              <td>${subject.subjectState}</td>		              
			            </tr>	
		            </c:forEach>	            
		            </tbody>
		          </table>
		        </div>
		        <!-- /.col -->
		      </div>
		      <!-- /.row -->
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
            </div>
          </div>
          <!-- /. box -->
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