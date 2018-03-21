package ex;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Genre;

public class Ex12 {
	public static void main(String[] args) {
		SqlSession session = SqlSessionUtil.getSqlSession();
		List<Genre> genreList = session.selectList("genres.selectList");
		int i=0;
		for(Genre genre : genreList) {
			System.out.println("번호:"+ genre.getNo() + " / 장르명:"+ genre.getName());
		}
	}
}
