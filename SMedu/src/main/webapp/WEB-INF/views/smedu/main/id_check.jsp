<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
    function idSelect(id){
        opener.document.getElementById("custid").value = id;
        this.close();
    }
</script>
</head>
<body>
<form action='/smedu/main/idCheck' method='post' onsubmit='return formCheck();'>
<input type="hidden" name="action" value="idCheck" >
<input type="text" name="userId" id="id" placeholder="검색할 ID 입력" />
<input type="submit" value="검색">

</form>
<c:forEach var="userIdList" items="${userIdList }">
	${userIdList}
</c:forEach>


 <!-- GET일 경우 회원가입화면에서 중복 확인 버튼을 누른것 -->
<c:if test="${pageContext.request.method == 'post' }">
    <c:if test="${userIdList.userId==id}">
        ${id} : <br>
        <input type="button" value="ID사용하기 " onclick="idSelect('${id}')"/>
    </c:if>

    <c:if test="${not empty customer}">
        ${id} : <br>
    </c:if>
    </c:if> 
</body>
</html>

