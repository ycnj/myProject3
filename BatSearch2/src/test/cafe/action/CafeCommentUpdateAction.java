package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dto.CafeCommentDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeCommentUpdateAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));
		String content=request.getParameter("content");
		CafeCommentDto dto=new CafeCommentDto();
		dto.setNum(num);
		dto.setContent(content);
		boolean isSuccess=CafeCommentDao.getInstance().update(dto);
		request.setAttribute("isSuccess", isSuccess);
		return new ActionForward("/views/cafe/private/comment_delete.jsp");
	}

}
