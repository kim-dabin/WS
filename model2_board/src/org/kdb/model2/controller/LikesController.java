package org.kdb.model2.controller;

import java.util.Map;

import org.kdb.model2.service.ArticlesService;
import org.kdb.model2.service.LikesService;
import org.kdb.model2.vo.Article;
import org.kdb.model2.vo.Like;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LikesController {
	
	private LikesService likesService;
	private ArticlesService articlesService;
	
	
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}
	public void setArticlesService(ArticlesService articlesService) {
		this.articlesService = articlesService;
	}
	

	
	///라이크 했는지 안했는 지 확인 
	@RequestMapping(value="/checkLike", method=RequestMethod.POST)
	@ResponseBody
	public String getLike(Like like) {
		
		boolean result = likesService.beLike(like);
		
		return "{\"result\":"+result+"}";
	}
	//라이크 함
	@RequestMapping(value="/doLike", method=RequestMethod.POST)
	@ResponseBody
	public String doLike(Like like, @RequestParam(defaultValue="1") int page) {
		System.out.println("like 하기");
		System.out.println("do Like"+like.getNo());
		System.out.println("do getTypeNo"+like.getTypeNo());
		likesService.doLike(like);
		Map<String, Object> mapData = articlesService.getArticle(like.getTypeNo(), page);
		System.out.println("page"+page);
		Article article =(Article)mapData.get("article");
		
		System.out.println("doLike typeNo"+article.getNo());
		
		return "{\"likes\":"+article.getLikes()+"}";
	}
	//라이크 삭제
	@RequestMapping(value="/cancelLike", method=RequestMethod.POST)
	@ResponseBody
	public String cancelLike(Like like, @RequestParam(defaultValue="1") int page) {
		System.out.println("like 취소"+ like.getNo());
		likesService.cancelLike(like);
		Map<String, Object> mapData = articlesService.getArticle(like.getTypeNo(), page);
		Article article =(Article)mapData.get("article");
		
		System.out.println("doLike typeNo"+article.getNo());
		
		return "{\"likes\":"+article.getLikes()+"}";
	}
	
	//라이크 번호
	@RequestMapping(value="/getLike", method= RequestMethod.POST)
	@ResponseBody
	public String getLikeInfo(Like like) {
		Like result = likesService.getLike(like);
		
		return "{\"no\":"+result.getNo()+"}";
	}

}
