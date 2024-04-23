package jeonju.greenmarket.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jeonju.greenmarket.vo.SecurityUserVO;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		SecurityUserVO loginUser = (SecurityUserVO)authentication.getPrincipal();
		
		/* 로그인한 회원의 id 확인
		 * System.out.println(loginUser.getUserid()); */
		
		
	//로그인 성공!!!
		response.sendRedirect(request.getContextPath());
	}
}
