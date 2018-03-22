package com.mhd.bband.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		//arg0을 HttpServerRequest로 형변환
		HttpServletRequest request = (HttpServletRequest)arg0;
		//세션을 얻어옴
		HttpSession session = request.getSession();
		//로그인 멤버(logMember)를 얻어옴
		Object obj = session.getAttribute("logMember");
		//로그인 멤버가 null 일때, 로그인이 안됨
		if(obj==null) {
			//객체가 없다고 응답 보냄
			HttpServletResponse response = (HttpServletResponse) arg1;
			//index.jsp로 보내버림
			response.sendRedirect("index.jsp");
		}else {//로그인 멤버가 있음
			arg2.doFilter(arg0, arg1);
		}
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
