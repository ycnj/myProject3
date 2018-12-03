package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersInfoAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 세션에서 로그인된 회원의 아이디를 읽어온다.
		String name=(String)request.getSession().getAttribute("name");
		//2. 아이디를 이용해서 DB 에서 회원정보를 얻어온다.
		UsersDto dto=UsersDao.getInstance().getData(name);
		request.setAttribute("dto", dto);
		//3. 응답
		return new ActionForward("/views/users/private/info.jsp");
	}
}
