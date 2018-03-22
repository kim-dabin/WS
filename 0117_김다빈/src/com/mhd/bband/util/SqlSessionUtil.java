package com.mhd.bband.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	public static SqlSession getSqlSession() {
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader("com/mhd/bband/config/mybatis-config.xml"); //mybatis 설정 읽어옴
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
			session = factory.openSession(true); // 세션 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();//디버깅 처리
		}// try~catch
		return session;
	}
}
