package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersUpdateAction extends Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 폼전송되는 파라미터 읽어오기
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		//2. DB에 수정 반영
		UsersDto dto=new UsersDto();
		dto.setName(name);
		dto.setPwd(pwd);
		dto.setEmail(email);
		UsersDao.getInstance().update(dto);
		request.setAttribute("msg", name+"님 회원 정보를 수정 했습니다.");
		request.setAttribute("url", "/users/private/info.do");
		return new ActionForward("/views/users/alert.jsp");
	}
}
