package ex;

import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Genre;

public class Ex09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		SqlSession session = SqlSessionUtil.getSqlSession();//만들어 놓은 SqlSessionUtil을 가져옴
		
		System.out.println("추가할 장르를 입력하세요.");
		String name = scan.nextLine(); //입력된 장르 네임 
		int num = session.insert("genres.insertGenre", name);
			if(num<0) {
				System.out.println("장르를 입력해주세요");
			}else {
				System.out.println("장르가 입력되었습니다.");
			}
		
		
				
	}

}
