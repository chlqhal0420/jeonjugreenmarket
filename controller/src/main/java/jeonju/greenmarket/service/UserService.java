package jeonju.greenmarket.service;

import java.util.Map;

import jeonju.greenmarket.vo.UserVO;

public interface UserService {
	int insert(UserVO vo);
	int update(UserVO vo);
	boolean isUserIdAvailable(String userid);
	Map<String,Object> findById(String userid);
	UserVO selectOneWithCreatedBy(int createdBy);
	int updateUser(UserVO vo);
	int deleteUser(int createdBy);
}
