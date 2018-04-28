package org.kdb.model2.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.kdb.model2.dao.ArticlesDAO;
import org.kdb.model2.dao.LikesDAO;
import org.kdb.model2.dao.RepliesDAO;
import org.kdb.model2.util.PaginateUtil;
import org.kdb.model2.vo.Article;
import org.kdb.model2.vo.Like;
import org.kdb.model2.vo.PageVO;
import org.springframework.transaction.annotation.Transactional;

public class ArticlesServiceImpl implements ArticlesService {
	
	private ArticlesDAO articlesDAO;
	private RepliesDAO repliesDAO;
	private LikesDAO likesDAO;
	
	public void setArticlesDAO(ArticlesDAO articlesDAO) {
		this.articlesDAO = articlesDAO;
	}
	public void setRepliesDAO(RepliesDAO repliesDAO) {
		this.repliesDAO = repliesDAO;
	}
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	

	@Override
	public Map<String, Object> getArticles(int now) {
		// TODO Auto-generated method stub
		int numPage = 3;//각 인덱스당 출력되는 article 개수 
		int numBlock = 4;//출력될 페이지 인덱스 개수
		
		PageVO pageVO = new PageVO(now, numPage); //페이지 처음과 끝
		List<Article> articles = articlesDAO.selectArticle(pageVO);// article 출력
		
		//총 article 수 
		int total = articlesDAO.selectTotal();
		
		//페이지 인덱스 출력
		String paginate =  PaginateUtil.getPaginate(now, total, numPage, numBlock, "index/", "now");
		
		
		Map<String, Object> mapData= new ConcurrentHashMap<>();
		mapData.put("paginate", paginate);
		mapData.put("articles", articles);
		
		
		
		return mapData;
	}

	@Override
	public Map<String, Object> getArticle(int no, int page) { //article 상세페이지
		// TODO Auto-generated method stub
		int numPage = 10; //각 인덱스 당 출력되는 댓글 개수 
		int numBlock= 4; // 출력될 페이지 인덱스 개수
		Map<String, Object> mapData = new ConcurrentHashMap<>();//리플페이지,리플,아티클 넣음
		PageVO pageVO = new PageVO(no,page,numPage);
		
		mapData.put("article", articlesDAO.selectArticle(no));//아티클
		mapData.put("replies", repliesDAO.selectReplies(pageVO));//리플 		
		
		int total = repliesDAO.selectTotal(no); //총 리플 개수
		
		String paginate = PaginateUtil.getPaginate(page, total, numPage, numBlock, "article/"+no, "&page");
		mapData.put("paginate", paginate);
		

		return mapData;
	}
	@Override
	public boolean writeArticle(Article article) {
		// TODO Auto-generated method stub
		if(articlesDAO.insertArticle(article)>0) {return true;}
		return false;
	}
	
	@Transactional
	@Override
	public void deleteArticle(int no) {
		// TODO Auto-generated method stub
		Like like = new Like();
		repliesDAO.deleteReplies(no);
		like.setType("A");
		like.setTypeNo(no);
		likesDAO.deleteLikes(like);
		articlesDAO.deleteArticle(no);
	}
	@Override
	public boolean updateArticle(Article article) {
		// TODO Auto-generated method stub
		if(articlesDAO.updateArticle(article)>0) {return true;}
		return false;
	}




	
	

}
