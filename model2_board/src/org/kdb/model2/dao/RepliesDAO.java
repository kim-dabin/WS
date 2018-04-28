package org.kdb.model2.dao;

import java.util.List;
import java.util.Map;

import org.kdb.model2.vo.PageVO;
import org.kdb.model2.vo.Reply;

public interface RepliesDAO {
	public List<Reply> selectReplies(PageVO pageVO);
	public int selectTotal(int no);
	public int insertReply(Reply reply);
	public int deleteReplies(int articleNo);
	public int deleteReply(int no);

}
