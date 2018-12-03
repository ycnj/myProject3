package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeUpdateAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));	
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		CafeDto dto=new CafeDto();
		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		CafeDao.getInstance().update(dto);
		return new ActionForward("/cafe/detail.do?num="+num, true);
	}

}
