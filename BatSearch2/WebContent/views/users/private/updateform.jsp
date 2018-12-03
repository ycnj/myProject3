<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
</head>
<body>
<h3>회원정보 수정 페이지 입니다.</h3>
<form action="" method="post" id="updateForm">
	<input type="hidden" name="name" value="${dto.name }"/>
	<label for="name">이름</label>
	<input type="text" id="name" value="${dto.name }" 
		disabled="disabled"/><br/>
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"
		value="${dto.pwd }"/><br/>
	<label for="pwd2">비밀번호 확인</label>
	<input type="password" id="pwd2" value="${dto.pwd }"/><br/>
	<label for="email">이메일 주소</label>
	<input type="text" name="email" id="email" 
		value="${dto.email }"/><br/>
	<button type="submit">수정 확인</button>
	<a href="${pageContext.request.contextPath }/main.do">홈으로 가기</a>
</form>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
	//폼에 submit 이벤트가 일어났을때 ㅎ출되는 함수 등록
	$("#updateForm").on("submit", function(){
		//입력한 비밀번호를 읽어와서
		var pwd1=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if( pwd1 != pwd2 ){	//두개를 다르게 입력하면
			alert("비밀번호를 확인 하세요");
			return false;	//폼 전송 막기
		}else{
			$("#updateForm").attr("action", "update.do");
		}
	});
</script>
</body>
</html>









