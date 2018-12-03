package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import test.controller.Action;
import test.controller.ActionForward;

public class UsersLogoutAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//세션 초기화
		request.getSession().invalidate();
		String contextPath=request.getContextPath();
		String url=request.getParameter("url");		
		if(url != null) {
			url=url.substring(contextPath.length()+27, url.length()-3)+"do";
			return new ActionForward(url);
		}else {
			return new ActionForward("/main.do", true);			
		}		
/*		return new ActionForward("/home.do",true);
		return new ActionForward("/views/users/logout.jsp");*/
	}
	
}
