package jeonju.greenmarket.service;

import java.util.List;

import jeonju.greenmarket.vo.CategoryVO;

public interface CategoryService {
	//카테고리 등록
	int categoryinsert(CategoryVO vo);

	//카테고리 중복확인
	int checkDuplicateCategory (CategoryVO vo);
	
	//카테고리 목록 조회
	List<CategoryVO> categoryList() throws Exception;

	//카테고리 삭제
	int deleteCategory(String categoryName);

	//최신 카테고리 기본키
	int recentCategoryNo();
}