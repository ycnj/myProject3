<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name="ScarysmallLion";
URL url = new URL("https://api.pubg.com/shards/pc-kakao/players?filter[playerNames]=ellabo");
//URL url = new URL("https://api.pubg.com/shards/kakao/samples");
//ellabo id: account.b6bf3ff0f683400e8cb8bd5e6873fd54
//현재시즌정보
URL url2 = new URL("https://api.pubg.com/shards/pc-kakao/players/account.690af3d9ed1d43d1b711b0769ce09225/seasons/lifetime");
URL url3 = new URL("https://api.pubg.com/shards/kakao/players?filter[playerIds]=account.690af3d9ed1d43d1b711b0769ce09225&filter[playerNames]=ScarysmallLion");
//시즌아이디
URL url4 = new URL("https://api.pubg.com/shards/kakao/seasons");
//시즌스탯
URL url6 = new URL("https://api.pubg.com/shards/pc-kakao/players/account.b6bf3ff0f683400e8cb8bd5e6873fd54/seasons/division.bro.official.2018-10");
URL url7 = new URL("https://api.pubg.com/shards/pc-kakao/players/account.b6bf3ff0f683400e8cb8bd5e6873fd54/seasons/division.bro.official.pc-2018-11");
HttpURLConnection conn = (HttpURLConnection) url2.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Authorization","Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJhODk3OGUyMC1kMDI5LTAxMzYtYzU2ZC0yOWVkYjMzMTRhZGMiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTQyODUyNjA4LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Ii1hMWI2ZWJlZS1hYzI0LTQwMzEtYTQ0Zi1jNWM3MTQ3Y2VkZWUifQ.ihJ45dIUBmpWKXzu2Jsm2wdRAr8pSWvh6Wsc_7e-gFg");
//eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJhODk3OGUyMC1kMDI5LTAxMzYtYzU2ZC0yOWVkYjMzMTRhZGMiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTQyODUyNjA4LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Ii1hMWI2ZWJlZS1hYzI0LTQwMzEtYTQ0Zi1jNWM3MTQ3Y2VkZWUifQ.ihJ45dIUBmpWKXzu2Jsm2wdRAr8pSWvh6Wsc_7e-gFg
conn.setRequestProperty("Accept", "application/vnd.api+json");

BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
String userInfo = bufferedReader.readLine();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/main/searchresult.jsp</title>
</head>
<body>

<script>
	var userInfo=<%=userInfo%>;
	
</script>


	<div class="container">
		<div class="row">
			<div class="p-2">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th><abbr lang="en" title="Number of enemy players this player damaged that were killed by teammates">어시스트</abbr></th>
                        <td class="assists">n/a</td>
                        <th><abbr lang="en" title="Number of boost items used">부스트사용</abbr></th>
                        <td class="boosts">n/a</td>
                    </tr>
                    <tr>
                        <th><abbr lang="en" title="Number of enemy players knocked">기절</abbr></th>
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
	
	
</body>
</html>