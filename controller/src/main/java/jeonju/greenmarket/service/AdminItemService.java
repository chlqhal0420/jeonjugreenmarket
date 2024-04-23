package jeonju.greenmarket.service;

import java.util.List;

import jeonju.greenmarket.vo.ItemVO;
import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.ShippingCostVO;

public interface AdminItemService {
	
	
	// 상품관리 상품등록
	int insert(ItemVO vo);
	
	// 상품관리 검색기능, 상품조회
	List<ItemVO> list(SearchVO vo);
	
	// 상품코드 중복 확인
	int checkDuplicate (String productCode);
	
	// 수정할 상품정보 불러오기
	ItemVO selectOneByItemNo(String itemNo);
	
	// 상품정보 수정
	int updateItem(ItemVO vo);
	
	// 상품  삭제
	int deleteItems(String itemNo);
	
	// 지역별 추가배송비 등록
	int shippingcost(ShippingCostVO vo);
}
