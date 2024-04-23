package jeonju.greenmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.OrderVO;

@Repository
public class AdminOrderDAO {
	@Autowired
	SqlSession sqlSession;
	
	
	// 취소한 상품 내역 조회
	public List<OrderVO> cancel(OrderVO vo) {
		List<OrderVO> cancel = sqlSession.selectList("jeonju.greenmarket.mapper.adminOrderMapper.cancel", vo);
		return cancel;
	}
	
	// 고객요청 취소건 개수 표시
	public int countCancel () {
		return sqlSession.selectOne("jeonju.greenmarket.mapper.adminOrderMapper.countCancel");
	}
	
}
