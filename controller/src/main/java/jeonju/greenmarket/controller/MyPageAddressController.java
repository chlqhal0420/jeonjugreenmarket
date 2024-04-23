package jeonju.greenmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.MyPageService;
import jeonju.greenmarket.service.UserService;
import jeonju.greenmarket.vo.AddressVO;
import jeonju.greenmarket.vo.SecurityUserVO;

@RequestMapping(value="/mypage")
@Controller
public class MyPageAddressController {

	@Autowired
	UserService userService;
	@Autowired
	MyPageService mypageService;
	
	
	//배송지목록 조회
	@RequestMapping(value="/mypage_address.do")
	public String myPageAddress(Model model,Authentication auth){
		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();
		List <AddressVO> addr = mypageService.addrList(login.getCreatedBy());
		model.addAttribute("addr",addr);
		
		return "mypage/mypage_addr";
	}
	
	//배송지 수정 클릭 시, 초기 값을 불러오기
	@RequestMapping(value="/select_now_address.do")
	@ResponseBody 
    public AddressVO selectNowAddr(@RequestParam("addrNo") int addrNo) {
        return mypageService.selectAddressByAddrNo(addrNo);
    }
	
	//배송지 수정
	@RequestMapping(value="/modify_address.do", method=RequestMethod.POST)
	@ResponseBody 
	public int modifyAddress(@ModelAttribute AddressVO vo,Authentication auth) {
		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();
		vo.setCreatedBy(login.getCreatedBy());
	    int isUpdated = mypageService.modifyAddress(vo);
	    return isUpdated;
	}
	
	//배송지 추가
	@RequestMapping(value="/add_address.do", method=RequestMethod.POST)
	@ResponseBody 
	public int addNewAddr(@ModelAttribute AddressVO vo,Authentication auth){
		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();
		vo.setCreatedBy(login.getCreatedBy());
				int insertAdress= mypageService.insertAddr(vo);
		return insertAdress;
	}
	//배송지삭제
	@RequestMapping(value="/deleteAddrNo.do")
	@ResponseBody 
    public int deleteAddrNo(@RequestParam("addrNo") int addrNo) {
        return mypageService.deleteAddressByAddrNo(addrNo);
    }
}
