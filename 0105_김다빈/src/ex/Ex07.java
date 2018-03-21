package ex;

import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class Ex07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//int[] arr = new int[5]; // 로또 번호를 담을 배열
		Set<Integer> arr = new TreeSet<>(); // 중복 허용하지 않고 정렬 시켜줌
		Random random = new Random();
		for(int i=0; i<6; i++) {
			int ran = random.nextInt(45)+1;// 1~45 수 들중 랜덤하게 하나의 숫자를 뽑음
			if(!arr.add(ran)) i--; //arr에 숫자를 넣고 ran이 중복된 숫자라 들어가지 않으면 i--
		}
		System.out.println(arr); // 로또 번호 출력
		
	
	}
}
