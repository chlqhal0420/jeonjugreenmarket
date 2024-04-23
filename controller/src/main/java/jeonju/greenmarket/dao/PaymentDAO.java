package jeonju.greenmarket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.PaymentVO;

@Repository
public class PaymentDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 결제 정보 DB 저장
	public int paymentInsert(PaymentVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.paymentMapper.paymentInsert", vo);
	}
}
