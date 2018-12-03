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
<link rel="shortcut icon" href="#">
<style>
.fg1{
	display: inline;
	width:80%;
}
.fg2{
	display: inline;
	width:40%;
}
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
			<form>
				<div class="col-sm-9 col-sm-offset-2 ">				
					<div class="form-group" >
						<input class="form-control fg1" type="text" name="playerName" id="playerName" />						
						<button class="btn btn-primary btn-search" >검색</button>
					</div>
				</div>
				<div class="col-sm-9 col-sm-offset-2 ">
					<div class="form-group">
						<select id="pubg-server" class="form-control fg2">
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
						<select id="pubg-mode" class="form-control fg2">
                            <option value="squad">squad</option>
                            <option value="duo">duo</option>
                            <option value="solo">solo</option>
                            <option value="squad-fpp">squad-fpp</option>
                            <option value="duo-fpp">duo-fpp</option>
                            <option value="solo-fpp">solo-fpp</option>
                        </select>
					</div>				
				</div>
			</form>
		</div>
		<div class="row">
			<div class="p-2">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th><abbr lang="en" title="Number of enemy players this player damaged that were killed by teammates">assists</abbr></th>
                        <td class="assists">n/a</td>
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
<script src="${pageContext.request.contextPath }/resources/js/config.js"></script>
<script>
'use strict';
var apiKey = config.API_KEY;

// EVENTS
$(".btn-search").on('click', function(e) {
	searchStats();
});

function searchStats() {
	var tmpPubgName = $('#playerName').val();
	var tmpPubgServer = $('#pubg-server').val();
	var tmpPubgMode = $('#pubg-mode').val();
	var url = "https://api.pubg.com/shards/" + tmpPubgServer + "/players?filter[playerNames]=" + tmpPubgName;
	$.ajax({			
		method: "GET",
		url: url,
		headers: {		
            Accept: "application/vnd.api+json"
        },
        beforeSend: function (auth) {
            auth.setRequestHeader("Authorization", "Bearer " + apiKey);       
        },
        success: function(result) { 
            var tmpPubgId = result.data[0].id;
            var tmpPubgSeason="lifetime";//변수값. 나중에 변경.
            var url = "https://api.pubg.com/shards/" + tmpPubgServer + "/players/" + tmpPubgId + "/seasons/" + tmpPubgSeason;
            $.ajax({
                method: "GET",
                url: url,
                headers: {
                    Accept: "application/vnd.api+json"
                	},
                beforeSend: function (auth) {
                    auth.setRequestHeader("Authorization", "Bearer " + apiKey);                    
                },
                success: function(result) {
                	var isData = false;
                     $.each(result.data.attributes.gameModeStats, function(key, value) {
                        if (key == tmpPubgMode) {
                            $('.assists').text(value.assists);
                            $('.boosts').text(value.boosts);
                            $('.dBNOs').text(value.dBNOs);
                            $('.dailyKills').text(value.dailyKills);
                            $('.damageDealt').text(parseInt(value.damageDealt));
                            $('.days').text(value.days);
                            $('.headshotKills').text(value.headshotKills);
                            $('.heals').text(value.heals);
                            $('.killPoints').text(value.killPoints);
                            $('.kills').text(value.kills);
                            var tmpLongestKill = parseFloat(value.longestKill).toFixed(2);//소수점, 2자리
                            $('.longestKill').text(tmpLongestKill + ' m');
                            var tmpLongestTimeSurvived = parseInt(value.longestTimeSurvived / 60);
                            $('.longestTimeSurvived').text(tmpLongestTimeSurvived + ' min');
                            $('.losses').text(value.losses);
                            $('.maxKillStreaks').text(value.maxKillStreaks);
                            var tmpMostSurvivalTime = parseInt(value.mostSurvivalTime / 60);
                            $('.mostSurvivalTime').text(tmpMostSurvivalTime + ' min');
                            $('.revives').text(value.revives);
                            var tmpRideDistance = parseFloat(value.rideDistance / 1000).toFixed(2);
                            $('.rideDistance').text(tmpRideDistance + ' km');
                            $('.roadKills').text(value.roadKills);
                            $('.roundMostKills').text(value.roundMostKills);
                            $('.roundsPlayed').text(value.roundsPlayed);
                            $('.suicides').text(value.suicides);
                            $('.teamKills').text(value.teamKills);
                            var tmpTimeSurvived = parseInt(value.timeSurvived / 60);
                            $('.timeSurvived').text(tmpTimeSurvived + ' min');
                            $('.top10s').text(value.top10s);
                            $('.vehicleDestroys').text(value.vehicleDestroys);
                            var tmpWalkDistance = parseFloat(value.walkDistance / 1000).toFixed(2);
                            $('.walkDistance').text(tmpWalkDistance + ' km');
                            $('.weaponsAcquired').text(value.weaponsAcquired);
                            $('.weeklyKills').text(value.weeklyKills);
                            $('.winPoints').text(value.winPoints);
                            $('.wins').text(value.wins);
                            $('.bestRankPoint').text(value.bestRankPoint);
                            $('.dailyWins').text(value.dailyWins);
                            $('.rankPoints').text(value.rankPoints);
                            var tmpSwimDistance = parseFloat(value.swimDistance / 1000).toFixed(2);
                            $('.swimDistance').text(tmpSwimDistance + ' km');
                            
                            isData = true;
                        }                       
                    });
                    if (isData == true) {
                        alert("Error1");
                    }
                },
                error: function(error){
                	alert("Error2");
                }
            });
        },
        error: function(error){
        	alert("Error3");
        }
	});	
};
</script>
</body>
</html>