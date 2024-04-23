package jeonju.greenmarket.service;

import java.util.List;
import java.util.Map;

import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;

public interface OrderService {
	
	// 주문 정보 DB 저장
	int orderInsert(OrderVO vo);
	
	// 주문상품상세 정보 DB 저장
	int orderDetailInsert(OrderDetailVO vo);
	
	// 주문페이지에서 장바구니 목록 불러오기
	Map<String, List> SelectBasketListWithIsChecked(BasketVO basketVO);
	
	// 고객요청취소
	int cancelOrder(String orderNo);
}
