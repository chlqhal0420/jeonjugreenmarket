package jeonju.greenmarket.service;

import java.util.List;

import jeonju.greenmarket.vo.OrderVO;


public interface AdminOrderService {
	
	// 취소한 상품 내역 조회
	List<OrderVO> cancel(OrderVO vo);
		
	// 고객요청 취소건 개수 표시
	int countCancel();
	

}
