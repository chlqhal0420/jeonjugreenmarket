package jeonju.greenmarket.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jeonju.greenmarket.service.BasketService;
import jeonju.greenmarket.service.MyPageService;
import jeonju.greenmarket.service.UserService;
import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.LikeVO;
import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.SecurityUserVO;
import jeonju.greenmarket.vo.UserVO;

@RequestMapping(value="/mypage")
@Controller
public class MyPageController {
	
	@Autowired
	MyPageService mypageService;
	
	//주문내역 목록 조회
	   @RequestMapping(value="/mypage_order.do",method=RequestMethod.GET)
	   public String myPageOrder(Model model, Authentication auth){
	      SecurityUserVO login =(SecurityUserVO)auth.getPrincipal(); 
	      int createdBy=login.getCreatedBy();
	      List<OrderDetailVO> myPageOrder = mypageService.orderDetail(createdBy);
	      model.addAttribute("myPageOrder",myPageOrder);
	      System.out.println("myPageOrder:"+myPageOrder);
	      return "mypage/mypage_order";
	   }
	 //찜 목록 가져오기
		@RequestMapping(value="/mypage_dibs.do",method=RequestMethod.GET)
		public String myPageDibs(Model model, Authentication auth){
			SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();	
			List<LikeVO> likedItem = mypageService.LikedItemList(login.getCreatedBy()); 
			model.addAttribute("likedItem",likedItem);		
			return "mypage/mypage_dibs";
		}
		
		//찜 삭제
		@RequestMapping(value="/deletewishNo.do")
		@ResponseBody 
	    public int deletewishNo(@RequestParam("wishNo") int wishNo) {
	        return mypageService.deleteLikeByWishNo(wishNo);
	    }
		

		//찜 상품 장바구니에 추가 
		@Autowired
		BasketService basketService;
		@RequestMapping(value="/add_liked_item_to_basket.do")
		@ResponseBody 
	    public String addLikedItemToBasket(@ModelAttribute BasketVO vo, Authentication auth, HttpServletResponse response) {
			SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();
			vo.setCreatedBy(login.getCreatedBy());
		   boolean isProduct = basketService.isProductInBasket(vo);
		   
		   if(isProduct==true) {
			   return "already_existed";
		   }else {
			   basketService.insertProductIntoBasket(vo);
			   return "add_success";
		   }	
		}
		  
	
	
	@RequestMapping(value="/mypage_cancle_order.do")
	public String myPageCancleOrder(){
		return "mypage/mypage_cancle_order";
	}
	
	
	
	@RequestMapping(value="/mypage_original.do")
	public String myPageOriginal(){
		return "mypage/mypage_original";
	}
	
	
	@RequestMapping(value="/mypage_review.do")
	public String myPageReview(){
		return "mypage/mypage_review";
	}
	
	@RequestMapping(value="/mypage_inquery_product.do")
	public String myPageInqueryProduct(){
		return "mypage/mypage_inquery_product";
	}
	
	@RequestMapping(value="/mypage_inquery.do")
	public String myPageInquery(){
		System.out.println("test");
		return "mypage/mypage_inquery";
	}
	
	@RequestMapping(value="/mypage_order.do")
	public String myPageOrder(){
		return "mypage/mypage_order";
	}
	
	@RequestMapping(value="/mypage_info.do")
	public String myPageInfo(){
		return "mypage/mypage_info";
	}
	
	@Autowired
	UserService userService;
	//회원정보 수정 페이지로 넘어가기 이전 비밀번호 확인 후 수정화면으로 전환
	@RequestMapping(value="/mypage_modify.do",method=RequestMethod.GET)
	public String myPageModify(Authentication auth, Model model){
		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal(); 
		int createdBy=login.getCreatedBy();
		UserVO userVO = userService.selectOneWithCreatedBy(createdBy);
		model.addAttribute("userVO", userVO);
		return "mypage/mypage_modify";
	}
	
	
	//회원정보 수정을 위해 비밀번호를 확인
	@RequestMapping(value="/mypage_confirmPass.do",method = RequestMethod.POST)
		public String confirmPass(UserVO vo, Authentication auth, RedirectAttributes redirectAttributes){ 
		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal(); 
		
		Map<String,Object> user = userService.findById(login.getUserid()); 
		if(user == null) { //아이디 일치 없음 
		}
		BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
		boolean result = bcpe.matches(vo.getPassword(), user.get("password").toString()); 

		//(사용자가 입력한 패스워드, db에서 가져온 패스워드)
		//두개의 값이 암호된 것이 똑같은지 비교 
		//일치하는 것이 있으면 true :: 비번일치
		//false 이면 :: 비번 불일치 
		if(result) {
			//비밀번호 일치
			return "redirect:/mypage/mypage_modify.do";
		}else { 
			//비밀번호 	불일치 : 화면으로 메세지를 보내서 alert을 띄움
			 redirectAttributes.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "redirect:/mypage/mypage_info.do";
		}
		
		
	}
	
	@Autowired
	SqlSession sqlSession;
	//회원정보 수정처리
	@RequestMapping(value="/mypage_modifyOk.do",method = RequestMethod.POST)
	public String myPageModify(String userid, String password, String name
			, String email, String phone){
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		UserVO vo = new UserVO();
		 int result = sqlSession.update("jeonju.greenmarket.mapper.userMapper.updateUser",vo);
		return "redirect:/mypage/mypage_info.do";
	}
	
	//회원정보 수정페이지에서 현재 비밀번호 확인
	@ResponseBody
	@PostMapping("/check_nowPassword")
	public boolean checkNowPassword(@RequestBody UserVO vo, Authentication auth) {
	    SecurityUserVO login = (SecurityUserVO)auth.getPrincipal(); 
	    Map<String, Object> user = userService.findById(login.getUserid()); 

	    if(user == null) {  
	        return false;
	    }
	    if(vo.getPassword()!=null) {
	    BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
	    boolean result = bcpe.matches(vo.getPassword(), user.get("password").toString()); 
	    return result;
	    }else {
	    	return false;
	    }
	}
	
	//회원탈퇴
	@RequestMapping(value="/deleteUser.do")
	@ResponseBody 
    public int deleteUser(@RequestParam("createdBy") int createdBy) {
        return userService.deleteUser(createdBy);
    }
	
	
	
}
