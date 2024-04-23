package jeonju.greenmarket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.BasketDAO;
import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.ItemVO;

@Service
public class BasketServiceImpl implements BasketService {
	 @Autowired
	 BasketDAO basketDAO;
	 
	 //장바구니에 상품추가
		
	@Override 
	public int insertProductIntoBasket(BasketVO vo) {
		return basketDAO.insertProductIntoBasket(vo); 
	}
	 

	//장바구니에 해당 상품이 있는지 확인
	@Override
	public boolean isProductInBasket(BasketVO vo) {
		
		return basketDAO.selectCountInBasket(vo);
	}


	@Override
	public Map<String, List> myBasketList(BasketVO basketVO) {
		Map<String, List> basketMap = new HashMap<String, List>();
		List<BasketVO> myBasketList = basketDAO.selectBasketList(basketVO); //장바구니페이지에 표시할 장바구니 정보
		if(myBasketList.size()==0) { //장바구니에 아무것도 없으면 null 리턴
			return null;
		}
		List<ItemVO> myItemList = new ArrayList<ItemVO>();
		for(BasketVO item : myBasketList) {
			ItemVO vo = basketDAO.selectItem(item);
			myItemList.add(vo);
		}
//		myItemList = basketDAO.selectItemList(myBasketList); //상품정보 조회
		basketMap.put("myBasketList", myBasketList); //장바구니정보
		basketMap.put("myItemList", myItemList);// 상품정보를 basketMap 에 저장하여 반환
		return basketMap;
	}


	@Override
	public int updateItemCnt(BasketVO vo) {
		return basketDAO.updateItemCnt(vo);
	}


	@Override
	public int deleteItemInBasket(BasketVO vo) {
		return basketDAO.deleteItemInBasket(vo);
	}


	@Override
	public int updateIschecked(BasketVO vo) {
		return basketDAO.updateIschecked(vo);
	}

	
	
}
