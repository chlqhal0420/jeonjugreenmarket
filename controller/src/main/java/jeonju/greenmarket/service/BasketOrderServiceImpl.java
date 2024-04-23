package jeonju.greenmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.BasketOrderDAO;
import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;

@Service
public class BasketOrderServiceImpl implements BasketOrderService{
	
	@Autowired
	BasketOrderDAO basketOrderDAO;
	
		// 주문 상품 DB 저장
		@Override
		public int orderInsert1(OrderVO vo) {
			return basketOrderDAO.orderInsert1(vo);
		}

		// 주문상품상세 정보 DB 저장
		@Override
		public int orderDetailInsert1(OrderDetailVO vo) {
			return basketOrderDAO.orderDetailInsert1(vo);
		}
}
