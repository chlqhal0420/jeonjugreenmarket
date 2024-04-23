package jeonju.greenmarket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;

@Repository
public class BasketOrderDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	// 장바구니 주문 정보 서버저장
	public int orderInsert1(OrderVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.basketOrderMapper.orderInsert1", vo);
	}
	
	// 장바구니 주문상품상세 정보 DB저장
	public int orderDetailInsert1(OrderDetailVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.basketOrderMapper.orderDetailInsert1", vo);
	}
	
}
