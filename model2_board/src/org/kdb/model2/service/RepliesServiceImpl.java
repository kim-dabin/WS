package org.kdb.model2.service;

import org.kdb.model2.dao.ArticlesDAO;
import org.kdb.model2.dao.RepliesDAO;
import org.kdb.model2.vo.Reply;
import org.springframework.transaction.annotation.Transactional;

public class RepliesServiceImpl implements RepliesService {
	private RepliesDAO repliesDAO;
	private ArticlesDAO articlesDAO;
	
	public void setRepliesDAO(RepliesDAO repliesDAO) {
		this.repliesDAO = repliesDAO;
	}
	public void setArticlesDAO(ArticlesDAO articlesDAO) {
		this.articlesDAO = articlesDAO;
		
	}
	
	@Override
	public int totalReplies(int no) {
		// TODO Auto-generated method stub
		return repliesDAO.selectTotal(no);
	}
	///댓글 작성
	@Transactional
	@Override
	public void writeReply(Reply reply) {
		// TODO Auto-generated method stub
		//댓글 insert
		repliesDAO.insertReply(reply); 
		
		//댓글 수 articles 테이블에 업데이트
		articlesDAO.updateReplies(reply.getArticleNo());
		
	}
	
	///댓글삭제
	@Transactional
	@Override
	public void deleteReply(int no, int articleNo) {
		// TODO Auto-generated method stub
		repliesDAO.deleteReply(no);// 리플 삭제
		articlesDAO.updateReplies(articleNo);// 아티클 테이블 리플 수 업데이트
	}


}
