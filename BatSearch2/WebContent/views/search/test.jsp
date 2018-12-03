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
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
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

</body>
</html>