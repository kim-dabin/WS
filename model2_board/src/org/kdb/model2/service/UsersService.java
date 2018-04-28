package org.kdb.model2.service;

import org.kdb.model2.vo.User;

public interface UsersService {
	
	//로그인 
	public User login(User userInfo);
	//가입
	public boolean join(User userInfo);
	//아이디 
	public User checkID(String userID);
}
