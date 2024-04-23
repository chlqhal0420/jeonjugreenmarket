package jeonju.greenmarket.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jeonju.greenmarket.service.BasketOrderService;
import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;

@Controller
public class BasketOrderController {
	
	@Autowired
	BasketOrderService basketOrderService;
	
	
	// 장바구니 주문 정보 DB 저장
	 @RequestMapping(value="orderInsert1.do", method=RequestMethod.POST)
	 public void orderInsert1(OrderVO vo, HttpServletResponse res) throws IOException {
	    	
	    	int orderInsert1 = basketOrderService.orderInsert1(vo);
	    	System.out.println("주문: "+orderInsert1);
	    	System.out.println("OrderVO 정보: " + vo.toString());
	    	
			  res.setContentType("text/html; charset=utf-8");
			  res.setCharacterEncoding("UTF-8");
			  
			  if (orderInsert1 > 0) { res.getWriter().
			  append("<script>location.href='itemList.do'</script>"
			  ); } else { res.getWriter().
			  append("<script>alert('주문 및 결제가 완료되지 않았습니다.');location.href='itemList.do'</script>"
			  ); } res.getWriter().flush();
	 }
	 
	 
	 	// 장바구니 주문상품상세 정보 DB저장 (여러개 상품을 저장해야함)
	    @RequestMapping(value="orderDetailInsert1.do", method=RequestMethod.POST)
	    public String  orderDetailInsert1(OrderDetailVO vo) {
	    	
	    	int orderDetailInsert1 = basketOrderService.orderDetailInsert1(vo);
	    	System.out.println("주문상품상세: "+orderDetailInsert1);
	    	
			return "item/itemList";
	    } 
	 
}
