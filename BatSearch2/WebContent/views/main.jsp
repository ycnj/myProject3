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
<style>
.fg1{
	display: inline;
	width:80%;
}
.fg2{
	display: inline;
	width:40%;
}
</style>
<body>


	<div id="header">
		<%@ include file="/include/topmenu.jsp" %>
	</div>
      

	<div id="sidebar">
		<%@ include file="/include/left.jsp" %>
	</div>
	
	
	
	<div class="container">
		<div class="row">
			<form action="${pageContext.request.contextPath }/search/id.do" method="get">
				<div class="col-sm-9 col-sm-offset-2 ">				
					<div class="form-group" >
						<input class="form-control fg1" type="text" name="playerName" />						
						<button class="btn btn-primary">검색</button>
					</div>
				</div>
				<div class="col-sm-9 col-sm-offset-2 ">
					<div class="form-group">
						<select name="pubg-server" class="form-control fg2">
							<option value="pc-kakao">pc - Kakao</option>
							<option value="xbox-as">xbox - Asia</option>
							<option value="xbox-eu">xbox - Europe</option>
							<option value="xbox-na">xbox - North America</option>
							<option value="xbox-oc">xbox - Oceania</option>
							<option value="pc-krjp">pc - Korea</option>
							<option value="pc-jp">pc - Japan</option>
							<option value="pc-na">pc - North America</option>
							<option value="pc-eu">pc - Europe</option>
							<option value="pc-ru">pc - Russia</option>
							<option value="pc-oc">pc - Oceania</option>							
							<option value="pc-sea">pc - South East Asia</option>
							<option value="pc-sa">pc - South and Central America</option>
							<option value="pc-as">pc - Asia</option>
						</select>
						<select name="pubg-mode" class="form-control fg2">
                            <option value="tpp">tpp</option>
                            <option value="fpp">fpp</option>
                        </select>
					</div>				
				</div>
				<input type="hidden" name="pubg-season" value="lifetime" />
			</form>
		</div>
	</div>
	
	
	
	<div id="footer">
		<%@ include file="/include/bottom.jsp" %>
	</div>
	
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
</body>
</html>