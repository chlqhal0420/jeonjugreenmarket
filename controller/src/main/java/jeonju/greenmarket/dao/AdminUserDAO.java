package jeonju.greenmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.UserVO;

@Repository
public class AdminUserDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 회원관리 검색 기능 
	public List<UserVO> list(SearchVO vo) {
		List<UserVO> list = sqlSession.selectList("jeonju.greenmarket.mapper.adminUserMapper.selectAll", vo);
		
		return list;
	}
	
	// 관리자 회원관리 회원목록 상세보기
	public UserVO selectOneByCreatedBy(int createdBy) {
		return sqlSession.selectOne("jeonju.greenmarket.mapper.adminUserMapper.selectOneByCreatedBy", createdBy);
	}
	
	// 회원 상태 업데이트
	public void updateStatus(UserVO user) {
	    sqlSession.update("jeonju.greenmarket.mapper.adminUserMapper.updateStatus", user);
	}
	
	
	// 회원 정보 수정
	public int updateUser(UserVO vo) {
		
		return sqlSession.update("jeonju.greenmarket.mapper.adminUserMapper.updateUser", vo);
	}

}
