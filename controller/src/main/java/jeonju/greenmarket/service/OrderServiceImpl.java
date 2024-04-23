package jeonju.greenmarket.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.OrderDAO;
import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.ItemVO;
import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDAO oderDAO;

	
	// 주문 상품 DB 저장
	@Override
	public int orderInsert(OrderVO vo) {
		return oderDAO.orderInsert(vo);
	}

	// 주문상품상세 정보 DB 저장
	@Override
	public int orderDetailInsert(OrderDetailVO vo) {
		return oderDAO.orderDetailInsert(vo);
	}
	
	//주문페이지에서 장바구니 목록 불러오기 
	@Override
	public Map<String, List> SelectBasketListWithIsChecked(BasketVO basketVO) {
		Map<String, List> basketMap = new HashMap<String, List>();
		List<BasketVO> myBasketList = oderDAO.SelectBasketListWithIsChecked(basketVO); //장바구니페이지에 표시할 장바구니 정보
		if(myBasketList.size()==0) { //장바구니에 아무것도 없으면 null 리턴
			return null;
		}
		List<ItemVO> myItemList = oderDAO.selectItemList(myBasketList); //상품정보 조회
		basketMap.put("myBasketList", myBasketList); //장바구니정보
		basketMap.put("myItemList", myItemList);// 상품정보를 basketMap 에 저장하여 반환
		return basketMap;
	}

	// 고객요청취소
	@Override
	public int cancelOrder(String orderNo) {
		return oderDAO.cancelOrder(orderNo);
	}


}
