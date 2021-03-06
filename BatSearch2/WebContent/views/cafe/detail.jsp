<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/private/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* 글 내용의 경계선 표시*/
	.content{
		border: 1px dotted #cecece;
		padding: 10px;
	}
	/* 글안에 있는 첨부 이미지의 폭 제한 */
	.content img{
		max-width: 100%;
	}
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none ;/* 점찍는거없애기 */
	}
	.comments ul li{
		border-top: 1px solid #888;	/* li 의 위쪽 경계선 */
	}
	.comments dt{
		margin-top: 5px;	
	}
	.comments dd{
		margin-left: 26px;	
	}
	.comments form textarea, .comments form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comments form textarea{		
		width: 85%;
		height: 100px;		
	}
	.comments form button{
		height: 15%;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
</style>
</head>
<body>
<div class="container">
	<a href="${pageContext.request.contextPath }/cafe/list.do">글 목록보기</a>
	<c:if test="${not empty keyword }">
		<p><strong>${keyword }</strong> 검색어로 검색된 결과 입니다.</p>
	</c:if>
	<h3>카페 글 상세 보기</h3>
	<c:if test="${dto.prevNum ne 0 }">
		<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
	</c:if>
	<table class="table table-bordered table-condensed">
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>				
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.viewCount }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>		
	</table>
	<div class="content">${dto.content }</div>
<!-- 	로그인된 아이디와 글작성자가 같을때만 수정, 삭제 링크 제공 -->
	<c:if test="${ name eq dto.writer }" >
		<a href="private/updateform.do?num=${param.num }">수정</a>
		<a href="javascript:deleteConfirm(${param.num })">삭제</a>
	</c:if>
	<div style="margin:10px;text-align:center;">
		<form class="like-update-form" method="post">
			<input type="hidden" name="num" value="${dto.num }" />
			<input type="hidden" name="boardNum" value="${param.num }" />
			<input type="hidden" name="name" value="${name }" />
			<button type="submit" class="btn btn-success">${dto.likeCnt } 좋아요!</button>
		</form>		
	</div>
	<!-- 댓글 목록 -->
	<div class="comments">
		<ul>
		<c:forEach items="${commentList }" var="tmp">
			<c:choose>
<%-- 			<c:when test="${tmp.deleted eq 'no '}">	no가 3칸으로들어가버려서.. --%>
				<c:when test="${tmp.deleted ne 'yes'}">					
					<li class="comment" id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
						<c:if test="${tmp.num ne tmp.comment_group }">
							<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif" />
						</c:if>
						<dl>
							<dt>
								<img src="${pageContext.request.contextPath }/resources/images/user_image.gif" />
								<span>${tmp.writer }</span>
								<c:if test="${tmp.num ne tmp.comment_group }">
									to <strong>${tmp.target_id }</strong>
								</c:if>
								<span>${tmp.regdate }</span>
								<!-- 반복문 도는곳에 아이디 넣지마라. 아이디 여러개생성되면 ㄴ답; -->						
								<a href="javascript:" class="reply_link">답글</a>
								<c:choose>
									<c:when test="${name eq tmp.writer }">
										<a href="javascript:" class="comment-update-link">수정</a>&nbsp;&nbsp;
										<a href="javascript:deleteComment(${tmp.num })">삭제</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:">신고</a>
									</c:otherwise>
								</c:choose>
							</dt>
							<dd>
								<pre>${tmp.content }</pre>
							</dd>
						</dl>
						<form class="comment-insert-form" action="${pageContext.request.contextPath }/cafe/private/comment_insert.do" method="post">
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
							<textarea name="content"><c:if test="${empty name }">로그인이 필요합니다.</c:if></textarea>
							<button type="submit">등록</button>
						</form>
						<!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 -->
						<c:if test="${name eq tmp.writer }">
							<form class="comment-update-form" action="${pageContext.request.contextPath }/cafe/private/comment_update.do">
								<input type="hidden" name="num" value="${tmp.num }" />
								<textarea name="content">${tmp.content }</textarea>
								<button type="submit">수정</button>
							</form>
						</c:if>
					</li>
				</c:when>
				<c:otherwise>
					<li>삭제된 댓글 입니다.</li>
				</c:otherwise>
			</c:choose>			
		</c:forEach>			
		</ul>
		<div class="clearfix"></div>
		<!--  원글에 댓글을 작성할수 있는 폼 -->
		<div class="comment_form">
			<form action="${pageContext.request.contextPath }/cafe/private/comment_insert.do" method="post">
			<!--  댓글의 그룹번호는 원글의 글번호 -->
			<input type="hidden" name="ref_group" value="${dto.num }" />
			<!--  댓글의 대상자는 원글의 작성자 -->
			<input type="hidden" name="target_id" value="${dto.writer }" />
			<textarea name="content"><c:if test="${empty name }">로그인이 필요합니다.</c:if></textarea>
			<button type="submit">등록</button>
			</form>
		</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script>
	//좋아요 버튼을 눌렀을때 호출되는 함수
	$(".like-update-form").on("submit", function(){		
		var data=$(this).serialize();
		var name='${name}';
		if(name==null || name==""){
			alert("로그인하세요.");
			return;
		}
		var $this=$(this);
		$.ajax({
			url: "${pageContext.request.contextPath }/cafe/private/like.do",
			method:"post",
			data:data,
			success:function(responseData){
				$this
				.find("button")
				.text(responseData.likeCnt+" 좋아요!");
			}
		});
		//폼 제출 막긱
		return false;
	});
	//댓글 수정을 눌렀을때 호출되는 함수
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-update-form")
		.slideToggle(200);/* 0.2초 */
	});
	//댓글 수정폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".comment-update-form").on("submit", function(){
		var url=$(this).attr("action");
		//폼에 작성된 내용을 query 문자열로 읽어온다.
		// serialize하면 이렇게됨 : num=x&content=xxx
		var data=$(this).serialize();
		//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post", 
			data:data,
			success:function(responseData){
				if(responseData.isSuccess){
					//폼을 안보이게 한다.
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기
					$this.parent().find("pre").text(content);
				}
			}
		});
		//폼 제출 막긱
		return false;
		
	});
	//댓글 삭제를 눌렀을때 호출되는 함수
	function deleteComment(num){
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			$.ajax({
				url:"${pageContext.request.contextPath }/cafe/private/comment_delete.do",
				method:"post",
				data:{num:num},/* data:{"num":num}, 원래 방이름은 따옴표가맞음. 근데없어도 진행됨.*/
				success:function(responseData){
					if(responseData.isSuccess){
						var sel="#comment"+num;
						$(sel).text("삭제된 댓글 입니다.");
					}
				}
			});
		}
	}
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty name};
		if(!isLogin){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath }/users/loginform.do?url=${pageContext.request.contextPath }/cafe/detail.do?num=${dto.num}";
			return false;
		}
	});

	//답글 달기 링크를 클릭했을때 실행할 함수
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);/* 0.2초 */
		
		var text = $(this).text();
		$(this).text(
			text == "답글" ? "닫기" : "답글"
		);
		
		/* if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		} */
		
	});
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제?");
		if(isDelete){
			location.href="private/delete.do?num="+num;
		}
	}
</script>
</body>
</html>

