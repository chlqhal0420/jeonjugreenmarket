package jeonju.greenmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.AdminOrderDAO;
import jeonju.greenmarket.vo.OrderVO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService{

	@Autowired
	AdminOrderDAO adminOrderDAO;
	
	// 취소한 상품 내역 조회
	@Override
	public List<OrderVO> cancel(OrderVO vo) {
		return adminOrderDAO.cancel(vo);
	}

	// 고객요청 취소건 개수 표시	
	@Override
	public int countCancel() {
		return adminOrderDAO.countCancel();
	}

}
