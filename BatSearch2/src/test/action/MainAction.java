package test.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class MainAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		List<String> noticeList=new ArrayList<>();
		noticeList.add("-------공지사항-------");
		noticeList.add("안녕하세요.");
		noticeList.add("반갑습니다.");
		noticeList.add("-------공지사항-------");
		request.setAttribute("noticeList", noticeList);
				
		String check=(String)request.getAttribute("check");
		check="w";
		if(check==null){
			check="";
		}
		request.setAttribute("check", check);
		
		return new ActionForward("/views/main.jsp");
	}

}
