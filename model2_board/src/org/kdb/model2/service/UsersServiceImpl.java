package org.kdb.model2.service;

import org.kdb.model2.dao.UsersDAO;
import org.kdb.model2.vo.User;

public class UsersServiceImpl implements UsersService {
	
	private UsersDAO usersDAO;
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	

	@Override
	public User login(User userInfo) {
		// TODO Auto-generated method stub
		return usersDAO.selectLogin(userInfo);
	}

//가입
	@Override
	public boolean join(User userInfo) {
		// TODO Auto-generated method stub
		if(usersDAO.insertJoin(userInfo)>0) {
			return true;
		}
		return false;
	}

//아이디 확인
	@Override
	public User checkID(String userID) {
		// TODO Auto-generated method stub
		return usersDAO.selectId(userID);
	}

}
