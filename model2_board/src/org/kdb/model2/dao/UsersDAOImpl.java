package org.kdb.model2.dao;

import org.apache.ibatis.session.SqlSession;
import org.kdb.model2.vo.User;

public class UsersDAOImpl implements UsersDAO {
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
//로그인
	@Override
	public User selectLogin(User userInfo) {
		// TODO Auto-generated method stub
		
		System.out.println("DAO"+userInfo.getProfile());
		return session.selectOne("users.selectLogin", userInfo);
	}
//가입
	@Override
	public int insertJoin(User userInfo) {
		// TODO Auto-generated method stub
		return session.insert("users.insertUser", userInfo);
	}
	@Override
	public User selectId(String userID) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectId", userID);
	}
	
}
