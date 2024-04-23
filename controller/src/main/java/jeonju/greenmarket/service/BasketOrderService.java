package jeonju.greenmarket.service;

import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;

public interface BasketOrderService {
	
	
		// 주문 정보 DB 저장
		int orderInsert1(OrderVO vo);
		
		// 주문상품상세 정보 DB 저장
		int orderDetailInsert1(OrderDetailVO vo);
}
