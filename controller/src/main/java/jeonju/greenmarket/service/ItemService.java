package jeonju.greenmarket.service;

import java.util.List;

import jeonju.greenmarket.vo.ItemVO;

public interface ItemService {
	
	//신선식품 > 채소 상품 전체 목록 조회 
	List<ItemVO> itemList(ItemVO vo);
	
	//신선식품 > 곡류 상품 전체 목록 조회 
	List<ItemVO> itemList1(ItemVO vo);
	
	//상품 상세보기
	List<ItemVO> itemDetail(String itemNo);
	
	// 모든 상품 조회
	List<ItemVO> getAllItems(int category_no);
}
