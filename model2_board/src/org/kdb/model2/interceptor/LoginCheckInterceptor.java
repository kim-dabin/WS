package org.kdb.model2.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kdb.model2.vo.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		//super.postHandle(request, response, handler, modelAndView);
		System.out.println("컨트롤러 수행 후");
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
	//	return super.preHandle(request, response, handler);
		System.out.println("컨트롤러 수행전");
		//웹브라우저에 접근한 유저 정보 저장 하기 위한 session 
		HttpSession session = request.getSession();
		//세션에 저장된 로그인 객체 생성 
		User logUser = (User)session.getAttribute("logUser");
		if(logUser==null) {//로그인 객체가 없음
			System.out.println("로그인 안됨");
			//유저를 로그인페이지로 보내라고 응답 
			response.sendRedirect("/index");
			return false;
		}// if end
		System.out.println("로그인");
		
		return true;
		
	}//preHandle end
		
}//LoginCheckInterceptor end
