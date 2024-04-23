package jeonju.greenmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.AdminItemDAO;
import jeonju.greenmarket.vo.ItemVO;
import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.ShippingCostVO;

@Service
public class AdminItemServiceImpl implements AdminItemService {

	@Autowired
	AdminItemDAO itemDAO;
	
	// 상품관리 상품등록
	@Override
	public int insert(ItemVO vo) {
		
		return itemDAO.insert(vo);
	}

	// 상품관리 상품조회, 상품검색
	@Override
	public List<ItemVO> list(SearchVO vo) {
		
		return itemDAO.list(vo);
	}
	
	// 상품코드 중복 확인
	@Override
	public int checkDuplicate(String productCode) {
		return itemDAO.checkDuplicate(productCode);
	}
	
	// 수정할 해당 상품정보 불러오기
	@Override
	public ItemVO selectOneByItemNo(String itemNo) {
		return itemDAO.selectOneByItemNo(itemNo);
	}
	
	// 상품정보 수정
	@Override
	public int updateItem(ItemVO vo) {
		return itemDAO.updateItem(vo);
	}

	// 상품 삭제
	@Override
	public int deleteItems(String itemNo) {
		return itemDAO.deleteItems(itemNo);
	}
	
	// 지역별 추가배송비 등록
	@Override
	public int shippingcost(ShippingCostVO vo) {
		return itemDAO.shippingcost(vo);
	}

}









