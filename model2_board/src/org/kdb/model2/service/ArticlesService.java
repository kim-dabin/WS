package org.kdb.model2.service;

import java.util.List;
import java.util.Map;

import org.kdb.model2.vo.Article;
import org.kdb.model2.vo.Like;
import org.kdb.model2.vo.PageVO;

public interface ArticlesService {
	
	public Map<String, Object> getArticles(int now);
	public Map<String, Object> getArticle(int no, int page);
	public boolean writeArticle(Article article);
	public void deleteArticle(int no);
	public boolean updateArticle(Article article);

}
	