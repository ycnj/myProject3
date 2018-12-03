<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/view/cafe/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.pageAlign{
		text-align:center;
	}
</style>
</head>
<body>
<div class="container">
	<a href="${pageContext.request.contextPath }/main.do">홈으로가기</a><br />
	<a href="private/insertform.do">새글작성</a><br />
	<c:choose>
		<c:when test="${not empty name}">
			<p><strong>${name }</strong>님 로그인중...</p>
			<a href="${pageContext.request.contextPath }/users/logout.do?url=${pageContext.request.requestURL }">로그아웃</a>			
		</c:when>
		<c:otherwise>
			<a href="../users/loginform.do?url=${pageContext.request.contextPath }/cafe/list.do">로그인하기</a>
		</c:otherwise>
	</c:choose>
	<h3>카페 글 목록 입니다.</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>추천수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="tmp">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>
					<a href="${pageContext.request.contextPath }/cafe/detail.do?num=${tmp.num }&condition=${condition}&keyword=${encodedKeyword}">${tmp.title }</a>&nbsp;<p style="display:inline;">[${tmp.commentCnt }]</p>
				</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.likeCnt }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>		
		</tbody>
	</table>
	<div class="pageAlign">
		<div class="page-display">
			<ul class="pagination">
			<c:if test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1}&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${startPageNum eq 1 }">
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
					<c:if test="${pageNum eq i }">
						<li>
							<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
						</li>
					</c:if>
					<c:if test="${pageNum ne i }">
						<li>					
							<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount}">
					<li>
						<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">&raquo;</a>
					</li>
				</c:if>
				<c:if test="${endPageNum ge totalPageCount}">
					<li class="disabled">
						<a href="javascript:">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	<form action="list.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">			
			<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }"> selected</c:if>>제목+내용</option>
			<option value="title" <c:if test="${condition eq 'title' }"> selected</c:if>>제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }"> selected</c:if>>작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form>
	<c:if test="${not empty keyword }">
		<p><strong>${keyword }</strong> 라는 키워드로
			<strong>${totalRow }</strong> 개의 글이 검색되었습니다.</p>
	</c:if>
	
</div><!-- /.container -->

</body>
</html>

