<%@page import="com.mhd.exam.vo.Phone"%>
<%@page import="com.mhd.exam.dao.PhonebookDAO"%>
<%@page import="org.mhd.util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//톰캣의 파일 시스템 디렉토리
String rootPath = request.getServletContext().getRealPath("/");// "/"의 경로 받아옴
//out.print(rootPath);
//실제 저장될 폴더의 경로
String uploadPath= rootPath+"profile"+File.separator;
//이름 정책
FileRenamePolicy frp = new DefaultFileRenamePolicy();
//multipart/form-data는 request객체가 아니라 MultipartRequest를 이용 //요청객체,(저장될) 파일 경로, 파일크기, 인코딩, 이름정책객체
MultipartRequest mr = new MultipartRequest(request, uploadPath, 1024*1024*100,"UTF-8", frp);//100mega

/*파라미터 받음*/
 String name = mr.getParameter("name");
 String firstPhoneNum = mr.getParameter("firstPhoneNum"); 
 String secondPhoneNum = mr.getParameter("secondPhoneNum"); 
 String thirdPhoneNum = mr.getParameter("thirdPhoneNum"); 
 //phone번호 합치기
 String phoneNum =firstPhoneNum+secondPhoneNum+thirdPhoneNum;
 //파일 이름 
 String profile = mr.getFilesystemName("profile");
//프로필사진은 좀 더 작게 
//ResizeImageUtil 사용
//원본파일의 경로+ 파일이름
//String original = uploadPath+profile;
//저장할 파일의 경로+ 파일이름
//String resize= rootPath+"profile"+File.separator+profile;
//ResizeImageUtil.resize(original, resize, 200);

//생년월일 받아오기
String year= mr.getParameter("year");
String month= mr.getParameter("month");
String date = mr.getParameter("date");
Date birthDate = Date.valueOf(year+"-"+month+"-"+date);//생일 합친뒤, DATE형으로 변환

//성별 
String gender = mr.getParameter("gender");
Phone phoneInfo = new Phone(name,phoneNum,gender,profile,birthDate);//받은 정보를 VO에 
int result= PhonebookDAO.insertPhone(phoneInfo);//DAO insert에 연결

response.sendRedirect("phonebook.jsp");
 

%>