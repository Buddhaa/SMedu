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
        기수모집 등록
        <small>기수일정관리</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">General Elements</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-7">
          <!-- general form elements -->
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">기수모집</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">년도 학기 기수</label>
                <br/>           
                	<input type="text" placeholder="2016" style="width:100px">년
	           		<input type="text" placeholder="0" style="width:100px">학기
	           		<input type="text" placeholder="0" style="width:100px">기수	
                </div>
                <label>모집</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>수강</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>                
              </div>
              <!-- /.box-body -->              

              <div class="box-footer">
              </div>            
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    <!-- /.content -->
    <!-- Main content -->
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">일정</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->            
              <div class="box-body">                
                <label>1주차</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>2주차</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>3주차, 과제</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>4주차</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>중간고사</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>6주차</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>7주차</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>8주차, 토론</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>9주차</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>
                <label>기말고사</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                  시작일<i class="fa fa-calendar"></i>                    
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                  <div class="input-group-addon">
                  종료일<i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" class="form-control pull-left" id="datepicker" placeholder="0000-00-00"style="width:150px">
                </div>            
              </div>
              <!-- /.box-body -->              

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">등록</button>
              </div>
            </form>
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<jsp:include page="../module/foot.jsp" />

</body>
</html>