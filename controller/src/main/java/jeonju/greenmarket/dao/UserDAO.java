package jeonju.greenmarket.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.UserVO;

@Repository
public class UserDAO {

    @Autowired
    SqlSession sqlSession; 
    
    public int insert(UserVO vo) {
        return sqlSession.insert("jeonju.greenmarket.mapper.userMapper.insert", vo);
    } 
    
    // 아이디 중복 확인을 위한 메서드
    public UserVO findUserByUserId(String userid) {
        return sqlSession.selectOne("jeonju.greenmarket.mapper.userMapper.findUserByUserId", userid);
    }
    
    // 이름과 전화번호로 사용자 조회 메서드
    public UserVO findByNameAndPhone(UserVO userVO) {
        return sqlSession.selectOne("jeonju.greenmarket.mapper.userMapper.findByNameAndPhone", userVO);
    }
    
    // 아이디와 전화번호로 사용자 조회 메서드
    public UserVO findByIdAndPhone(UserVO userVO) {
        return sqlSession.selectOne("jeonju.greenmarket.mapper.userMapper.findByIdAndPhone", userVO);
    }
    
    // 아이디로 회원정보 가져오기
    public Map<String,Object> findById(String userid) {
        return sqlSession.selectOne("jeonju.greenmarket.mapper.userMapper.selectLogin", userid);
    }
    
    //비밀번호 변경
    public int updatePassword(UserVO vo) {
        return sqlSession.update("jeonju.greenmarket.mapper.userMapper.updatePassword", vo);
    }
    
    //회원번호로 회원 정보가져오기
    public UserVO selectOneWithCreatedBy(int createdBy) {
        return sqlSession.selectOne("jeonju.greenmarket.mapper.userMapper.selectOneWithCreatedBy", createdBy);
    }
    
    //회원정보 수정하기
    public int updateUser(UserVO vo) {
    	return sqlSession.update("jeonju.greenmarket.mapper.userMapper.updateUser", vo);
    }
    
    //회원탈퇴
    public int deleteUser(int createdBy) {
        return sqlSession.update("jeonju.greenmarket.mapper.userMapper.deleteUser", createdBy);
    }
}