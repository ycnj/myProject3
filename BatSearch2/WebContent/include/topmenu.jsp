<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar navbar-inverse">
	<ul class="nav navbar-nav navbar-left">
		<li><a class="navbar-brand" href="${pageContext.request.contextPath }/main.do">PP.GG</a></li>
		<li><a class="navbar-brand" href="${pageContext.request.contextPath }/weaponinfo/weaponinfo.do">무기정보</a></li>
		<li><a class="navbar-brand"  href="${pageContext.request.contextPath }/cafe/list.do">커뮤니티</a></li>
		<li><a class="navbar-brand" href="${pageContext.request.contextPath }/chat/chat.do">채팅</a></li>														
		<li><p class="navbar-text">동접:</p></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li>
			<%-- <form class="form-inline navbar-form" action="${pageContext.request.contextPath }/search/list.do">
				<label for="playersName"></label>
				<input class="form-control" type="text" id="playersName" name="playersName" style="width:150px"/>
				<button type="submit" class="btn btn-primary" >검색</button>
			</form> --%>
		</li>
		<c:if test="${name ne null }">
			<li><a class="navbar-brand" href="${pageContext.request.contextPath }/users/private/info.do">${name } 님 로그인중</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a></li>
		</c:if>
		<c:if test="${name eq null }">
			<li><a class="navbar-brand" href="${pageContext.request.contextPath }/users/loginform.do">로그인</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath }/users/signupform.do">회원가입</a></li>
		</c:if>
	</ul>
</div>
<script>
	var check="${check}";
	if(check=="wea"){
		$("ul:first>li:eq(2)").attr("class","active");
	}else if(check=="co"){
		$("ul:first>li:eq(3)").attr("class","active");
	}else if(check=="ch"){
		$("ul:first>li:eq(4)").attr("class","active");
	}
</script>

