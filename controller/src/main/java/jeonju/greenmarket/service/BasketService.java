package jeonju.greenmarket.service;

import java.util.List;
import java.util.Map;

import jeonju.greenmarket.vo.BasketVO;

public interface BasketService {

    int insertProductIntoBasket(BasketVO vo); 
	
	boolean isProductInBasket(BasketVO vo);
	
	Map<String, List> myBasketList(BasketVO basketVO);
	
	int updateItemCnt(BasketVO vo);
	
	int deleteItemInBasket(BasketVO vo);
	
	int updateIschecked(BasketVO vo);
}
