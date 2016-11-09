<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


</head>
<body>
	<div style="text-align: center;">
		<h1>${oneLectureList.LectureList.lectureContent}</h1>
		<iframe width="750" height="500" src="${oneLectureList.LectureList.lectureLink}&autohide=1"></iframe>
		<p style="color: red" >${oneLectureList.text}</p>
	</div>
	
	<button id="play">재생</button>
	<button id="pause">일시정지</button>
</body>
</html>