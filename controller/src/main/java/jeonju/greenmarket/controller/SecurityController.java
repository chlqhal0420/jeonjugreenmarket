package jeonju.greenmarket.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SecurityController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/security/login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="/user/sign_up.do", method=RequestMethod.GET)
	public String join() {
		return "user/sign_up";
	}
	
	@RequestMapping(value="/user/joinOk.do", method=RequestMethod.POST)
	public String joinOk(String userid, String password, String name
						, String email, String phone) {
		
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		
		Map<String,Object> vo = new HashMap<String,Object>();
		vo.put("userid", userid);
		vo.put("password",epwe.encode(password));
		vo.put("name", name);
		vo.put("email", email);
		vo.put("phone", phone);
		
		int result = sqlSession.insert("jeonju.greenmarket.mapper.userMapper.insert",vo);
		return "redirect:/user/sign_up_success.do";
		
	}
	
	@RequestMapping(value="/newPasswordOK.do", method=RequestMethod.POST)
	public String newPassword(String password, HttpSession session) {
		
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		
		Map<String,Object> vo = new HashMap<String,Object>();
		 Object userId = session.getAttribute("userid");
		vo.put("userid", userId);
		vo.put("password",epwe.encode(password));
		
		int result = sqlSession.update("jeonju.greenmarket.mapper.userMapper.updatePassword",vo);
		return "redirect:/user/login.do";
		
	}
	
}
