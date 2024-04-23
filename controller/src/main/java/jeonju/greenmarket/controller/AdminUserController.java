package jeonju.greenmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.AdminUserService;
import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.UserVO;
@RequestMapping(value="/admin")
@Controller
public class AdminUserController {

	@Autowired
	AdminUserService adminuserService;

	// 회원목록 조회 및 검색 기능
	@RequestMapping(value = "user.do", method = RequestMethod.GET)
	public String list(Model model, SearchVO searchVO) {

		List<UserVO> list = adminuserService.list(searchVO);
		model.addAttribute("list", list);

		return "admin/user/user";
	}


	// 회원 상태 변경
	@ResponseBody
	// @ResponseBody 어노테이션을 사용하여 해당 메서드가 HTTP 응답의 본문에 직접 데이터를 쓰도록 지정합니다.
	// 클라이언트로부터 POST 요청을 받으며, 요청 본문에는 JSON 형식의 UserVO 객체가 포함됩니다.
	@RequestMapping(value = "updateStatus.do", method = RequestMethod.POST)
	public String updateStatus(@RequestBody UserVO user) {
			// adminuserService를 사용하여 회원 상태를 업데이트합니다.
			adminuserService.updateStatus(user);
			return null;
			
	}
	
	// 관리자 페이지 회원상세보기
	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public String view(int createdBy, Model model) {
		UserVO vo = adminuserService.selectOneByCreatedBy(createdBy);
		
		model.addAttribute("vo", vo);
		
		return "admin/user/view";
	}
	
	// 수정할 해당 회원 정보 불러오기
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public String mofify(int createdBy, Model model) {
		UserVO vo = adminuserService.selectOneByCreatedBy(createdBy);
		
		model.addAttribute("vo", vo);
		return "admin/user/modify";
	}
	
	//회원 정보수정
	@RequestMapping(value="modify.do", method = RequestMethod.POST)
	public String modify(UserVO vo) {
		
		int result = adminuserService.updateUser(vo);
		System.out.println("result: "+result);
		return "redirect:user.do";
		/* return "redirect:user.do?createdBy="+vo.getCreatedBy(); */
		
	}
	
	
}
