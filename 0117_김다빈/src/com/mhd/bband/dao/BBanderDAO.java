package com.mhd.bband.dao;

import org.apache.ibatis.session.SqlSession;

import com.mhd.bband.util.SqlSessionUtil;
import com.mhd.bband.vo.BBander;

public class BBanderDAO {
	
	//회원가입
	public static int insertBBander(BBander bbander) {
		int result=0;//insert 결과
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.insert("bbanders.insertBBander", bbander);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
	//아이디가 있는 지 체크 
	public static int selectCheckId (String id) {
		int result=0;//로그인 멤버 아이디 수
		SqlSession session= null;
		try {
			session = SqlSessionUtil.getSqlSession();
			result = session.selectOne("bbanders.selectCheckId", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();//세션 닫아줌
		}
		
		return result;
		
	}
	
	//로그인
	public static BBander selectLogMember(BBander logInfo) {
		BBander logInfoResult = null;// 로그인 멤버 정보
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSqlSession();
			logInfoResult = session.selectOne("bbanders.selectLogMember", logInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}//try~catch()~finally
		
		return logInfoResult;
	}
}
