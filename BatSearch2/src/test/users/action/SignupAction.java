package test.users.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.JSONTokener;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;
/*
 *  회원 가입 처리를 Google Recaptcha 기반으로 처리 하는 액션 
 */
public class SignupAction extends Action{
	// Replace this with your site secret.
	private static final String SITE_SECRET = "6LfninYUAAAAAMH9RPNgLvPRgvx4fulV4qNe8Aft";
	private static final String SECRET_PARAM = "secret";
	private static final String RESPONSE_PARAM = "response";
	private static final String G_RECAPTCHA_RESPONSE = "g-recaptcha-response";
	private static final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp)  {
	    JSONObject jsonObject=null;
		try {
			jsonObject = performRecaptchaSiteVerify(req.getParameter(G_RECAPTCHA_RESPONSE));
		} catch (IOException e) {
			e.printStackTrace();
		}
	    //봇이 아닌지 여부 (성공여부) 
	    boolean success = jsonObject.getBoolean("success");
	    System.out.println("Success2 = " + success);
	    //성공 여부에 따라서 다른 응답을 한다.
	    if(success) {
	    	//회원 가입 처리를 한다. 
	    	String email=req.getParameter("email");
	    	String name=req.getParameter("name");
	    	String pwd=req.getParameter("pwd");
	    	UsersDto dto=new UsersDto();
	    	dto.setEmail(email);
	    	dto.setName(name);
	    	dto.setPwd(pwd);
	    	UsersDao.getInstance().insert(dto);
	    	return new ActionForward("/main.do", true);
	    }else {
	    	req.setAttribute("msg", "회원가입에 실패했습니다.");
	    	return new ActionForward("/views/users/signupform.jsp");
	    }
	}
	private JSONObject performRecaptchaSiteVerify(String recaptchaResponseToken)
	            throws IOException {
        URL url = new URL(SITE_VERIFY_URL);
        StringBuilder postData = new StringBuilder();
        addParam(postData, SECRET_PARAM, SITE_SECRET);
        addParam(postData, RESPONSE_PARAM, recaptchaResponseToken);

        return postAndParseJSON(url, postData.toString());
	}
	private JSONObject postAndParseJSON(URL url, String postData) throws IOException {
	        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
	        urlConnection.setDoOutput(true);
	        urlConnection.setRequestMethod("POST");
	    urlConnection.setRequestProperty(
	            "Content-Type", "application/x-www-form-urlencoded");
	    urlConnection.setRequestProperty(
	            "charset", StandardCharsets.UTF_8.displayName());
	    urlConnection.setRequestProperty(
	            "Content-Length", Integer.toString(postData.length()));
	    urlConnection.setUseCaches(false);
	    urlConnection.getOutputStream()
	            .write(postData.getBytes(StandardCharsets.UTF_8));
	    JSONTokener jsonTokener = new JSONTokener(urlConnection.getInputStream());
	    return new JSONObject(jsonTokener);
	}
	
	private StringBuilder addParam(
	        StringBuilder postData, String param, String value)
	        throws UnsupportedEncodingException {
	    if (postData.length() != 0) {
	        postData.append("&");
	    }
	    return postData.append(
	            String.format("%s=%s",
	                    URLEncoder.encode(param, StandardCharsets.UTF_8.displayName()),
	                    URLEncoder.encode(value, StandardCharsets.UTF_8.displayName())));
	}	
}







