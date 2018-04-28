package org.kdb.model2.service;

import org.kdb.model2.vo.Like;

public interface LikesService {
	public void doLike(Like like);
	public boolean beLike(Like like);
	public void cancelLike(Like like);
	public Like getLike(Like like);
	

}
