package ex;

import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;

public class Ex11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		SqlSession session = SqlSessionUtil.getSqlSession();
		
		System.out.println("삭제할 장르를 입력하세요.");
		String name = scan.nextLine();// 삭제할 장르 입력 
		int num = session.delete("genres.deleteGenre", name); //삭제
		if(num>0) {
			System.out.println(num+"개의 장르가 삭제되었습니다.");
		}else {
			System.out.println("장르가 없습니다.");
		}
		
		
		
		
		
	}

}
