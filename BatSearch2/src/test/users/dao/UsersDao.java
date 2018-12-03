package test.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.mybatis.SqlMapConfig;
import test.users.dto.UsersDto;

public class UsersDao {
	private static UsersDao dao;
	private static SqlSessionFactory factory;
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
			//SqlSessionFactory 객체도 static
			factory=SqlMapConfig.getSessionFactory();
		}
		return dao;
	}
	//인자로 전달된 아이디를 이용해서 정보를 업데이트하는 메소드
	public boolean update(UsersDto dto) {
		SqlSession session=null;
		int flag=0;
		try {
			session=factory.openSession(true);
			flag=session.update("users.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	//인자로 전달된 이메일을 이용해서 정보를 삭제하는 메소드
	public boolean delete(String name) {
		SqlSession session=null;
		int flag=0;
		try {
			session=factory.openSession(true);
			flag=session.delete("users.delete", name);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(flag>0) {
			return true;
		}else {
			return false;			
		}
	}
	
	//인자로 전달된 아이디를 이용해서 회원정보를 리턴해주는 메소드
	public UsersDto getData(String name) {
		SqlSession session=null;
		UsersDto dto=null;
		try {
			session=factory.openSession();
			dto=session.selectOne("users.getData", name);
		} catch (Exception e) {
			e.printStackTrace();			
		}finally {
			session.close();
		}
		return dto;		
	}
	//인자로 전달된 회원 정보가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		SqlSession session=null;
		String email=null;
		try {
			session=factory.openSession();
			email=session.selectOne("users.isValid", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(email!=null) {
			return true;			
		}else {
			return false;
		}
		
	}
	//인자로 전달되는 아이디를 사용가능한지 여부를 리턴해주는 메소드
	public boolean canUseName(String inputName) {
		//사용 가능한지 여부를 담을 지역변수 만들고 초기값 true 부여
		SqlSession session=null;
		String name=null;
		try {
			session=factory.openSession();
			name=session.selectOne("users.canUseName", inputName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(name==null) {
			return true;			
		}else {
			return false;
		}		
	}
	public boolean insert(UsersDto dto) {
		//DB 에 작업 하기 위한 SqlSession 객체를 담을 지역변수 만들기
		SqlSession session=null;
		int flag=0;
		try {
			//SqlSessionFactory 객체로 부터 SqlSession 객체 얻어내기
			//	.openSession(auto commit 여부)	//default : false
			session=factory.openSession(true);
			// member.insert : mapper 의 namespace . sql id
			// dto : MemberDto type : parameterType
			// flag : 영향을 받은 row 의 갯수 리턴
			
			// .openSession() 은 auto commit 이 false 이다
			// 따라서 custom 으로 commit 혹인 rollback 을 해야 한다.
			flag=session.insert("users.insert", dto);
			//session.update(null,null);
			//session.delete(null,null);
			//session.insert(null,null);
			//트랜젝션이 모두 적용되고 커밋이 되야할경우 이런식으로
			//해야한다.
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}		
	}
}
