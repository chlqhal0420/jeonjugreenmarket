package jeonju.greenmarket.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import jeonju.greenmarket.vo.ItemVO;
import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.ShippingCostVO;


@Repository
public class AdminItemDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	// 상품관리 상품등록
	public int insert(ItemVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.adminItemMapper.insert", vo);
	}
	
	// 상품관리 검색기능, 상품조회
	public List<ItemVO> list(SearchVO vo) {
		List<ItemVO> list = sqlSession.selectList("jeonju.greenmarket.mapper.adminItemMapper.selectAll", vo);
		
		return list;
	}
	
	// 상품코드 중복 확인
	public int checkDuplicate(String productCode) {
		return sqlSession.selectOne("jeonju.greenmarket.mapper.adminItemMapper.checkDuplicate", productCode);
	}
	
	// 수정할 해당 상품정보 불러오기
	public ItemVO selectOneByItemNo(String itemNo) {
		return sqlSession.selectOne("jeonju.greenmarket.mapper.adminItemMapper.selectOneByItemNo", itemNo);
	}
	
	// 상품 정보 수정
	public int updateItem(ItemVO vo ) {
		return sqlSession.update("jeonju.greenmarket.mapper.adminItemMapper.updateItem", vo);
	}
	
	// 상품 삭제
	public int deleteItems(String itemNo) {
		return sqlSession.update("jeonju.greenmarket.mapper.adminItemMapper.deleteItems", itemNo);
	}
	
	// 지역벼 추가 배송비 등록
	public int shippingcost(ShippingCostVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.adminItemMapper.shippingcost", vo);
	}
}
