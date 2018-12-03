package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersUpdateformAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//수정할 회원의 정보를 얻어온다.
		String name=(String)request.getSession().getAttribute("name");
		UsersDto dto=UsersDao.getInstance().getData(name);
		
		request.setAttribute("dto", dto);
		return new ActionForward("/views/users/private/updateform.jsp");
	}
}
