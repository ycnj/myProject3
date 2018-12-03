package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;

public class UsersCheckNameAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//1. ajax 요청 파라미터 추출
		String inputName=request.getParameter("inputName");
		//2. 사용 가능 여부를 UsersDao 로 부터 리턴 받는다.
		Boolean canUse=UsersDao.getInstance().canUseName(inputName);
		request.setAttribute("canUse", canUse);
		return new ActionForward("/views/users/checkName.jsp");
	}
}
