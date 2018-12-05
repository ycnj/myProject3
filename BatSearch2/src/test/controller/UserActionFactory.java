package test.controller;

import test.action.MainAction;
import test.cafe.action.CafeCommentDeleteAction;
import test.cafe.action.CafeCommentInsertAction;
import test.cafe.action.CafeCommentUpdateAction;
import test.cafe.action.CafeDeleteAction;
import test.cafe.action.CafeDetailAction;
import test.cafe.action.CafeInsertAction;
import test.cafe.action.CafeInsertformAction;
import test.cafe.action.CafeLikeUpdateAction;
import test.cafe.action.CafeListAction;
import test.cafe.action.CafeUpdateAction;
import test.cafe.action.CafeUpdateformAction;
import test.search.action.SearchIdAction;
import test.search.action.SearchListAction;
import test.users.action.SignupAction;
import test.users.action.UsersCheckNameAction;
import test.users.action.UsersDeleteAction;
import test.users.action.UsersInfoAction;
import test.users.action.UsersLoginAction;
import test.users.action.UsersLoginformAction;
import test.users.action.UsersLogoutAction;
import test.users.action.UsersSignupformAction;
import test.users.action.UsersUpdateAction;
import test.users.action.UsersUpdateformAction;

public class UserActionFactory {
	// sigle ton 으로 사용 될수 있도록 한다. (객체가 하나만 생성되도록)
	private static UserActionFactory factory;
	private UserActionFactory() {}
	public static UserActionFactory getInstance() {
		if(factory==null) {
			factory=new UserActionFactory();
		}
		return factory;
	}
	
	//인자로 전달되는 command를 수행할 "액션 객체"를 리턴해주는 메소드
	public Action action(String command) {
		Action action=null;
		if(command.equals("/main")) {
			action=new MainAction();
		}else if(command.equals("/users/signupform")) {
			action=new UsersSignupformAction();
		}else if(command.equals("/users/signup")) {
			action=new SignupAction();
		}else if(command.equals("/users/loginform")) {
			action=new UsersLoginformAction();
		}else if(command.equals("/users/login")) {
			action=new UsersLoginAction();
		}else if(command.equals("/users/logout")) {
			action=new UsersLogoutAction();
		}else if(command.equals("/users/private/updateform")) {
			action=new UsersUpdateformAction();
		}else if(command.equals("/users/private/update")) {
			action=new UsersUpdateAction();
		}else if(command.equals("/users/private/delete")) {
			action=new UsersDeleteAction();
		}else if(command.equals("/users/private/info")) {
			action=new UsersInfoAction();
		}else if(command.equals("/users/checkname")) {
			action=new UsersCheckNameAction();
		}else if(command.equals("/cafe/list")) {
			action=new CafeListAction();
		}else if(command.equals("/cafe/private/insertform")) {
			action=new CafeInsertformAction();
		}else if(command.equals("/cafe/private/insert")) {
			action=new CafeInsertAction();
		}else if(command.equals("/cafe/detail")) {
			action=new CafeDetailAction();
		}else if(command.equals("/cafe/private/delete")) {
			action=new CafeDeleteAction();
		}else if(command.equals("/cafe/private/updateform")) {
			action=new CafeUpdateformAction();
		}else if(command.equals("/cafe/private/update")) {
			action=new CafeUpdateAction();
		}else if(command.equals("/cafe/private/comment_insert")) {
			action=new CafeCommentInsertAction();
		}else if(command.equals("/cafe/private/comment_delete")) {
			action=new CafeCommentDeleteAction();
		}else if(command.equals("/cafe/private/comment_update")) {
			action=new CafeCommentUpdateAction();
		}else if(command.equals("/cafe/private/like")) {
			action=new CafeLikeUpdateAction();
		}else if(command.equals("/search/list")) {
			action=new SearchListAction();
		}else if(command.equals("/search/id")) {
			action=new SearchIdAction();
		}
		return action;
	}
}
