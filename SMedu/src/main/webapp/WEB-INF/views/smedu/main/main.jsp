<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>시커먼스</title>
</head>
<body id="top">
<!-- bady -->
<jsp:include page="../module/top.jsp" />
<div class="bgded overlay">
  <div id="pageintro" class="hoc clear"> 
<section class="section-white">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active">
          <img src="/resources/smedu/images/demo/backgrounds/bnr_bestSystem.jpg" alt="...">
          <div class="carousel-caption">
          </div>
        </div>
        <div class="item">
          <img src="/resources/smedu/images/demo/backgrounds/bnr_bestSystem1.jpg" alt="...">
          <div class="carousel-caption">
          </div>
        </div>
        <div class="item">
          <img src="/resources/smedu/images/demo/backgrounds/bnr_bestSystem2.png" alt="...">
          <div class="carousel-caption">
          </div>
        </div>
      </div>
    </div>
</section>
</div>
</div>

<div class="wrapper row3">
  <div class="hoc container clear"> 
	<div class="group demo">
		<div class="one_third first">
			<div id="content">
				<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					<li class="active"><a href="#red" data-toggle="tab">공지사항</a></li>
					<li><a href="#orange" data-toggle="tab">학사일정</a></li>
					<li><a href="#yellow" data-toggle="tab">수강후기</a></li>
				</ul>
					<div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="red">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered table-hover" id="tableAddRow">
										<thead>
											<tr>
												<th>공지사항</th>
												<th style="width: 10px">
													<a href="#">
														<span class="glyphicon glyphicon-plus addBtn" id="addBtn_0"></span>
													</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr id="tr_0">
												<td valign="top" align="left">
													<img alt="" src="/resources/smedu/images/demo/backgrounds/ico_notice.gif">공지사항
												</td>
												<td valign="top" align="right">2016.10.18&nbsp;&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="orange">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered table-hover" id="tableAddRow">
										<thead>
											<tr>
												<th>학사일정</th>
												<th style="width: 10px">
													<a href="#">
														<span class="glyphicon glyphicon-plus addBtn" id="addBtn_0"></span>
													</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr id="tr_0">
												<td valign="top" align="left">학사일정</td>
												<td valign="top" align="right">2016.10.18&nbsp;&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="yellow">
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-bordered table-hover" id="tableAddRow">
										<thead>
											<tr>
												<th>수강후기</th>
													<th style="width: 10px">
														<a href="#">
															<span class="glyphicon glyphicon-plus addBtn" id="addBtn_0"></span>
														</a>
													</th>
											</tr>
										</thead>
										<tbody>
											<tr id="tr_0">
												<td valign="top" align="left">수강후기</td>
												<td valign="top" align="right">2016.10.18&nbsp;&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="two_third ">
				<a href=""><img alt="" src="/resources/smedu/images/demo/backgrounds/n_main_sub_01.png"></a>
			</div>
		</div>
	</div>
</div>

<div class="container">
    <div class="row">
		<div class="col-md-12">
                <div id="Carousel" class="carousel slide">
                 
                <!--  <ol class="carousel-indicators">
                    <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#Carousel" data-slide-to="1"></li>
                    <li data-target="#Carousel" data-slide-to="2"></li>
                </ol> -->
                  
                <!-- Carousel items -->
                <div class="carousel-inner">
                    
                <div class="item active">
                	<div class="row">
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	  <div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                		<div class="col-md-3"><a href="#" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                </div><!--.carousel-inner-->
                  <a data-slide="prev" href="#Carousel" class="left carousel-control"></a>
                  <a data-slide="next" href="#Carousel" class="right carousel-control"></a>
                </div><!--.Carousel-->
		</div>
	</div>
</div><!--.container-->

<div class="wrapper row3">
  <div class="hoc container clear"> 
    <div class="posts">
      <div class="group btmspace-50 demo">
        <div class="one_quarter first">
        
		</div>
         <div class="two_quarter">
         	<span>
         	<img src="/resources/smedu/images/demo/gallery/lec_comtuper_b.jpg" 
			onmouseover="this.src='/resources/smedu/images/demo/gallery/lec_comtuper_a.JPG'"
			onmouseout="this.src='/resources/smedu/images/demo/gallery/lec_comtuper_b.jpg'" border="0">
			</span>
			<span>
         	<img src="/resources/smedu/images/demo/gallery/lec_communication_b.png" 
			onmouseover="this.src='/resources/smedu/images/demo/gallery/lec_communication_a.gif'"
			onmouseout="this.src='/resources/smedu/images/demo/gallery/lec_communication_b.png'" border="0">
			</span>
			<span>
         	<img src="/resources/smedu/images/demo/gallery/lec_security_a.jpg" 
			onmouseover="this.src='/resources/smedu/images/demo/gallery/lec_security_a.jpg'"
			onmouseout="this.src='/resources/smedu/images/demo/gallery/lec_security_b.jpg'" border="0">
			</span>
		</div>
        <div class="one_quarter">
        
		</div>
      </div>
    </div>
  </div>
</div>
<%-- <jsp:include page="../module/sidebar.jsp" /> --%>
<jsp:include page="../module/foot.jsp" />
</body>
</html>