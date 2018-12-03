package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersLoginAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		//1. 폼 전송되는 파라미터 추출 (아이디, 비밀버놓)
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		//2. UsersDao 를 이용해서 유효한 정보인지 판단해서
		UsersDto dto=new UsersDto();
		dto.setEmail(email);
		dto.setPwd(pwd);
		Boolean isValid=UsersDao.getInstance().isValid(dto);
		//3. 응답한다 (유효한 정보이면 로그인 처리도 해야한다)
		if(isValid){
			String name=UsersDao.getInstance().getData(email).getName();
			//로그인 처리하기
			request.getSession().setAttribute("name", name);
			//로그인 성공후 이동해야할 경로
			//만약 로그인성공후의 view페이지가 있다면. url을 ${param.url} 로 추출가능.
			String url=request.getParameter("url");
			String contextPath=request.getContextPath();
			// .do 를 제외한 요청 경로를 추출한다.
			url=url.substring(contextPath.length(), url.length());
			//url 값이 do로 끝나므로 리다이렉트 시켜줘야한다.
			return new ActionForward(url, true);
		}else {
			request.setAttribute("msg", "아이디 비번을 확인해주세요");
			return new ActionForward("/views/users/loginform.jsp");
		}		
	}
	
}
