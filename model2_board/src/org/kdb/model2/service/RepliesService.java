package org.kdb.model2.service;

import org.kdb.model2.vo.Reply;

public interface RepliesService {
	public int totalReplies(int no); //총 댓글 개수
	public void writeReply(Reply reply); // 댓글 작성
	public void deleteReply(int no, int articleNo); //댓글 삭제

}
