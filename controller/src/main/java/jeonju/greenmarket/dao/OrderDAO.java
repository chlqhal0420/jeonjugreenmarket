package jeonju.greenmarket.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.ItemVO;
import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;


@Repository
public class OrderDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	 // 주문 정보 DB저장
	public int orderInsert(OrderVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.orderMapper.orderInsert", vo);
	}
	
	// 주문상품상세 정보 DB저장
	public int orderDetailInsert(OrderDetailVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.orderMapper.orderDetailInsert", vo);
	}
	
	// 장바구니 -> 주문 페이지 
	public List<BasketVO> SelectBasketListWithIsChecked(BasketVO basketVO) throws DataAccessException {
		List<BasketVO> basketList=(List)sqlSession.selectList("jeonju.greenmarket.mapper.orderMapper.SelectBasketListWithIsChecked", basketVO);
		return basketList;
	}
	
	
	public List<ItemVO> selectItemList(List<BasketVO> basketList ) throws DataAccessException{
		List<ItemVO> myItemList;
		myItemList = sqlSession.selectList("jeonju.greenmarket.mapper.orderMapper.selectItemList", basketList);
		return 	myItemList;	
	}
	
	// 고객요청취소
	public int cancelOrder(String orderNo) {
		return sqlSession.update("jeonju.greenmarket.mapper.orderMapper.cancelOrder", orderNo);
	}
}
