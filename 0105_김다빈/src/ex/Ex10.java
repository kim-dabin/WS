package ex;

import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Genre;

public class Ex10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		SqlSession session = SqlSessionUtil.getSqlSession();
		Genre genre = new Genre();
		
		System.out.println("변경할 장르번호를 입력하세요.");
		int no = scan.nextInt();
		scan.nextLine();//개행문자 제거\r\n
		System.out.println("변경될 장르명을 입력하세요.");
		String name = scan.nextLine(); 
		
		genre.setNo(no); //vo에 no 넣기
		genre.setName(name); //vo에 name 넣기
	
		
		int num = session.update("genres.updateGenre", genre);
		if(num>0) {
			System.out.println("수정되었습니다.");
		}
		
		
		
	}

}
