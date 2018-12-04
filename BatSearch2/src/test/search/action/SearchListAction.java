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
		JSONObject playerInfoObj_sq= obj.getJSONObject("data")
										.getJSONObject("attributes")
											.getJSONObject("gameModeStats")
												.getJSONObject(pubgMode);
		
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
		int hours = (int) averageTimeSurvived_sq / 60;
		int minutes = (int) (averageTimeSurvived_sq % 60);
		String timeString_sq = String.format("%02d:%02d", hours, minutes);
		
		int roundMostKills_sq=playerInfoObj_sq.getInt("roundMostKills");
		request.setAttribute("Top10Rate_sq", Top10Rate_sq);	
		request.setAttribute("headshotKillsRate_sq", headshotKillsRate_sq);	
		request.setAttribute("averageTimeSurvived_sq", timeString_sq);	
		request.setAttribute("roundMostKills_sq", roundMostKills_sq);	
		
		request.getSession().invalidate();
		
		return new ActionForward("/views/search/list.jsp");
	}

}
