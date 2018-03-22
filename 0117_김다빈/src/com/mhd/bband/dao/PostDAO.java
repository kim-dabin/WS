package com.mhd.bband.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mhd.bband.util.SqlSessionUtil;
import com.mhd.bband.vo.Page;
import com.mhd.bband.vo.Post;

public class PostDAO {
	//댓글 총 수 
	public static int selectTotal() {
		int result =0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.selectOne("posts.selectTotal");//모든 포스트들의 결과를 반영하는데 왜 selectOne??
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return result;
	}
	
	
	//댓글 삭제
	public static int deletePost(int no) {
		int result = 0;
		SqlSession session= null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.delete("posts.deletePost", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
	//댓글들 출력
	public static List<Post> selectPosts(Page page){
		List<Post> posts = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			posts = session.selectList("posts.selectPosts",page);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return posts;
	}
	
	
	//댓글 입력
	public static int insertPost(Post post) {
		int result =0;
		SqlSession session =null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("posts.insertPost", post);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return result;
	}//insertPost end
}
