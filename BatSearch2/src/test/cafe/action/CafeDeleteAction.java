package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		//삭제할 글이 로그인된 사용자의 글인지 확인
		String name=(String)request.getSession().getAttribute("name");
		CafeDto dto=CafeDao.getInstance().getData(num);
		if(!name.equals(dto.getWriter())) {//글의 작성자와 로그인된 id가 다르면
			//삭제하면 안된다.
			return null;
		}
		
		CafeDao.getInstance().delete(num);
		return new ActionForward("/cafe/list.do", true);
	}

}
