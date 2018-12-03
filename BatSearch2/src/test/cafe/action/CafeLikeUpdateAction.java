package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dao.CafeLikeDao;
import test.cafe.dto.CafeDto;
import test.cafe.dto.CafeLikeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeLikeUpdateAction extends Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {		
		int num=Integer.parseInt(request.getParameter("num"));
		String name=request.getParameter("name");
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		boolean isSuccess;
		CafeLikeDto dto=new CafeLikeDto();
		dto.setName(name);
		dto.setBoardNum(boardNum);
		boolean check=CafeLikeDao.getInstance().isLiked(dto);
		if(check) {			
			CafeLikeDao.getInstance().updateCancel(dto);
			isSuccess=false;
		}else {
			isSuccess=CafeLikeDao.getInstance().updateAdd(dto);
		}		
		//좋아요 개수 업데이트
		CafeDao.getInstance().addLikeCnt(num);
		CafeDto dto2=CafeDao.getInstance().getData(num);
		
		request.setAttribute("isSuccess", isSuccess);
		request.setAttribute("dto2", dto2);
		
		return new ActionForward("/views/cafe/private/like_update.jsp");
	}
}
