package jeonju.greenmarket.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.CategoryDAO;
import jeonju.greenmarket.vo.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	CategoryDAO categoryDAO;
	
	// 카테고리 등록
	@Override
	public int categoryinsert(CategoryVO vo) {

		return categoryDAO.categoryinsert(vo);
	}
	
	// 카테고리 중복 확인
	@Override
	public int checkDuplicateCategory(CategoryVO vo) {
		
		return categoryDAO.checkDuplicateCategory(vo);
	}

	// 카테고리 목록 조회
	@Override
	public List<CategoryVO> categoryList() throws Exception{
		
		List<CategoryVO> categoryList = categoryDAO.categoryList();
		
		return categoryList;
	}

	// 카테고리 삭제
	@Override
	public int deleteCategory(String categoryName) {
		return categoryDAO.deleteCategory(categoryName);
	}
	
	// 최신카테고리 기본키
	@Override
	public int recentCategoryNo() {
		return categoryDAO.recentCategoryNo();
	}
	
	

}
