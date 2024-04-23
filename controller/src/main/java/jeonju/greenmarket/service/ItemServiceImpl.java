package jeonju.greenmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.ItemDAO;
import jeonju.greenmarket.vo.ItemVO;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired	
	ItemDAO itemDAO;
	
	// 신선식품 > 채소 상품 전체 목록 조회 
	@Override
	public List<ItemVO> itemList(ItemVO vo) {
		return itemDAO.itemList(vo);
	}

	// 상품 상세보기
	@Override
	public List<ItemVO> itemDetail(String itemNo) {
		return itemDAO.itemDetail(itemNo);
	}
	
	// 메인 페이지 상품목록 조회
	@Override
    public List<ItemVO> getAllItems(int category_no) {
		 List<ItemVO> items = itemDAO.getAllItems(category_no);
	        
	        // 리스트 출력
	        System.out.println(items);
	        
	        return items;
    }
	
	// 신선식품 > 곡류 상품 전체 목록 조회 
	@Override
	public List<ItemVO> itemList1(ItemVO vo) {
		return itemDAO.itemList1(vo);
	}
}
