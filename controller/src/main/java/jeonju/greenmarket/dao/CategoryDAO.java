package jeonju.greenmarket.dao;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.CategoryVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
@Repository
public class CategoryDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 카테고리 등록
	public int categoryinsert(CategoryVO vo) {
		return sqlSession.insert("jeonju.greenmarket.mapper.categoryMapper.categoryinsert", vo);
	}
	
	// 카테고리 중복확인
	public int checkDuplicateCategory(CategoryVO vo) {
	    return sqlSession.selectOne("jeonju.greenmarket.mapper.categoryMapper.checkDuplicateCategory", vo);
	}
	
	 // 카테고리 목록 조회 메서드
    public List<CategoryVO> categoryList() {
        return sqlSession.selectList("jeonju.greenmarket.mapper.categoryMapper.categoryList");
    }
    
    // 카테고리 삭제
    public int deleteCategory (String categoryName) {
    	return sqlSession.delete("jeonju.greenmarket.mapper.categoryMapper.deleteCategory", categoryName);
    }
    
    // 최신 카테고리 기본키
    public int recentCategoryNo () {
    	return sqlSession.selectOne("jeonju.greenmarket.mapper.categoryMapper.recentCategoryNo");
    }
}
