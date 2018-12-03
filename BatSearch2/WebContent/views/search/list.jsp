<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.panel-body2:after{
    
}
.pb-div{
	display: inline;
	width: auto;
	margin: 0;
}
.pb-div p{
	display: inline;
}
.pb-div-1{
	position: relative;
    display: block;
    content: "";
    width: 1px;
    height: 100%;
    top: 0;
    bottom: 0;
    left: 50%;
    background-color: #bbb;
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
							<p>235 게임</p>
						</div>
					</div>
					<div class="panel-body">
						<p>22</p>
					</div>
					<div class="panel-body2">
						<div class="pb-div pb-div-1">
							<p>33</p>
						</div>
						<div class="pb-div">
							<p>44</p>
						</div>
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
var playerInfoObj_sq=${playerInfoObj_sq};

window.onload = function () { 
	$(".roundsPlayed_sq").text(playerInfoObj.roundsPlayed);
	
	$(".rankPoints_sq").text(parseInt(playerInfoObj.rankPoints));
	$(".wins_sq").text(playerInfoObj.wins);
	$(".top10s_sq").text(playerInfoObj.top10s);
	
	$(".KD_sq").text(parseFloat(playerInfoObj.kills/playerInfoObj.losses).toFixed(2));
	$(".damageDealt_sq").text(parseInt(playerInfoObj.damageDealt/playerInfoObj.roundsPlayed));
	
	$(".winRate_sq").text(parseFloat(playerInfoObj.wins/playerInfoObj.roundsPlayed).toFixed(1));
	$(".longestKill_sq").text(parseFloat(playerInfoObj.longestKill).toFixed(1));
	$(".averageRank_sq").text("i dont know");
	$(".KDA_sq").text(parseFloat(playerInfoObj.kills/(playerInfoObj.losses+playerInfoObj.assists)).toFixed(2));
	
	$(".Top10Rate_sq").text(playerInfoObj.kills/playerInfoObj.losses);
	$(".headshotKillsRate_sq").text(playerInfoObj.kills/playerInfoObj.losses);
	$(".averageTimeSurvived_sq").text(playerInfoObj.kills/playerInfoObj.losses);
	$(".roundMostKills_sq").text(roundMostKills);
};
</script>
</body>
</html>