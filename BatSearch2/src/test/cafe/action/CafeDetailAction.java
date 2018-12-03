package test.cafe.action;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeCommentDto;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeDetailAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		CafeDto dto=new CafeDto();
		if(keyword != null) {//검색 키워드가 전달된 경우
			if(condition.equals("titlecontent")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
			//request 에 검색 조건과 키워드 담기
			request.setAttribute("condition", condition);
			/*
			 * 검색 키워드에는 한글이 포함될 가능성이 있기 때문에
			 * 링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서
			 * request에 담아준다. */
			String encodedKeyword = null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}
		//CafeDto에 글번호도 담기
		dto.setNum(num);
		CafeDto resultDto=CafeDao.getInstance().getData(dto);
		//조회수 증가
		CafeDao.getInstance().addViewCount(num);		
		request.setAttribute("dto", resultDto);
		
		//댓글목록
		List<CafeCommentDto> commentList=
				CafeCommentDao.getInstance().getList(num);
		request.setAttribute("commentList", commentList);
		return new ActionForward("/views/cafe/detail.jsp");
	}

}
