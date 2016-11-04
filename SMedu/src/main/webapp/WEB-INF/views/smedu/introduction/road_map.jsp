<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../module/top.jsp" />
	
<div class="wrapper row3">
	<div class="hoc container clear">
			<jsp:include page="../module/introduction_sidebar.jsp" />
		<div class="content three_quarter">
			<h1>찾아오시는 길</h1><hr>
			<div id="daumRoughmapContainer1478221860023" class="root_daum_roughmap root_daum_roughmap_landing"></div>
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1478221860023",
					"key" : "dx42",
					"mapWidth" : "600",
					"mapHeight" : "300"
				}).render();
			</script>
			
			<div style="margin-top: 20px;">	
				<p style="width:750px;">
					<strong style="float:left; font-size:1.3em; width:150px;">주소</strong>
					<span style="font-size:1.2em;">&nbsp; 전북 전주시 덕진구 기린대로 446 2층</span> 
				</p>
				
				<p style="fwidth:750px;">
					<strong style="float:left; font-size:1.3em; width:150px;">고객센터 </strong>
					<span style="font-size:1.2em;">&nbsp; TEL : 063-717-1008  &nbsp; &nbsp;    </span>	
				</p>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../module/foot.jsp" />
</body>
</html>