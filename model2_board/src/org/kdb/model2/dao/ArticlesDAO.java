package org.kdb.model2.dao;

import java.util.List;

import org.kdb.model2.vo.Article;
import org.kdb.model2.vo.PageVO;

public interface ArticlesDAO {
	public List<Article> selectArticle(PageVO pageVO);
	public int selectTotal();
	public Article selectArticle(int no);
	public int insertArticle(Article article);
	public int updateReplies(int no);
	public int updateLikes(int no);
	public int deleteArticle(int no);
	public int updateArticle(Article article);
}
