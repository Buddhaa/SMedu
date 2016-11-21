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
		$("#cardinalCodeSearch").val("${cardinalCode}").attr("selected", "selected");
		$("#subjectNameSearch").val("${subjectName}").attr("selected", "selected");
		$("#professorNameSearch").val("${professorName}").attr("selected", "selected");
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
        개설과목 관리
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
          <a href="compose.html" class="btn btn-primary btn-block margin-bottom">개설과목 등록</a>
          
			<jsp:include page="../module/sub_sidebar.jsp" />
			
           <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
        <div class="pad margin no-print" style="margin:5px; padding:0px;">
      <!-- <div class="callout callout-info" style="margin-bottom: 0!important; width:600px"> -->
      <div class="callout callout-info" style="margin-bottom: 0!important; width:600px; height:280px;">
        <h4><i class="fa fa-info"></i> Search Box:</h4><br/>
        <!-- select -->
        	<form action="/admin/curriculum/openSubjectList">
               	<div class="form-group">
                  <label class="col-md-2">기수</label>
                  <select class="form-control" style="width:200px" name="cardinalCode" id="cardinalCodeSearch">
                  	<option value="">==선택==</option> 
                  <c:forEach var="cardinal" items="${cardinalList}">
                 	<option value="${cardinal.cardinalCode}">${cardinal.year}년${cardinal.semester}학기${cardinal.cardinal}기수</option> 
                  </c:forEach>
                  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재 모집중, 개강중인 기수만 나타납니다.
               	</div>
               	<div class="form-group">
                  <label class="col-md-2">과목명</label>
                  <input type="text" class="form-control" style="width:200px" name="subjectName" id="subjectNameSearch">                  
                </div>
               	<div class="form-group">
                  <label class="col-md-2">교수명</label>
                  <input type="text" class="form-control" style="width:200px" name="professorName" id="professorNameSearch">                  
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-default"><i class="fa fa-search">검색</i></button>              
                </div>
            </form>
              </div>
      </div>
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">개설과목 리스트</h3> - 현재 모집중, 개강중인 기수만 검색합니다.

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
		              <th>개설과목코드</th>
		              <th>기수</th>
		              <th>교수</th>
		              <th>과목</th>
		              <th>교재</th>
		              <th>개설일자</th>
		            </tr>
		            </thead>
		            <tbody>
		            <c:forEach var="openSubject" items="${openSubjectList}">
			            <tr>
			              <td>${openSubject.openSubjectCode}</td>
			              <td>${openSubject.cardinal}</td>
			              <td>${openSubject.professorName}</td>
			              <td>${openSubject.subjectName}</td>
			              <td>${openSubject.bookName}</td>
			              <td>${openSubject.registerDate}</td>
			            </tr>	
		            </c:forEach>	            
		            </tbody>
		          </table>
		        </div>
		        <!-- /.col -->
		      </div>
		      <!-- /.row -->
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