<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Static</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="/admin/curriculum/departmentList"><i class="fa fa-circle-o text-red"></i> 학과</a></li>
                <li><a href="/admin/curriculum/bookList"><i class="fa fa-circle-o text-yellow"></i> 교재</a></li>
                <li><a href="/admin/curriculum/subjectList"><i class="fa fa-circle-o text-blue"></i> 과목</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Dynamic</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="/admin/curriculum/openSubjectList"><i class="fa fa-circle-o text-green"></i> 개설과목</a></li>
                <li><a href="#"><i class="fa fa-circle-o text-purple"></i> 강의</a></li>
              </ul>
            </div>
</body>
</html>