<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
<script>
	alert("로그아웃 되었습니다.");
	location.href="${pageContext.request.contextPath}/";
</script>
<%
	//response.sendRedirect("/");
	//이걸사용하면 안되 이건 알림창뜨고 이게실행되는게아니라 바로 이걸로 되버림..
	//그니까 location.href 써라.
%>
</body>
</html>