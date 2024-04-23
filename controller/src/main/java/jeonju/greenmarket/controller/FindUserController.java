package jeonju.greenmarket.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.FindUserService;
import jeonju.greenmarket.vo.UserVO;

@Controller
public class FindUserController {
	/*
	 * @Autowired private FindUserService findUserService; // FindService를 주입받습니다.
	 * 
	 * @RequestMapping(value = "/find_user")
	 * 
	 * @ResponseBody public String findUser(UserVO vo) { boolean isUserExists =
	 * findUserService.verifyUser(vo);
	 * 
	 * return "response"; }
	 */

	/* 이름, 휴대폰 번호와 일치하는 회원이 있는지 조회하는 코드 */
	@Autowired
	private FindUserService findUserService;

	@RequestMapping(value = "/find_user")
	@ResponseBody
	public ResponseEntity<?> findUser(UserVO vo) {
		boolean isUserExists = findUserService.verifyUser(vo);

		// Map을 사용하여 JSON 형태로 변환될 수 있게 데이터를 구성
		Map<String, Object> response = new HashMap<>();
		response.put("userExists", isUserExists);

		// ResponseEntity를 사용하여 상태 코드와 함께 응답
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "user/find_id", method = RequestMethod.POST)
	public String findId(UserVO vo, Model model) {
		UserVO userVO = findUserService.selectOne(vo);
		System.out.println(userVO.getUserid());
		model.addAttribute("userVO", userVO);
		return "user/find_success_id";
	}
	
	@RequestMapping(value = "user/find_id.do", method = RequestMethod.GET)
	public String findId() {
		return "user/find_id";
	}

	@RequestMapping(value = "user/find_success_id.do")
	public String find_success_id() {
		return "user/find_success_id";
	}

	@RequestMapping(value = "user/find_password.do",method = RequestMethod.GET)
	public String findPassword() {
		return "user/find_password";
	}

	
	/* 아이디, 휴대폰 번호와 일치하는 회원이 있는지 조회하는 코드 */

	@RequestMapping(value = "/find_user_pass")
	@ResponseBody
	public ResponseEntity<?> findUserPass(UserVO vo) {
		boolean isUserExists = findUserService.verifyUserPass(vo);      
		Map<String, Object> response = new HashMap<>();
		response.put("userExists", isUserExists);
		return ResponseEntity.ok(response);
	}
	
	@RequestMapping(value = "user/find_passwordOK", method = RequestMethod.POST)
	public String findPass(UserVO vo, HttpSession session) {
		session.setAttribute("userid",vo.getUserid());
		return "redirect:/new_password.do";
	}
	
	@RequestMapping(value = "/new_password.do", method = RequestMethod.GET)
	public String newPassword() {
		return "user/new_password";
	}

}
