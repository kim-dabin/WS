package com.mhd.exam.vo;

import java.sql.Date;

public class Phone {
	private int no; //주키
	private String name, phone, gender, profile, phoneFormat;// 이름, 핸드폰 번호, 성
	private Date birthDate;//생일
	public Phone() {}
	
	
	public Phone(String name, String phone, String gender, String profile, Date birthDate) {
		super();
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.profile = profile;
		this.birthDate = birthDate;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
		
		
		
		
	}

	public String getPhoneFormat() {
		String phoneFirstNum = phone.substring(0,3);	//폰번호 첫 앞자리
		String phoneSecondNum = null;//두번째 폰번호
		String phonethirdNum = null;//세번째 폰번호
		if(phone.length()>10){ 
			phoneSecondNum =phone.substring(3,7);
			phonethirdNum=phone.substring(7,phone.length());
		}else {
			phoneSecondNum=phone.substring(3,6);
			phonethirdNum=phone.substring(6,phone.length());
		}
		phoneFormat = phoneFirstNum+"-"+phoneSecondNum+"-"+phonethirdNum;
		return phoneFormat;
	}


//	public void setPhoneFormat(String phone) {
//	
//		String phoneFirstNum = phone.substring(0,3);	//폰번호 첫 앞자리
//		String phoneSecondNum = null;//두번째 폰번호
//		String phonethirdNum = null;//세번째 폰번호
//		if(phone.length()>10){ 
//			phoneSecondNum =phone.substring(3,7);
//			phonethirdNum=phone.substring(7,phone.length());
//		}else {
//			phoneSecondNum=phone.substring(3,6);
//			phonethirdNum=phone.substring(6,phone.length()+1);
//		}
//		phoneFormat = phoneFirstNum+"-"+phoneSecondNum+"-"+phonethirdNum;
//		
//		
//	}


	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

}
