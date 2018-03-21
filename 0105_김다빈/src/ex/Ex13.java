package ex;

import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Movie;

public class Ex13 {

	public static void main(String[] args) {
		SqlSession session = SqlSessionUtil.getSqlSession();
		Scanner scan = new Scanner(System.in);
		List<Movie> movieList = session.selectList("movies.selectList"); // 영화 목록 
		int i=0;
		for(Movie movie : movieList) {
			i++;
			System.out.print(movie.getNo() +")"+ movie.getName()+" ");
			if(i%4==0) {// 영화목록 한줄에 4개씩 출력
				System.out.println();
			}//if
		}//for 

		System.out.println("\n삭제할 영화번호는?");
		int no = scan.nextInt();
		int num = session.delete("movies.deleteMovie", no); //영화삭제
		if(num>0)	{
			System.out.println(num+"개의 영화가 삭제되었습니다.");}
		else {
			System.out.println("삭제되지 않았습니다.");
		}
		
	}// main

}//Ex13
