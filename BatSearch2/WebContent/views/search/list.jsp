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
			<div class="p-2">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th><abbr lang="en" title="Number of enemy players this player damaged that were killed by teammates">assists</abbr></th>
                        <td class="assists"></td>
                        <th><abbr lang="en" title="Number of boost items used">boosts</abbr></th>
                        <td class="boosts">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Number of enemy players knocked">dBNOs</abbr></th>
                        <td class=" dBNOs">n/a</td>
                        <th>dailyKills</th>
                        <td class=" dailyKills">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Total damage dealt. Note: Self inflicted damage is subtracted">damageDealt</abbr></th>
                        <td class=" damageDealt">n/a</td>
                        <th>days</th>
                        <td class=" days">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Number of enemy players killed with headshots">headshotKills</abbr></th>
                        <td class=" headshotKills">n/a</td>
                        <th><abbr lang="en" title="Number of healing items used">heals</abbr></th>
                        <td class=" heals">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="[Deprecated for PC] Points based on how many kills this player had">killPoints</abbr></th>
                        <td class=" killPoints">n/a</td>
                        <th><abbr lang="en" title="Number of enemy players killed">kills</abbr></th>
                        <td class=" kills">n/a</td>
                    </tr>
                    <tr>
                        <th>longestKill</th>
                        <td class=" longestKill">n/a</td>
                        <th><abbr lang="en" title="Longest time survived in a match">longestTimeSurvived</abbr></th>
                        <td class=" longestTimeSurvived">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Number of matches lost">losses</abbr></th>
                        <td class=" losses">n/a</td>
                        <th>maxKillStreaks</th>
                        <td class=" maxKillStreaks">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Longest time survived in a match">mostSurvivalTime</abbr></th>
                        <td class=" mostSurvivalTime">n/a</td>
                        <th><abbr lang="en" title="Number of times this player revived teammates">revives</abbr></th>
                        <td class=" revives">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Total distance traveled in vehicles">rideDistance</abbr></th>
                        <td class=" rideDistance">n/a</td>
                        <th><abbr lang="en" title="Number of kills while in a vehicle">roadKills</abbr></th>
                        <td class=" roadKills">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Highest number of kills in a single match">roundMostKills</abbr></th>
                        <td class=" roundMostKills">n/a</td>
                        <th><abbr lang="en" title="Number of matches played">roundsPlayed</abbr></th>
                        <td class=" roundsPlayed">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Number of self-inflicted deaths">suicides</abbr></th>
                        <td class=" suicides">n/a</td>
                        <th><abbr lang="en" title="Number of times this player killed a teammate">teamKills</abbr></th>
                        <td class=" teamKills">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Total time survived">timeSurvived</abbr></th>
                        <td class=" timeSurvived">n/a</td>
                        <th><abbr lang="en" title="Number of times this player made it to the top 10 in a match">top10s</abbr></th>
                        <td class=" top10s">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Number of vehicles destroyed">vehicleDestroys</abbr></th>
                        <td class=" vehicleDestroys">n/a</td>
                        <th><abbr lang="en" title="Total distance traveled on foot">walkDistance</abbr></th>
                        <td class=" walkDistance">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Number of weapons picked up">weaponsAcquired</abbr></th>
                        <td class=" weaponsAcquired">n/a</td>
                        <th>weeklyKills</th>
                        <td class=" weeklyKills">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="[Deprecated for PC]">winPoints</abbr></th>
                        <td class=" winPoints">n/a</td>
                        <th><abbr lang="en" title="Number of matches won">wins</abbr></th>
                        <td class=" wins">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="[PC only] Highest number of rank points the player was awarded">bestRankPoint</abbr></th>
                        <td class=" bestRankPoint">n/a</td>
                        <th><abbr lang="en" title="[PC only] Number of daily wins">dailyWins</abbr></th>
                        <td class=" dailyWins">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="[PC only] Number of rank points the player was awarded. This value will be 0 when roundsPlayed < 10">rankPoints</abbr></th>
                        <td class=" rankPoints">n/a</td>
                        <th><abbr lang="en" title="[PC only] Total distance traveled while swimming">swimDistance</abbr></th>
                        <td class=" swimDistance">n/a</td>
                    </tr>
                </table>
            </div>
		</div>
	</div>
	
	
	
	<div id="footer">
		<%@ include file="/include/bottom.jsp" %>
	</div>
	

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script>
var playerInfoObj=${playerInfoObj};

window.onload = function () { 
	$(".assists").text(playerInfoObj.assists);
    $(".boosts").text(playerInfoObj.boosts);
    $(".dBNOs").text(playerInfoObj.dBNOs);
    $(".dailyKills").text(playerInfoObj.dailyKills);
    $(".damageDealt").text(parseInt(playerInfoObj.damageDealt));
    $(".days").text(playerInfoObj.days);
    $(".headshotKills").text(playerInfoObj.headshotKills);
    $(".heals").text(playerInfoObj.heals);
    $(".killPoints").text(playerInfoObj.killPoints);
    $(".kills").text(playerInfoObj.kills);
    var tmpLongestKill = parseFloat(playerInfoObj.longestKill).toFixed(2);//소수점, 2자리
    $(".longestKill").text(tmpLongestKill + " m");
    var tmpLongestTimeSurvived = parseInt(playerInfoObj.longestTimeSurvived / 60);
    $(".longestTimeSurvived").text(tmpLongestTimeSurvived + " 분");
    $(".losses").text(playerInfoObj.losses);
    $(".maxKillStreaks").text(playerInfoObj.maxKillStreaks);
    var tmpMostSurvivalTime = parseInt(playerInfoObj.mostSurvivalTime / 60);
    $(".mostSurvivalTime").text(tmpMostSurvivalTime + " 분");
    $(".revives").text(playerInfoObj.revives);
    var tmpRideDistance = parseFloat(playerInfoObj.rideDistance / 1000).toFixed(2);
    $(".rideDistance").text(tmpRideDistance + " km");
    $(".roadKills").text(playerInfoObj.roadKills);
    $(".roundMostKills").text(playerInfoObj.roundMostKills);
    $(".roundsPlayed").text(playerInfoObj.roundsPlayed);
    $(".suicides").text(playerInfoObj.suicides);
    $(".teamKills").text(playerInfoObj.teamKills);
    var tmpTimeSurvived = parseInt(playerInfoObj.timeSurvived / 60);
    $(".timeSurvived").text(tmpTimeSurvived + " 분");
    $(".top10s").text(playerInfoObj.top10s);
    $(".vehicleDestroys").text(playerInfoObj.vehicleDestroys);
    var tmpWalkDistance = parseFloat(playerInfoObj.walkDistance / 1000).toFixed(2);
    $(".walkDistance").text(tmpWalkDistance + " km");
    $(".weaponsAcquired").text(playerInfoObj.weaponsAcquired);
    $(".weeklyKills").text(playerInfoObj.weeklyKills);
    $(".winPoints").text(playerInfoObj.winPoints);
    $(".wins").text(playerInfoObj.wins);
    $(".bestRankPoint").text(playerInfoObj.bestRankPoint);
    $(".dailyWins").text(playerInfoObj.dailyWins);
    $(".rankPoints").text(playerInfoObj.rankPoints);
    var tmpSwimDistance = parseFloat(playerInfoObj.swimDistance / 1000).toFixed(2);
    $(".swimDistance").text(tmpSwimDistance + " km");
};
</script>
</body>
</html>