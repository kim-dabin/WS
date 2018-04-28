package org.kdb.model2.controller;

import org.kdb.model2.service.RepliesService;
import org.kdb.model2.vo.Reply;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RepliesController {
	
	private RepliesService repliesService;

	
	public void setRepliesService(RepliesService repliesService) {
		this.repliesService = repliesService;
	}
	

	//댓글 입력
	@RequestMapping(value="/article/{articleNo}/comment", method=RequestMethod.POST)
	public String write(Reply reply, @RequestHeader String referer) {
		
		System.out.println("댓글 입력"+reply.getArticleNo());
		//댓글 입력
		repliesService.writeReply(reply);
		
		return "redirect:"+referer;
	}
	
	//댓글 삭제
	@RequestMapping(value="/article/{articleNo}/comment/{no}", method=RequestMethod.POST)
	public String delete(@PathVariable int no,@PathVariable int articleNo, @RequestHeader String referer) {
		System.out.println("댓글 삭제 "+no+articleNo);
		repliesService.deleteReply(no, articleNo);
		return "redirect:"+referer;
	}

}
