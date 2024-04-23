package jeonju.greenmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.ItemVO;

@Repository
public class BasketDAO {
	@Autowired
	SqlSession sqlSession;
	//장바구니에 상품 추가
	  public int insertProductIntoBasket(BasketVO vo) { return sqlSession.insert(
	  "jeonju.greenmarket.mapper.basketMapper.insertProductIntoBasket", vo); }
	
	//장바구니에 해당 상품이 존재하는지 확인
	public boolean selectCountInBasket(BasketVO vo) {
		String result = sqlSession.selectOne("jeonju.greenmarket.mapper.basketMapper.selectCountInBasket", vo);
		
		return Boolean.parseBoolean(result);
	}
	
	public List<BasketVO> selectBasketList(BasketVO basketVO) throws DataAccessException {
		List<BasketVO> basketList= sqlSession.selectList("jeonju.greenmarket.mapper.basketMapper.selectBasketList", basketVO);
		return basketList;
	}
	
	
	public ItemVO selectItem(BasketVO basket) throws DataAccessException{
		return sqlSession.selectOne("jeonju.greenmarket.mapper.basketMapper.selectItem", basket);
	}
	
	public int updateItemCnt(BasketVO vo) {
		 return sqlSession.update("jeonju.greenmarket.mapper.basketMapper.updateItemCnt", vo);
	}
	public int deleteItemInBasket(BasketVO vo) {
		 return sqlSession.delete("jeonju.greenmarket.mapper.basketMapper.deleteOneItemInBasket", vo);
	}
	
	public int updateIschecked(BasketVO vo) {
		 return sqlSession.update("jeonju.greenmarket.mapper.basketMapper.updateIschecked", vo);
	}
}
