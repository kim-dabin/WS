package org.kdb.model2.dao;

import org.apache.ibatis.session.SqlSession;
import org.kdb.model2.vo.Like;

public class LikesDAOImpl implements LikesDAO {
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return session.insert("likes.insertLike", like);
	}


	@Override
	public int deleteLike(int no) {
		// TODO Auto-generated method stub
		return session.delete("likes.deleteLike", no);
	}

	@Override
	public int selectLike(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectLike", like);
	}

	@Override
	public Like selectLikeInfo(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectLikeInfo", like);
	}

	@Override
	public int deleteLikes(Like like) {
		// TODO Auto-generated method stub
		return session.delete("likes.deleteLikes", like);
	}
}
