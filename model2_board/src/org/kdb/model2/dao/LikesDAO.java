package org.kdb.model2.dao;

import java.util.List;

import org.kdb.model2.vo.Like;

public interface LikesDAO {
	public int insertLike(Like like);
	public int selectLike(Like like);
	public int deleteLike(int no);
	public Like selectLikeInfo(Like like);
	public int deleteLikes(Like like);

}
