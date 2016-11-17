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
        학과관리
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
          <a href="compose.html" class="btn btn-primary btn-block margin-bottom">학과등록</a>
          
			<jsp:include page="../module/sub_sidebar.jsp" />
			
           <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">학과리스트</h3>

              <div class="box-tools pull-right">
                <div class="has-feedback">
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
            <c:forEach var="department" items="${departmentList}">
           		<p class="text-muted well well-sm no-shadow" style="margin-top: 10px; width:900px;">
		            학과코드 : ${department.departmentCode}<br>
		            학과명: ${department.departmentName}
		            <a href="#" class="pull-right"><button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button></a>
	          	</p>
            </c:forEach>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
           
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