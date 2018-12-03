package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

//회원 추가 폼을 출력 주는 액션
public class UsersSignupformAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//수행할 비즈니스 로직은 없음요
		
		return new ActionForward("/views/users/signupform.jsp");
	}

}
