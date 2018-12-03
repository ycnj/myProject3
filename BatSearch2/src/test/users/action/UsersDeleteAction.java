package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;

public class UsersDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 세션에 저장된 아이디를 읽어온다.
		String name=(String)request.getSession().getAttribute("name");
		//2. DB에서 삭제하고
		UsersDao.getInstance().delete(name);
		//3. 세션에서 삭제(로그아웃 처리)
		request.getSession().invalidate();
		//4. 응답
		return new ActionForward("/main.do", true);
		
	}

}
