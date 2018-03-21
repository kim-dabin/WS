package ex;

import java.sql.Date;
import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Genre;
import vo.Movie;

public class Ex15 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		SqlSession session = SqlSessionUtil.getSqlSession();
		Movie movie = new Movie();

		System.out.println("★ 영화입력 프로그램 ★");
		// 장르 출력
		List<Genre> genreList = session.selectList("genres.selectList");
		for (Genre genre : genreList) {
			String str= genre.getNo() + ") " + genre.getName() + " / ";
			System.out.print(str);
		} // for
		while(true) {
		// 장르 번호 입력
			System.out.println("\n장르번호를 입력해주세요.");
			int genre = scan.nextInt();
	
		movie.setGenre(genre);
		scan.nextLine();// 개행문자 제거
		// 영화 이름 입력
		System.out.println("영화이름을 입력해주세요.");
		String name = scan.nextLine();
		movie.setName(name);

		// 감독이름 입력
		System.out.println("감독이름을 입력해주세요.");
		String director = scan.nextLine();
		movie.setDirector(director);

		// 개봉일 입력
		System.out.println("아래와 같은 포맷으로 개봉일을 입력해주세요.\n1993-11-17(년-월-일)");
		Date releaseDate = Date.valueOf(scan.nextLine()); // String -> Date
		movie.setReleaseDate(releaseDate);

		// 종료일 입력
		System.out.println("아래와 같은 포맷으로 종료일을 입력해주세요.\n1993-11-17(년-월-일)");
		String endDateStr = scan.nextLine(); 
		if(endDateStr.equals("")) {
			movie.setEndDate(null);
		}else {
			Date endDate = Date.valueOf(endDateStr); // String -> Date
			movie.setEndDate(endDate);
		}
		// 관객수 입력
		System.out.println("관객수를 입력해주세요.(없으면 그냥 엔터)");
		String audienceNumStr = scan.nextLine();
		if(audienceNumStr.equals("")) {
			movie.setAudienceNum(0);
		}else {
		int audienceNum = Integer.parseInt(audienceNumStr);
		movie.setAudienceNum(audienceNum);
		}
		// 영화 정보 넣기
		int num = session.insert("movies.insertMovie", movie);
		
		System.out.println(num+"개의 영화가 등록되었습니다.");
		break;
		
		}//while 
	}

}
