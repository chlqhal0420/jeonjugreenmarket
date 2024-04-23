package jeonju.greenmarket.service;

import java.util.List;

import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.UserVO;

public interface AdminUserService {
	
	// 관리자 회원 검색 
	List<UserVO> list(SearchVO vo);
	
	// 관리자페이지 회원목록 상세보기
	UserVO selectOneByCreatedBy(int createdBy);
	
	
	// 회원 상태 변경
	void updateStatus(UserVO user);
	
	// 회원 정보 수정
	int updateUser(UserVO vo);
}
