package jeonju.greenmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.UserDAO;
import jeonju.greenmarket.vo.UserVO;

@Service
public class FindUserServiceImpl implements FindUserService{

	  private final UserDAO userDAO;
	
	  @Autowired
	    public FindUserServiceImpl(UserDAO userDAO) {
	        this.userDAO = userDAO;
	    }
	
	  @Override
	    public boolean verifyUser(UserVO vo) {
	        return userDAO.findByNameAndPhone(vo) != null;
	    }

	@Override
	public UserVO selectOne(UserVO vo) {
		return userDAO.findByNameAndPhone(vo);
	}
	
	
	 @Override
	    public boolean verifyUserPass(UserVO vo) {
	        return userDAO.findByIdAndPhone(vo) != null;
	    }
}
