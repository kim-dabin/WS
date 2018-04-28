package org.kdb.model2.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kdb.model2.service.UsersService;
import org.kdb.model2.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UsersController{
	private UsersService usersService;
	
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	//회원가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(User user, MultipartFile upload, RedirectAttributes ra, 
			HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("가입");
		
		//파일 타입 저장 
		String type = upload.getContentType();
		//false == 정상 true == 에러
		boolean flag = false;
		System.out.println("type: "+type);
		System.out.println("flag"+flag);
//
//		if(!type.startsWith("img/")) {//startsWith 문자열 인스턴스 시작 부분과 지정한 문자열이 일치하는지를 확인
//			ra.addFlashAttribute("fileMsg", "이미지 파일을 선택해주세요");
//			flag = true;
//		}// if end
//		System.out.println("flag"+flag);
		
		
//	//정규표현식-아이디 
//		String userID = user.getId();
//		System.out.println(userID);
//		if(userID.matches("[\\w]{4,20}")) {
//			//아이디가 기존에 있는지 확인
//			if(usersService.checkID(userID)!=null) {
//				ra.addFlashAttribute("idMsg", userID+"는 있는 아이디입니다.");
//				flag= true;}
//		}else {
//			ra.addFlashAttribute("idMsg", "id는 영어,숫자로 4~20자 입력");
//			flag= true;
//		}//if~else end
//		
//		
//		
//		//정규표현식-nickname
//		String nickname =user.getNickname();
//		if(!(nickname.matches("[ㄱ-힣|0-9]{1,10}"))) {
//			ra.addFlashAttribute("nicknameMsg", "10자 내로 한글,숫자 입력");
//			flag = true;
//		}//if end
//		
//		//정규표현식-비밀번호
//		String pwd = user.getPassword();
//		if(!(pwd.matches("^[\\w]{4,32}"))) {
//			ra.addFlashAttribute("pwdMsg","비밀번호는 4~32자로 입력" );
//			flag = true;
//		}//if end
//		
//		//비밀번호 확인
//		String confirm = user.getConfirm();
//		if(!(confirm.equals(pwd))) {
//			ra.addFlashAttribute("confirmMsg", "비밀번호가 다릅니다");
//			flag = true;
//		}//if end
//		
		//생년월일
		try {
			user.getBirthDate();//문제없음
		}catch (Exception e) {
			//생년월일이 null 뜰때
			ra.addFlashAttribute("bdMsg", "생년월일을 형식에 맞게 입력하세요");
			flag = true;
		}//try ~ catch
		
		
		System.out.println("flag"+flag);
		
		
		/*입력*/
		if(flag) { 
			System.out.println(user.getId());
			System.out.println(user.getBirthDate());
			
			
			System.out.println("입력안됨"); return "redirect:/join";}
		else {
			//파일 업로드 처리
			String path = request.getServletContext().getRealPath(File.separator+"profile")+File.separator;
			System.out.println("UsersController 안의 join()의 실제경로"+path);
			
			//이름 중복 거름
			UUID uuid = UUID.randomUUID();
			
			//파일이름 
			String profile = uuid+upload.getOriginalFilename();
			System.out.println("UsersController 안의 join()의 파일이름"+profile);
			
			//실제 파일 객체 생성 
			File uploadFile = new File(path+profile);
			System.out.println("UsersController 안의 join()의 실제 파일 객체"+uploadFile);
			
			//파일 업로드 //transferTo: 파일 복사
			upload.transferTo(uploadFile);
			FileInputStream fis = new FileInputStream(uploadFile);
			
			//백업 폴더에 파일 업로드 
			File backup = new File("c:/backup/"+profile);
			
			//파일 출력 
			FileOutputStream fos =  new FileOutputStream(backup);
			byte[] data = new byte[4096];
		
			int size = -1;//어디까지 들어갔는 지 아는 size
			//파일 읽기 
			while((size = fis.read(data))!=-1) {
				fos.write(data, 0, size);
			}//while end
			user.setProfile(profile);
			
			usersService.join(user);
			System.out.println("파일 복사 성공");
			return "redirect:/index";
		}//if~else end
		

	}//join() end
	
	//회원가입 폼 
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinForm() {
		System.out.println("가입폼");
	}
	//로그아웃
	@RequestMapping(value="/session", method=RequestMethod.DELETE)
	public String logout(HttpSession session, @RequestHeader String referer) {
		session.invalidate();//로그아웃ㄴ
		return "redirect:"+referer;
	}
	
	//로그인
	@RequestMapping(value="/session", method=RequestMethod.POST)
	public String login(HttpSession session, User userInfo) {
		System.out.println("index");
		System.out.println("로그인 아이디"+userInfo.getId());
		System.out.println("로그인 비밀번호"+userInfo.getPassword());
		System.out.println("profile:"+userInfo.getProfile());
		session.setAttribute("logUser", usersService.login(userInfo));
		return "redirect:/index";
	}
}
