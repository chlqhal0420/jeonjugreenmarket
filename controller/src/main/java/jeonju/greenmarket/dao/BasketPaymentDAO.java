package jeonju.greenmarket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.PaymentVO;
@Repository
public class BasketPaymentDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	        // 장바구니 결제 정보 DB 저장
			public int paymentInsert1(PaymentVO vo) {
				return sqlSession.insert("jeonju.greenmarket.mapper.basketPaymentMapper.paymentInsert1", vo);
			}
}
