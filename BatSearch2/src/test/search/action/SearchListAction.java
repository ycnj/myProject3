package test.search.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import test.controller.Action;
import test.controller.ActionForward;

/*
 * 카페 글 목록을 출력하는 액션
 */
public class SearchListAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Config con=new Config();		
		String apiKey=con.getApiKey();
		
		String playerId=(String) request.getSession().getAttribute("playerId");
		String pubgServer=(String) request.getSession().getAttribute("pubgServer");
		String pubgSeason=(String) request.getSession().getAttribute("pubgSeason");
		String pubgMode=(String) request.getSession().getAttribute("pubgMode");
		
		//정보 가져오기
		URL url;
		HttpURLConnection conn = null;
		BufferedReader br = null;
		String playerInfo= null;
		try {
			url = new URL("https://api.pubg.com/shards/"+ pubgServer +"/players/"+ playerId +"/seasons/"+pubgSeason);			
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization","Bearer "+apiKey);

			conn.setRequestProperty("Accept", "application/vnd.api+json");
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			playerInfo = br.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject obj = new JSONObject(playerInfo);
		//squad--------------------------------------------------------------
		JSONObject playerInfoObj_sq= obj.getJSONObject("data")
										.getJSONObject("attributes")
											.getJSONObject("gameModeStats")
												.getJSONObject("squad");
		
		request.setAttribute("playerInfoObj_sq", playerInfoObj_sq);	
		
		int roundsPlayed_sq=playerInfoObj_sq.getInt("roundsPlayed");
		request.setAttribute("roundsPlayed_sq", roundsPlayed_sq);	
		
		int rankPoints_sq=playerInfoObj_sq.getInt("rankPoints");
		int wins_sq=playerInfoObj_sq.getInt("wins");
		int top10s_sq=playerInfoObj_sq.getInt("top10s");
		request.setAttribute("rankPoints_sq", rankPoints_sq);	
		request.setAttribute("wins_sq", wins_sq);	
		request.setAttribute("top10s_sq", top10s_sq);			
		
		int kills_sq=playerInfoObj_sq.getInt("kills");
		int losses_sq=playerInfoObj_sq.getInt("losses");		
		double KD_sq=Math.round(kills_sq*100/(double)losses_sq)/100.0;
		int damageDealt_sq=playerInfoObj_sq.getInt("damageDealt");		
		int damageDealtper_sq=(int)(damageDealt_sq/(double)roundsPlayed_sq);
		request.setAttribute("KD_sq", KD_sq);	
		request.setAttribute("damageDealtper_sq", damageDealtper_sq);	
		
		double winRate_sq=Math.round(wins_sq*1000/(double)roundsPlayed_sq)/(double)10;
		double longestKill_sq=Math.round(10*playerInfoObj_sq.getInt("longestKill"))/10;			
		double averageRank_sq=Math.round(10);
		int assists_sq=playerInfoObj_sq.getInt("assists");	
		double KDA_sq=Math.round((kills_sq+assists_sq)*100/(double)losses_sq)/100.0;
		request.setAttribute("winRate_sq", winRate_sq);	
		request.setAttribute("longestKill_sq", longestKill_sq);	
		request.setAttribute("averageRank_sq", averageRank_sq);	
		request.setAttribute("KDA_sq", KDA_sq);	
		
		double Top10Rate_sq=Math.round(top10s_sq*1000/(double)roundsPlayed_sq)/10;
		int headshotKills_sq=playerInfoObj_sq.getInt("headshotKills");	
		double headshotKillsRate_sq=Math.round(headshotKills_sq*1000/(double)kills_sq)/10;
		int timeSurvived_sq=playerInfoObj_sq.getInt("timeSurvived");
		double averageTimeSurvived_sq=Math.round(timeSurvived_sq*10/(double)roundsPlayed_sq)/10;
		int hours_sq = (int) averageTimeSurvived_sq / 60;
		int minutes_sq = (int) (averageTimeSurvived_sq % 60);
		String timeString_sq = String.format("%02d:%02d", hours_sq, minutes_sq);
		
		int roundMostKills_sq=playerInfoObj_sq.getInt("roundMostKills");
		request.setAttribute("Top10Rate_sq", Top10Rate_sq);	
		request.setAttribute("headshotKillsRate_sq", headshotKillsRate_sq);	
		request.setAttribute("averageTimeSurvived_sq", timeString_sq);	
		request.setAttribute("roundMostKills_sq", roundMostKills_sq);	
		
		//duo--------------------------------------------------------------
		JSONObject playerInfoObj_du= obj.getJSONObject("data")
										.getJSONObject("attributes")
											.getJSONObject("gameModeStats")
												.getJSONObject("duo");

		request.setAttribute("playerInfoObj_du", playerInfoObj_du);	
		
		int roundsPlayed_du=playerInfoObj_du.getInt("roundsPlayed");
		request.setAttribute("roundsPlayed_du", roundsPlayed_du);	
		
		int rankPoints_du=playerInfoObj_du.getInt("rankPoints");
		int wins_du=playerInfoObj_du.getInt("wins");
		int top10s_du=playerInfoObj_du.getInt("top10s");
		request.setAttribute("rankPoints_du", rankPoints_du);	
		request.setAttribute("wins_du", wins_du);	
		request.setAttribute("top10s_du", top10s_du);			
		
		int kills_du=playerInfoObj_du.getInt("kills");
		int losses_du=playerInfoObj_du.getInt("losses");		
		double KD_du=Math.round(kills_du*100/(double)losses_du)/100.0;
		int damageDealt_du=playerInfoObj_du.getInt("damageDealt");		
		int damageDealtper_du=(int)(damageDealt_du/(double)roundsPlayed_du);
		request.setAttribute("KD_du", KD_du);	
		request.setAttribute("damageDealtper_du", damageDealtper_du);	
		
		double winRate_du=Math.round(wins_du*1000/(double)roundsPlayed_du)/(double)10;
		double longestKill_du=Math.round(10*playerInfoObj_du.getInt("longestKill"))/10;			
		double averageRank_du=Math.round(10);
		int assists_du=playerInfoObj_du.getInt("assists");	
		double KDA_du=Math.round((kills_du+assists_du)*100/(double)losses_du)/100.0;
		request.setAttribute("winRate_du", winRate_du);	
		request.setAttribute("longestKill_du", longestKill_du);	
		request.setAttribute("averageRank_du", averageRank_du);	
		request.setAttribute("KDA_du", KDA_du);	
		
		double Top10Rate_du=Math.round(top10s_du*1000/(double)roundsPlayed_du)/10;
		int headshotKills_du=playerInfoObj_du.getInt("headshotKills");	
		double headshotKillsRate_du=Math.round(headshotKills_du*1000/(double)kills_du)/10;
		int timeSurvived_du=playerInfoObj_du.getInt("timeSurvived");
		double averageTimeSurvived_du=Math.round(timeSurvived_du*10/(double)roundsPlayed_du)/10;
		int hours_du = (int) averageTimeSurvived_du / 60;
		int minutes_du = (int) (averageTimeSurvived_du % 60);
		String timeString_du = String.format("%02d:%02d", hours_du, minutes_du);
		
		int roundMostKills_du=playerInfoObj_du.getInt("roundMostKills");
		request.setAttribute("Top10Rate_du", Top10Rate_du);	
		request.setAttribute("headshotKillsRate_du", headshotKillsRate_du);	
		request.setAttribute("averageTimeSurvived_du", timeString_du);	
		request.setAttribute("roundMostKills_du", roundMostKills_du);	
		
		
		//solo--------------------------------------------------------------
		JSONObject playerInfoObj_sol= obj.getJSONObject("data")
											.getJSONObject("attributes")
												.getJSONObject("gameModeStats")
													.getJSONObject("solo");

		request.setAttribute("playerInfoObj_sol", playerInfoObj_sol);	
		
		int roundsPlayed_sol=playerInfoObj_sol.getInt("roundsPlayed");
		request.setAttribute("roundsPlayed_sol", roundsPlayed_sol);	
		
		int rankPoints_sol=playerInfoObj_sol.getInt("rankPoints");
		int wins_sol=playerInfoObj_sol.getInt("wins");
		int top10s_sol=playerInfoObj_sol.getInt("top10s");
		request.setAttribute("rankPoints_sol", rankPoints_sol);	
		request.setAttribute("wins_sol", wins_sol);	
		request.setAttribute("top10s_sol", top10s_sol);			
		
		int kills_sol=playerInfoObj_sol.getInt("kills");
		int losses_sol=playerInfoObj_sol.getInt("losses");		
		double KD_sol=Math.round(kills_sol*100/(double)losses_sol)/100.0;
		int damageDealt_sol=playerInfoObj_sol.getInt("damageDealt");		
		int damageDealtper_sol=(int)(damageDealt_sol/(double)roundsPlayed_sol);
		request.setAttribute("KD_sol", KD_sol);	
		request.setAttribute("damageDealtper_sol", damageDealtper_sol);	
		
		double winRate_sol=Math.round(wins_sol*1000/(double)roundsPlayed_sol)/(double)10;
		double longestKill_sol=Math.round(10*playerInfoObj_sol.getInt("longestKill"))/10;			
		double averageRank_sol=Math.round(10);
		int assists_sol=playerInfoObj_sol.getInt("assists");	
		double KDA_sol=Math.round((kills_sol+assists_sol)*100/(double)losses_sol)/100.0;
		request.setAttribute("winRate_sol", winRate_sol);	
		request.setAttribute("longestKill_sol", longestKill_sol);	
		request.setAttribute("averageRank_sol", averageRank_sol);	
		request.setAttribute("KDA_sol", KDA_sol);	
		
		double Top10Rate_sol=Math.round(top10s_sol*1000/(double)roundsPlayed_sol)/10;
		int headshotKills_sol=playerInfoObj_sol.getInt("headshotKills");	
		double headshotKillsRate_sol=Math.round(headshotKills_sol*1000/(double)kills_sol)/10;
		int timeSurvived_sol=playerInfoObj_sol.getInt("timeSurvived");
		double averageTimeSurvived_sol=Math.round(timeSurvived_sol*10/(double)roundsPlayed_sol)/10;
		int hours_sol = (int) averageTimeSurvived_sol / 60;
		int minutes_sol = (int) (averageTimeSurvived_sol % 60);
		String timeString_sol = String.format("%02d:%02d", hours_sol, minutes_sol);
		
		int roundMostKills_sol=playerInfoObj_sol.getInt("roundMostKills");
		request.setAttribute("Top10Rate_sol", Top10Rate_sol);	
		request.setAttribute("headshotKillsRate_sol", headshotKillsRate_sol);	
		request.setAttribute("averageTimeSurvived_sol", timeString_sol);	
		request.setAttribute("roundMostKills_sol", roundMostKills_sol);	

		request.getSession().invalidate();
		
		return new ActionForward("/views/search/list.jsp");
	}

}
