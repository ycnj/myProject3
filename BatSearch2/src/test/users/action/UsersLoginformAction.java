package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class UsersLoginformAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//로그인 후 이동할 url 정보를 읽어온다.
		String url=request.getParameter("url");
		if(url==null){
			//인덱스 페이지(최상위경로)로 이동되도록 한다.
			url=request.getContextPath()+"/";
		}
		request.setAttribute("url", url);
		return new ActionForward("/views/users/loginform.jsp");
	}
}
