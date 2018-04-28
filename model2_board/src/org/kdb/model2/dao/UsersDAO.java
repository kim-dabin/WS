package org.kdb.model2.dao;



import org.kdb.model2.vo.User;

public interface UsersDAO {
	public User selectLogin(User userInfo);
	//가입
	public int insertJoin(User userInfo);
	//아이디 찾기
	public User selectId(String userID);
}
