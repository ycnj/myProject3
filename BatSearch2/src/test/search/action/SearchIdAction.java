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
public class SearchIdAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String playerName=request.getParameter("playerName");
		String pubgServer=request.getParameter("pubg-server");		
		System.out.println(playerName);
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
		
		JSONObject obj = new JSONObject(idInfo);
		JSONArray arr = obj.getJSONArray("data");
		String playerId = arr.getJSONObject(0).getString("id");
		
		request.getSession().setAttribute("playerId", playerId);
		request.getSession().setAttribute("pubgServer", pubgServer);
		request.getSession().setAttribute("pubgMode", request.getParameter("pubg-mode"));
		request.getSession().setAttribute("pubgSeason", request.getParameter("pubg-season"));
		
		return new ActionForward("/search/list.do?");
	}

}
