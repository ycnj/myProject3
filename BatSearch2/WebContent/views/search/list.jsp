<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/search/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
<link rel="shortcut icon" href="#">
<style>
abbr[title], abbr[data-original-title] {
    border: none;
	text-decoration: none;
}
.panel-heading p,img{
	display: inline;
}
.rP{
	display: inline;
	float: right;
}

ul{
	list-style: none;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ul,li{
	margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
.ranked-stats-list{
	position: relative;
    border-top: 1px solid #eaeaea;
}
.ranked-stats-item{
	width: 50%;
    float: left;
    display: table;
}
.ranked-stats-item:nth-child(2),.ranked-stats-item:first-child{
	margin-top: 5px;
}
.ranked-stats-item:nth-child(2n){
	padding-left: 10px;
}
.panel-body {
	padding: 0 10px 10px 10px;
}
.panel-body p{
	display: inline;
}
.panel-body img{
	position: relative;
	top: -7px;
}
.rankPoints-head{
	position: absolute;
	display: inline-block;
	top: 60px;
	left: 170px;
}
.rankPoints{
	font-size: 36px;
	font-weight: 700;
}
.wins{
	font-size: 15px;
	font-weight: 700;
}
.ranked-stats-list :before {
	position: absolute;
    display: inline;
    content: "";
    width: 1px;
    height: 90px;
    top: 0;
    bottom: 0;
    left: 50%;
    background-color: #eaeaea;
}
.ranked-stats-item-top{
	font-size: 17px;
    font-weight: bold;
    float: right;    
}
.ranked-stats-item-top:first-child{
	margin-right: 10px;
}
.ranked-stats-item-remain{
	font-size: 13px;
	font-weight: 700;
	float: right;	
	margin-top: 2px;
}
.ranked-stats-list span{
	margin-right: 10px;
}
.ranked-stats-item p{
	font-size: 12px;
}

</style>
</head>
<body>


	<div id="header">
		<%@ include file="/include/topmenu.jsp" %>
	</div>
      

	<div id="sidebar">
		<%@ include file="/include/left.jsp" %>
	</div>
	
	
	
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<img src="${pageContext.request.contextPath }/resources/images/bear.png" alt="곰" />
						<p>솔로</p>
						
						<div class="roundsPlayed_so rP">
							<p>${roundsPlayed_sq} 게임</p>
						</div>
					</div>
					<div class="panel-body">
						<div>
							<c:if test="${rankPoints_sq ge 2000 }">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Grandmaster.png" alt="Grandmaster" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1900 && rankPoints_sq le 1999}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-master.png" alt="Master" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1900 && rankPoints_sq le 1999}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Elite.png" alt="Elite" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1800 && rankPoints_sq le 1899}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Diamond.png" alt="Diamond" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1700 && rankPoints_sq le 1799}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Platinum.png" alt="Platinum" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1600 && rankPoints_sq le 1699}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Gold.png" alt="Gold" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1500 && rankPoints_sq le 1599}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Silver.png" alt="Silver" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1400 && rankPoints_sq le 1499}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Bronze.png" alt="Bronze" />
							</c:if>
							<c:if test="${rankPoints_sq ge 1 && rankPoints_sq le 1399}">
								<img src="${pageContext.request.contextPath }/resources/images/Rank-Unranked.png" alt="Unranked" />
							</c:if>
							<div class="rankPoints-head">
								<p class="rankPoints"><f:formatNumber value="${rankPoints_sq}" pattern="#,###"/></p><br />								
								<p class="wins">치킨: ${wins_sq }</p><br />
								<p class="wins">비둘기: ${top10s_sq }</p>
							</div>
						</div>
						<ul class="ranked-stats-list">
							<li class="ranked-stats-item">
								<p>K/D        <span class="ranked-stats-item-top">${KD_sq }</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>경기 당 데미지       <span class="ranked-stats-item-top">${damageDealtper_sq }</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>승률        <span class="ranked-stats-item-remain">${winRate_sq }%</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>Top10%        <span class="ranked-stats-item-remain">${Top10Rate_sq }%</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>최대 거리 킬        <span class="ranked-stats-item-remain">${longestKill_sq }m</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>헤드샷        <span class="ranked-stats-item-remain">${headshotKillsRate_sq }%</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>평균등수         <span class="ranked-stats-item-remain">#${averageRank_sq }</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>평균 생존시간        <span class="ranked-stats-item-remain">${averageTimeSurvived_sq }</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>KDA        <span class="ranked-stats-item-remain">${KDA_sq }</span></p>
							</li>
							<li class="ranked-stats-item">
								<p>최다 킬        <span class="ranked-stats-item-remain">${roundMostKills_sq }</span></p>
							</li>
						</ul>
					</div>
					
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<img src="${pageContext.request.contextPath }/resources/images/cow.png" alt="소" />
						<img src="${pageContext.request.contextPath }/resources/images/dog.png" alt="개" />
						<p>듀오</p>
						
						<div class="roundsPlayed_du rP">
							<p>235 게임</p>
						</div>
					</div>
					<div class="panel-body">
						<p>내용 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam, voluptatem! Eaque ad dignissimos consequuntur modi, nam corporis nobis voluptatem, laboriosam quis natus enim libero ipsam, amet accusamus vel, reiciendis praesentium.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<img src="${pageContext.request.contextPath }/resources/images/elephant.png" alt="코끼리" />
						<img src="${pageContext.request.contextPath }/resources/images/goat.png" alt="염소" />
						<img src="${pageContext.request.contextPath }/resources/images/gorilla.png" alt="고릴라" />
						<img src="${pageContext.request.contextPath }/resources/images/pig.png" alt="돼지" />
						<p>스쿼드</p>
						
						<div class="roundsPlayed_sq rP">
							<p>235 게임</p>
						</div>
					</div>
					<div class="panel-body">
						<p>내용 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam, voluptatem! Eaque ad dignissimos consequuntur modi, nam corporis nobis voluptatem, laboriosam quis natus enim libero ipsam, amet accusamus vel, reiciendis praesentium.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div id="footer">
		<%@ include file="/include/bottom.jsp" %>
	</div>
	

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script>

</script>
</body>
</html>