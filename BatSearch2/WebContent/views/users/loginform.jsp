<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<h3>로그인 폼입니다.</h3>
<a href="signupform.do">회원가입 하기</a>
<form action="login.do?url=${url }" method="post">
	<label for="email">아이디</label>
	<input type="text" name="email" id="email" autocomplete="off"/>
	<br />
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"/>
	<br />
	<c:if test="${not empty msg }">
		<p><strong>${msg }</strong></p>
	</c:if>
	<button type="submit">로그인</button>
</form>
</body>
</html>