package jeonju.greenmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.AdminUserDAO;
import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.UserVO;

@Service
public class AdminUserServiceImpl implements AdminUserService{
	
	@Autowired
	AdminUserDAO adminuserDAO;
	
	// 관리자 회원관리 검색기능
	@Override
	public List<UserVO> list(SearchVO vo) {
		return adminuserDAO.list(vo);
	}

	// 회원상세보기
	@Override
	public UserVO selectOneByCreatedBy(int createdBy) {
	
		return adminuserDAO.selectOneByCreatedBy(createdBy);
	}

	// 회원상태 수정
	@Override
	public void updateStatus(UserVO user) {
	    adminuserDAO.updateStatus(user);
	}
	
	// 회원정보 수정
	@Override
	public int updateUser(UserVO vo) {
	
		return adminuserDAO.updateUser(vo);
	}

	
	
	
	
}
