package jeonju.greenmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.ItemVO;

@Repository
public class ItemDAO {
	private static final String namespace = "jeonju.greenmarket.mapper.itemMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	// 신선식품 > 채소 상품 전체 목록 조회
	public List<ItemVO> itemList(ItemVO vo) {
		List<ItemVO> itemList = sqlSession.selectList("jeonju.greenmarket.mapper.itemMapper.itemList", vo);
		return itemList;
	}
	
	
	// 신선식품 > 곡류 상품 전체 목록 조회
	public List<ItemVO> itemList1(ItemVO vo) {
		List<ItemVO> itemList1 = sqlSession.selectList("jeonju.greenmarket.mapper.itemMapper.itemList1", vo);
		return itemList1;
	}
	
	
	
	// 상품 상세보기
	public List<ItemVO> itemDetail (String itemNo) {
		List<ItemVO> itemDetail = sqlSession.selectList("jeonju.greenmarket.mapper.itemMapper.itemDetail", itemNo);
		return itemDetail;
	}
	
	public List<ItemVO> getAllItems(int category_no){
		List<ItemVO> items = sqlSession.selectList(namespace + ".getAllItems", category_no);
        
        // 리스트 출력
        System.out.println(items);
        
        return items;
	}
	
}
