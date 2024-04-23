package jeonju.greenmarket.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.BasketService;
import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.SecurityUserVO;

@Controller
public class BasketController {

	@Autowired
	BasketService basketService;
	
	//장바구니 페이지 보기
	@RequestMapping(value = "basket/basket.do", method = RequestMethod.GET)
	public String Basket(Model model,Authentication auth) {
		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();
		BasketVO basketVO = new BasketVO();
		basketVO.setCreatedBy(login.getCreatedBy());
		Map<String, List> basketMap= basketService.myBasketList(basketVO);
		model.addAttribute("basketMap",basketMap);
		return "basket/basket";
	}

	//장바구니에 insert
	@RequestMapping(value="/add_basket.do", method=RequestMethod.POST)
	@ResponseBody 
	public String addBasket(@ModelAttribute BasketVO vo, Authentication auth, HttpServletResponse response) {
	    if (auth == null || auth.getPrincipal() == null) {
	        return "not_logged_in"; 
	    }

	    SecurityUserVO login = (SecurityUserVO)auth.getPrincipal(); // This is safe now
	    vo.setCreatedBy(login.getCreatedBy());

	    boolean isProduct = basketService.isProductInBasket(vo);

	    if (isProduct == true) {
	        return "already_existed";
	    } else {
	        basketService.insertProductIntoBasket(vo);
	        return "add_success";
	    }
	}
	
	//장바구니 상품수량 수정
	@RequestMapping(value="/basket/update_item_cnt.do", method=RequestMethod.POST)
	@ResponseBody 
	public int updateItemCnt(@ModelAttribute BasketVO vo) {
		int updateItemQuantity = basketService.updateItemCnt(vo);
		return updateItemQuantity;
	}
	
	//장바구니 상품삭제
	@RequestMapping(value="/basket/delete_item_Basket.do", method=RequestMethod.POST)
	@ResponseBody 
	public int deleteItemInBasket(@ModelAttribute BasketVO vo) {
		int deleteItemInBasket = basketService.deleteItemInBasket(vo);
		return deleteItemInBasket;
	}
	
	//장바구니 상품 체크여부 변경
	@RequestMapping(value="/basket/update_basket_item_checked.do", method=RequestMethod.POST)
	@ResponseBody 
	public int updateIschecked(@ModelAttribute BasketVO vo) {
		int updateIschecked = basketService.updateIschecked(vo);
		return updateIschecked;
	}
}
