package jeonju.greenmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jeonju.greenmarket.service.AdminOrderService;
import jeonju.greenmarket.vo.OrderVO;
@RequestMapping(value="/admin")
@Controller
public class AdminOrderController {
	
	@Autowired
	AdminOrderService adminOrderService;
	
	@RequestMapping(value="order.do")
	public String order() {
		return "admin/order/order";
	}
	
	
	@RequestMapping(value="orderModify.do")
	public String ordermodify() {
		return "admin/order/orderModify";
	}
		

	
	// 취소한 상품 내역 조회
	@RequestMapping(value="cancel.do", method=RequestMethod.GET)
	public String cancel(Model model, OrderVO vo) {
		
		List<OrderVO> cancel = adminOrderService.cancel(vo);
		model.addAttribute("cancel",cancel);
		
		return "admin/order/cancel";
	}
	
	
	// 고객요청 취소건 개수 표시	
	/*
	 * @RequestMapping(value="countCancel.do", method=RequestMethod.GET) public
	 * String countCancel(RedirectAttributes redirectAttributes) {
	 * 
	 * int countCancel = adminOrderService.countCancel();
	 * 
	 * if (countCancel > 0) { redirectAttributes.addAttribute("countCancel",
	 * countCancel); // 최신 카테고리의 기본키를 URL 파라미터로 추가 return "admin/index.do"; // 상품 등록
	 * 페이지로 리다이렉트 } else { // 카테고리 등록 실패 시 처리 return "admin/index.do"; // 실패 시 상품 등록
	 * 페이지로 리다이렉트 } }
	 */
	
}
