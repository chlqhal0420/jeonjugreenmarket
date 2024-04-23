
package jeonju.greenmarket.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "user/login.do")
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "user/sign_up_terms.do", method = RequestMethod.GET)
	public String signUpTerms() {
		return "user/sign_up_terms";
	}

	@RequestMapping(value = "user/sign_up_terms.do", method = RequestMethod.POST)
	public String signUpTerms2() {
		return "redirect: sign_up.do";
	}

	/*
	 * @RequestMapping(value="user/sign_up.do", method=RequestMethod.GET ) public
	 * String signUp() { return "user/sign_up"; }
	 */

	/*
	 * @RequestMapping(value="user/sign_up.do",method=RequestMethod.POST) public
	 * String signUp(UserVO vo) { int result=userService.insert(vo);
	 * System.out.println("result::"+result); return "redirect: sign_up_success.do";
	 * }
	 */

	@RequestMapping(value = "user/sign_up_success.do")
	public String signUpSuccess() {
		return "user/sign_up_success"; 
	}

	@RequestMapping(value = "user/original.do")
	public String original() {
		return "user/original";
	}

	@CrossOrigin(origins = "*") // 모든 도메인에서의 요청을 허용
	@GetMapping("/check-username")
	@ResponseBody
	public Map<String, Boolean> checkUsername(@RequestParam("userid") String userid) {
		boolean isAvailable = userService.isUserIdAvailable(userid); // 사용자 서비스를 통해 아이디 중복 확인
		Map<String, Boolean> response = new HashMap<>();
		response.put("isUserIdAvailable", isAvailable);
		return response;
	}

}
