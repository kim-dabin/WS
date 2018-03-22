<%@page import="com.mhd.bband.dao.BBanderDAO"%>
<%@page import="com.mhd.bband.vo.BBander"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//BBander 객체 생성
	BBander bbander = new BBander();
	//파일 시스템 디렉토리
	String rootPath	= request.getServletContext().getRealPath("/");
	//실제 저장될 폴더 경로 
	String uploadPath= rootPath+"profile"+File.separator;
	//이름 정책
	FileRenamePolicy frp = new DefaultFileRenamePolicy();
	//MultipartRequest 객체 생성
	MultipartRequest mr = new MultipartRequest(request, uploadPath, 1024*1024*100, "UTF-8", frp);
	
	/*파라미터 받아옴*/
	String id = mr.getParameter("id");
	String nickname = mr.getParameter("nickname");
	String password = mr.getParameter("password");
	String profile = mr.getFilesystemName("profile");
	
	/* vo에 받은 데이터 넣어줌*/
	bbander.setId(id);
	bbander.setNickname(nickname);
	bbander.setPassword(password);
	bbander.setProfile(profile);
	
	int result = BBanderDAO.insertBBander(bbander);
	if(result>0){ //회원가입 성공
		session.setAttribute("msg", "회원가입이 잘되었습니다. 로그인하세요");
		response.sendRedirect("index.jsp");
	}
%>