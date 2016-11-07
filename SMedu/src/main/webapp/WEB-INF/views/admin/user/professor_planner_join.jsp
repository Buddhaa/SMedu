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
        가입요청 리스트
        <small>회원관리</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">UI</a></li>
        <li class="active">Timeline</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- row -->
      <div class="row">
        <div class="col-md-12">
          <!-- The time line -->
          <ul class="timeline">
            <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-black">
                    교수 가입요청
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <c:if test="${joinRequestList==null}">
            <li>
              <i class="fa fa-user bg-aqua"></i>

              <div class="timeline-item">
                <span class="time"></span>

                <h3 class="timeline-header no-border">최근 <a href="#">가입요청</a> 이 없습니다.</h3>
              </div>
            </li>
            </c:if>
            <c:if test="${joinRequestList!=null}">
            	<c:forEach var="joinRequest" items="${joinRequestList}">
            		<c:if test="${joinRequest.userLevel=='교수'}">
			            <li>
			              <div class="timeline-item">
			                <span class="time"><i class="fa fa-clock-o"></i>${joinRequest.userJoinDate}</span>
			
			                <h3 class="timeline-header"><a href="#">${joinRequest.departmentName}</a></h3>
			
			                <div class="timeline-body">
			                  ${joinRequest.userLevel} ${joinRequest.userName} <br/>
			                  연락처 - ${joinRequest.userPhone}<br/>
			                  이메일 - ${joinRequest.userEmail}
			                </div>
			                <div class="timeline-footer">
			                  <a class="btn btn-warning btn-flat btn-xs">가입승인</a>
			                </div>
			              </div>
			            </li>
		            </c:if>
            	</c:forEach>
            </c:if>
            <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-gray">
                   	플래너 가입요청
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <c:if test="${joinRequestList!=null}">
            	<c:forEach var="joinRequest" items="${joinRequestList}">
            		<c:if test="${joinRequest.userLevel=='플래너'}">
			            <li>
			              <div class="timeline-item">
			                <span class="time"><i class="fa fa-clock-o"></i>${joinRequest.userJoinDate}</span>
			
			                <h3 class="timeline-header"><a href="#">${joinRequest.departmentName}</a></h3>
			
			                <div class="timeline-body">
			                  ${joinRequest.userLevel} ${joinRequest.userName} <br/>
			                  연락처 - ${joinRequest.userPhone}<br/>
			                  이메일 - ${joinRequest.userEmail}
			                </div>
			                <div class="timeline-footer">
			                  <a class="btn btn-warning btn-flat btn-xs">가입승인</a>
			                </div>
			              </div>
			            </li>
		            </c:if>
            	</c:forEach>
            </c:if>
            <li>
              <i class="fa fa-clock-o bg-gray"></i>
            </li>
          </ul>
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