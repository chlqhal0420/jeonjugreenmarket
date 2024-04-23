package jeonju.greenmarket.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.UserDAO;
import jeonju.greenmarket.vo.UserVO;

@Service
public class UserServiceImpl implements UserService { 
	
    @Autowired
    UserDAO userDAO;
	
    @Override
    public int insert(UserVO vo) {
        return userDAO.insert(vo);
    }

    // 아이디 중복 확인 로직 추가
    @Override
    public boolean isUserIdAvailable(String userid) {
    
    	 // UserDAO의 findUserByUsername 메서드를 호출하여 username에 해당하는 사용자가 존재하는지 확인
        UserVO user = userDAO.findUserByUserId(userid);
     // user가 null이면 해당 username을 가진 사용자가 존재하지 않음을 의미하므로 true 반환
        return user == null;
    }
    
    public int update(UserVO vo) {
    	return userDAO.updatePassword(vo);
    }

	@Override
	public Map<String,Object> findById(String userid) {
		return userDAO.findById(userid);
	}
	
	@Override
	public UserVO selectOneWithCreatedBy(int createdBy) {
		return userDAO.selectOneWithCreatedBy(createdBy);
	}
	public int updateUser(UserVO vo) {
    	return userDAO.updateUser(vo);
    }
	
	public int deleteUser(int createdBy) {
		return userDAO.deleteUser(createdBy);
	}
}
