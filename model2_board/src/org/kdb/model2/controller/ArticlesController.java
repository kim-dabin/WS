package org.kdb.model2.controller;

import java.util.Map;

import org.kdb.model2.service.ArticlesService;
import org.kdb.model2.service.LikesService;
import org.kdb.model2.service.RepliesService;
import org.kdb.model2.vo.Article;
import org.kdb.model2.vo.Like;
import org.kdb.model2.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class ArticlesController {
	private ArticlesService articlesService;
	private RepliesService repliesService;
	private LikesService likesService;
	
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}

	
	public void setArticlesService(ArticlesService articlesService) {
		this.articlesService = articlesService;
	}
	
	public void setRepliesService(RepliesService repliesService) {
		this.repliesService = repliesService;
	}
	//업데이트 
	@RequestMapping(value="/article/{no}", method= RequestMethod.PUT)
	public String update(@PathVariable int no, Article article) {
		System.out.println("아티클 업데이트");
		articlesService.updateArticle(article);
		return "redirect:/article/"+no;
	}
	
	
	//업데이트폼
	@RequestMapping(value="/article/update/{no}", method=RequestMethod.GET)
	public String updateForm(Model model, @PathVariable int no) {
		model.addAttribute("type", "수정");
		model.addAttribute("no", no);
		return "articleForm";
	}
	
	//삭제
	@RequestMapping(value="/article/{no}", method=RequestMethod.DELETE)
	public String delete(@PathVariable int no, Like like) {
		articlesService.deleteArticle(no);
		return "redirect:/index";
	} 
	
	
	//입력
	@RequestMapping(value="/article/write", method=RequestMethod.POST)
	public String write(Article article) {
		articlesService.writeArticle(article);
		System.out.println("article 입력됨");
		return "redirect:/article/"+article.getNo();
	}
	//입력폼
	@RequestMapping(value="/article/write", method=RequestMethod.GET)
	public String articleForm(Model model) {
		System.out.println("입력폼");
		model.addAttribute("type", "쓰기");
	
		return "articleForm";
	}
	
	//인덱스 
	@RequestMapping("/index")
	public void index(Model model, @RequestParam(defaultValue="1") int now) {
		model.addAllAttributes(articlesService.getArticles(now));
		
	} 
	//아티클 상세페이지
	@RequestMapping(value="/article/{no}", method=RequestMethod.GET)
	public String article(@PathVariable int no, @RequestParam(defaultValue="1") int page, Model model) {
		System.out.println("page:"+page);
		System.out.println("article:"+no);
	
		Map<String, Object> mapData = articlesService.getArticle(no,page);
		model.addAllAttributes(mapData);
		model.addAttribute("totalReplies", repliesService.totalReplies(no));
		System.out.println(mapData.get("paginate"));
		
		return "article";
	}
	
}
