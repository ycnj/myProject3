package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeInsertAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String name=(String)request.getSession().getAttribute("name");
		CafeDto dto=new CafeDto();
		dto.setWriter(name);
		dto.setTitle(title);
		dto.setContent(content);
		CafeDao.getInstance().insert(dto);
		return new ActionForward("/cafe/list.do", true);
	}

}
