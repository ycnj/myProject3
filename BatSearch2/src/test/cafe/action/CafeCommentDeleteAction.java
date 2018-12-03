package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeCommentDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));
		boolean isSuccess=CafeCommentDao.getInstance().delete(num);
		request.setAttribute("isSuccess", isSuccess);
		return new ActionForward("/views/cafe/private/comment_delete.jsp");
	}

}
