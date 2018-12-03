<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/main.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
</head>
<body>
<div id="container">

	<div id="header">
		<%@ include file="/include/topmenu.jsp" %>
	</div>
      

	<div id="sidebar">
		<%@ include file="/include/left.jsp" %>
	</div>
	
	
	<div id="content">
		
	</div>
	
	<div id="footer">
		<%@ include file="/include/bottom.jsp" %>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
</body>
</html>