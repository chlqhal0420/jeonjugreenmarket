package jeonju.greenmarket.service;

import jeonju.greenmarket.vo.UserVO;

public interface FindUserService {
	boolean verifyUser(UserVO vo);
	boolean verifyUserPass(UserVO vo);
	UserVO selectOne(UserVO vo);
}
