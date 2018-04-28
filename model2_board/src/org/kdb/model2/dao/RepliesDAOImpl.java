package org.kdb.model2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kdb.model2.vo.PageVO;
import org.kdb.model2.vo.Reply;

public class RepliesDAOImpl implements RepliesDAO{
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<Reply> selectReplies(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("replies.selectReplies", pageVO);
	}
	@Override
	public int selectTotal(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("replies.selectTotal", no);
	}
	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return session.insert("replies.insertReply", reply);
	}
	@Override
	public int deleteReplies(int articleNo) {
		// TODO Auto-generated method stub
		return session.delete("replies.deleteReplies", articleNo);
	}
	@Override
	public int deleteReply(int no) {
		// TODO Auto-generated method stub
		return session.delete("replies.deleteReply", no);
	}
	

}
