package test.cafe.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.cafe.dto.CafeLikeDto;
import test.mybatis.SqlMapConfig;

public class CafeLikeDao {
	private static CafeLikeDao dao;
	private static SqlSessionFactory factory;
	private CafeLikeDao() {}
	//CafeDao 객체를 리턴해주는 static 멤버 메소드
	public static CafeLikeDao getInstance() {
		if(dao==null) {
			dao=new CafeLikeDao();
			factory=SqlMapConfig.getSessionFactory();
		}
		return dao;
	}
	
	//좋아요 눌렀는지 확인하는 메소드
	public boolean isLiked(CafeLikeDto dto) {
		SqlSession session = null;
		int like_check = 0;
		try {
			session = factory.openSession(true);
			like_check=session.selectOne("cafeLike.isLiked", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (like_check == 1) {
			return true;
		} else {
			return false;
		}
	}
	//좋아요 -1
	public boolean updateCancel(CafeLikeDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag=session.insert("cafeLike.like_cancel", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//좋아요 +1
	public boolean updateAdd(CafeLikeDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag=session.insert("cafeLike.like_add", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
