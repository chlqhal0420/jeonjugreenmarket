package jeonju.greenmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jeonju.greenmarket.service.ItemService;
import jeonju.greenmarket.service.LikeService;
import jeonju.greenmarket.vo.ItemVO;
import jeonju.greenmarket.vo.LikeVO;
import jeonju.greenmarket.vo.SecurityUserVO;

@Controller
public class ItemController {
	@Autowired
	ItemService itemService;
	
	
	// 상품 목록 조회 (채소)
	@RequestMapping(value="itemList.do", method=RequestMethod.GET)
	public String itemList(Model model, ItemVO vo){
		
		List<ItemVO> itemList = itemService.itemList(vo);
		model.addAttribute("itemList",itemList);
		
		System.out.println("채소조회: "+itemList);
		
		return "item/itemList";
	}
	
	// 상품 목록 조회 (곡류)
	@RequestMapping(value="itemList1.do", method=RequestMethod.GET)
	public String itemList1(Model model, ItemVO vo){
		
		List<ItemVO> itemList1 = itemService.itemList1(vo);
		model.addAttribute("itemList1",itemList1);
		
		System.out.println("곡류조회: "+itemList1);
		
		return "item/itemList1";
	}
	
	
	
	// 상품 상세보기
	@Autowired
	LikeService likeService;
	// 상품 상세보기
		@RequestMapping(value="itemDetail.do", method=RequestMethod.GET)
		public String itemDetail(Model model, String itemNo) {
			// 상품 상세 정보 조회
			List<ItemVO> itemDetail = itemService.itemDetail(itemNo);
			model.addAttribute("itemDetail", itemDetail);

			// 로그인 상태 확인
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			boolean isLiked = false; // 찜 여부 초기값 false (로그인 하지 않은 상태)

			// 인증된 사용자인 경우 찜 여부 확인
			if (auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof SecurityUserVO) {
		        int createdBy = ((SecurityUserVO)auth.getPrincipal()).getCreatedBy();  // 로그인한 사용자 회원 번호
		        LikeVO vo = new LikeVO();
		        vo.setCreatedBy(createdBy);
		        vo.setItemNo(itemNo);
		        isLiked = likeService.checkLiked(vo);  // 찜 여부 확인
		    }
			// 찜 여부를 모델에 추가
			model.addAttribute("isLiked", isLiked);			
			return "item/itemDetail";
		}
}
