package com.mhd.exam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mhd.exam.util.SqlSessionUtil;
import com.mhd.exam.vo.Phone;

public class PhonebookDAO {
	
	//폰북 리스트 갖고 옴
	public static List<Phone> selectList(){
		List<Phone> phonebook = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			phonebook=session.selectList("phonebook.selectList");
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}//try~catch()~finally
		
		return phonebook;
	}
	//전화번호 입력 
	public static int insertPhone(Phone phone) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result=session.insert("phonebook.insertPhone", phone);
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}//try~catch()~finally
		return result;
	}
	//전화번호 삭제
	public static int deletePhone(int no) {
		int result=0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result=session.delete("phonebook.deletePhone", no);
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}//try~catch()~finally
		return result;
	}
	//전화번호 가져오기 
	public static Phone selectPhone(int no) {
		Phone phone = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			phone=session.selectOne("phonebook.selectPhone", no);
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}//try~catch()~finally
		return phone;
	}
	
	//전화번호 수정
	public static int updatePhone(Phone phone) {
		int result=0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result=session.update("phonebook.updatePhone", phone);
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}//try~catch()~finally
		
		return result;
	}
	
	
}
