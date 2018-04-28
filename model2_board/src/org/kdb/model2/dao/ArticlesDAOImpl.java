package org.kdb.model2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kdb.model2.vo.Article;
import org.kdb.model2.vo.PageVO;

public class ArticlesDAOImpl implements ArticlesDAO {
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Article> selectArticle(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("articles.selectArticles", pageVO);
	}

	@Override
	public int selectTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("articles.selectTotal");
	}

	@Override
	public Article selectArticle(int no) {
		// TODO Auto-generated method stub
		
		return session.selectOne("articles.selectArticle", no);
	}

	@Override
	public int insertArticle(Article article) {
		// TODO Auto-generated method stub
		return session.insert("articles.insertArticle", article); 
	}
///댓글 수 업데이트
	@Override
	public int updateReplies(int no) {
		// TODO Auto-generated method stub
		return session.update("articles.updateReplies", no);
	}

	@Override
	public int updateLikes(int no) {
		// TODO Auto-generated method stub
		return session.update("articles.updateLikes", no);
	}

	@Override
	public int deleteArticle(int no) {
		// TODO Auto-generated method stub
		return session.delete("articles.deleteArticle", no);
	}

	@Override
	public int updateArticle(Article article) {
		// TODO Auto-generated method stub
		return session.update("articles.updateArticle", article);
	}

}
