package ex;

import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Movie;

public class Ex14 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		SqlSession session = SqlSessionUtil.getSqlSession();
		
		System.out.println("검색할 영화제목을 입력해주세요.");
		String p = scan.nextLine();//검색어
		List<Movie> movieList = session.selectList("movies.selectResearch", "%"+p+"%");
		if(!movieList.isEmpty()) {
			for(Movie movie: movieList ) {//검색 결과 출력
				System.out.println(movie.getNo()+")"+ movie.getName() +" / 감독 : "+ movie.getDirector() +" / 개봉일 : "
			+ movie.getFmtReleaseDate() +" / 관객수 : "+ movie.getFmtAudienceNum() +"명 / 장르 : "+ movie.getGenre());
			}//for
			
		}else{//검색 결과가 없을시
			System.out.println("검색된 영화가 없습니다.");
		}//if~else
		
	}//main

}//Ex14
