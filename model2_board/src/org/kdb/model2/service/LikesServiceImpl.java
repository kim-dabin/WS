package org.kdb.model2.service;

import org.kdb.model2.dao.ArticlesDAO;
import org.kdb.model2.dao.LikesDAO;
import org.kdb.model2.vo.Like;
import org.springframework.transaction.annotation.Transactional;

public class LikesServiceImpl implements LikesService {
	
	private LikesDAO likesDAO;
	private ArticlesDAO articlesDAO;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	public void setArticlesDAO(ArticlesDAO articlesDAO) {
		this.articlesDAO = articlesDAO;
	}
	@Transactional
	@Override
	public void doLike(Like like) {
		// TODO Auto-generated method stub
		likesDAO.insertLike(like);//라이크 하기 
		System.out.println("게시글 insert no"+like.getTypeNo());
		articlesDAO.updateLikes(like.getTypeNo());//각 연관된 테이플의 like 수 업데이트
	}

	@Override
	public boolean beLike(Like like) { //라이크 객체 확인
		// TODO Auto-generated method stub
		if(likesDAO.selectLike(like)>0) return true;
		
		return false;
	}
	@Transactional
	@Override
	public void cancelLike(Like like) {
		// TODO Auto-generated method stub
		likesDAO.deleteLike(like.getNo()); //like 삭제
		System.out.println("게시글 delete no"+like.getTypeNo());
		articlesDAO.updateLikes(like.getTypeNo());//각 연관된 테이플의 like 수 업데이트
	
	}
	@Override
	public Like getLike(Like like) {
		// TODO Auto-generated method stub
		return likesDAO.selectLikeInfo(like);
	}

}
