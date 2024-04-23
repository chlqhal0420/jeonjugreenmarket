package jeonju.greenmarket.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler{
	
	@Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
    
        System.out.println("로그인실패");
        // 로그인 실패 메시지를 URL 쿼리 파라미터로 추가
        String loginFailureUrl = request.getContextPath() + "/security/login.do?error=true";
        response.sendRedirect(loginFailureUrl);
    }

}
