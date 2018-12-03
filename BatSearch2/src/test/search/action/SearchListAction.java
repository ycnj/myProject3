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
		JSONObject playerInfoObj= obj.getJSONObject("data")
										.getJSONObject("attributes")
											.getJSONObject("gameModeStats")
												.getJSONObject(pubgMode);

		request.setAttribute("playerInfoObj", playerInfoObj);		
		request.getSession().invalidate();
		
		return new ActionForward("/views/search/list.jsp");
	}

}
