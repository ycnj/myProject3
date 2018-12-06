package test.search.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import test.controller.Action;
import test.controller.ActionForward;

/*
 * 카페 글 목록을 출력하는 액션
 */
public class SearchIdAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String playerName=request.getParameter("playerName");
		String pubgServer=request.getParameter("pubg-server");
		//id값 가져오기
		Config con=new Config();		
		String apiKey=con.getApiKey();
		URL url;
		HttpURLConnection conn = null;
		BufferedReader br = null;
		String idInfo= null;
		try {
			url = new URL("https://api.pubg.com/shards/"+pubgServer+"/players?filter[playerNames]="+playerName);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer "+apiKey);
			conn.setRequestProperty("Accept", "application/vnd.api+json");			
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			idInfo = br.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject obj = new JSONObject(idInfo).getJSONArray("data").getJSONObject(0);
		String playerId = obj.getString("id");			
			
		request.getSession().setAttribute("playerId", playerId);
		request.getSession().setAttribute("pubgServer", pubgServer);
		request.getSession().setAttribute("pubgMode", request.getParameter("pubg-mode"));
		request.getSession().setAttribute("pubgSeason", request.getParameter("pubg-season"));
		
		JSONArray infoArr = obj.getJSONObject("relationships")				
								.getJSONObject("matches")
									.getJSONArray("data");
		for(int i=0; i<5; i++) {			
			request.getSession().setAttribute("matchId"+i, infoArr.getJSONObject(i).getString("id"));
		}
		return new ActionForward("/search/list.do");
	}

}
